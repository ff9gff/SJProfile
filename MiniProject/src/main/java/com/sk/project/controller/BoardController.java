package com.sk.project.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sk.project.service.BoardService;
import com.sk.project.service.MemberService;
import com.sk.project.vo.Board;

@Controller
public class BoardController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/board/board.do", method = RequestMethod.GET)
	public String game1(HttpSession session, Model model) throws Exception {

		String mem_id = (String) session.getAttribute("mem_id");

		if (mem_id == null) {
			String code = "board";
			model.addAttribute("code", code);
			return "login/loginform";
		} else {
			List<Board> list = boardService.select();
			if (list.size() > 0) {
				model.addAttribute("boardList", list);
			}
			return "board/list";
		}

	}

	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String game2(HttpSession session, Model model) throws Exception {

		// String mem_id = (String) session.getAttribute("mem_id");

		List<Board> list = boardService.select();

		if (list.size() > 0) {
			model.addAttribute("boardList", list);
		}
		return "board/list";
	}

	@RequestMapping(value = "/board/login.do", method = RequestMethod.POST)
	public String board(@RequestParam(value = "mem_id") String mem_id, @RequestParam(value = "mem_pwd") String mem_pwd,
			@RequestParam(value = "code") String code, HttpSession session, Model model) throws Exception {

		int result = memberService.isExist(mem_id, mem_pwd);

		String check = (String) session.getAttribute("mem_id");

		if ((check == null) && (result == 1) && code.equals("board")) {
			session.setAttribute("mem_id", mem_id);
			List<Board> list = boardService.select();
			if (list.size() > 0) {
				model.addAttribute("boardList", list);
			}
			return "redirect:/board/list";
		} else {
			model.addAttribute("code", "board");
			return "login/loginform";
		}

	}

	@RequestMapping(value = "/board/writeform.do")
	public String writeform() {
		return "board/write";
	}

	@ResponseBody
	@RequestMapping(value = "/board/write.do")
	public String write(Board board) throws Exception {

		/*
		 * for( MultipartFile file : mp) { byte[] bytes = file.getBytes();
		 * BufferedOutputStream stream = new BufferedOutputStream( new
		 * FileOutputStream(new File("d:/download/" +
		 * file.getOriginalFilename()))); stream.write(bytes); stream.close();
		 * board.file = file.getOriginalFilename(); }
		 */

		int result = boardService.insert(
				new Board(0, board.getTitle(), board.getMemo(), board.getUname(), board.getPassword(), null, 0));
		
		if (result == 1) {
			return "<script language=javascript>alert('board insert success.'); location.href='list.do';</script>";
		} else {
			return "<script language=javascript>alert('board insert failed.'); location.href='list.do';</script>";
		}
	}

	/*
	 * @RequestMapping(value = "/list.do") public String
	 * list(@RequestParam(value="pg", defaultValue="1") int pg, Model model)
	 * throws Exception { model.addAttribute("ml", dao.select());
	 * model.addAttribute("pg", pg); return "board/list"; }
	 */

	@RequestMapping(value = "/list.do")
	public ModelAndView list(@RequestParam(value = "pg", defaultValue = "1") int pg) throws Exception {
		ModelAndView mav = new ModelAndView();

		List<Board> list = boardService.select();

		if (list.size() > 0) {
			mav.addObject("boardList", list);
			mav.addObject("pg", pg);
			mav.setViewName("board/list");
		} else {
			mav.setViewName("board/list");
		}
		return mav;
	}

	@RequestMapping(value = "/board/view.do")
	public String view(int idx, int pg, Model model) throws Exception {
		boardService.increse(idx);
		model.addAttribute("board", boardService.selectByIdx(idx));
		model.addAttribute("pg", 1);
		return "board/view";
	}

	@RequestMapping(value = "/board/deleteform.do")
	public String deleteform(int idx, int pg, Model model) {
		model.addAttribute("idx", idx);
		model.addAttribute("pg", pg);
		return "board/delete";
	}

	@ResponseBody
	@RequestMapping(value = "/board/delete.do", produces = "text/html;charset=UTF-8")
	public String write(int pg, int idx, String password) throws Exception {
		boolean check = boardService.check(idx, password);
		if (check) {
			boardService.delete(idx);
			return "<script language=javascript>window.alert('해당 글을 삭제하였습니다.');location.href='list.do?pg=" + pg
					+ "';</script>";
		}
		return "<script language=javascript>self.window.alert('비밀번호를 틀렸습니다.');location.href='javascript:history.back()';</script>";
	}

	@RequestMapping(value = "/board/modifyform.do")
	public String modifyform(int idx, int pg, Model model) throws Exception {
		model.addAttribute("idx", idx);
		model.addAttribute("pg", pg);
		model.addAttribute("board", boardService.selectByIdx(idx));
		return "board/modify";
	}

	@ResponseBody
	@RequestMapping(value = "/board/modify.do", produces = "text/html;charset=UTF-8")
	public String modify(int idx, int pg, Board board) throws Exception {
		if (boardService.check(idx, board.getPassword())) {
			boardService.update(board);
			return "<script language=javascript>self.window.alert('글이 수정되었습니다.');location.href='view.do?idx=" + idx
					+ "&pg=" + pg + "';</script>";
		}
		return "<script language=javascript>self.window.alert('비밀번호를 틀렸습니다.');location.href='javascript:history.back()';</script>";
	}

	// @RequestMapping(value="/download.do")
	// public void download(String filename, HttpServletResponse response)
	// throws Exception{
	//
	// byte fileByte[] = FileUtils.readFileToByteArray(new File("d:/download/" +
	// filename));
	//
	// response.setContentType("application/octet-stream");
	// response.setContentLength(fileByte.length);
	// response.setHeader("Content-Disposition", "attachment; fileName=\"" +
	// URLEncoder.encode(filename,"UTF-8")+"\";");
	// response.setHeader("Content-Transfer-Encoding", "binary");
	// response.getOutputStream().write(fileByte);
	// response.getOutputStream().flush();
	// response.getOutputStream().close();
	// }

	/*
	 * @Override public void setBeanFactory(BeanFactory context) throws
	 * BeansException {lo
	 * 
	 * Test m = (Test)context.getBean("t");
	 * 
	 * System.out.println("----------------------> " + m.getTmp());
	 * 
	 * 
	 * }
	 */
}
