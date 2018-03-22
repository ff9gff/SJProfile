package com.sk.project.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sk.project.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class GameController {

	private static final Logger logger = LoggerFactory.getLogger(GameController.class);

	@Autowired
	private MemberService memberService;

	// 게임1 클릭
	// 로그인 여부 확인 후 로그인창/게임창 선택
	@RequestMapping(value = "/game/game1/game1.do", method = RequestMethod.GET)
	public String game1(HttpSession session, Model model) {

		String mem_id = (String) session.getAttribute("mem_id");

		if (mem_id == null) {
			String code = "game1";
			logger.info("로그인창 접속 확인1 :" + code);
			model.addAttribute("code", code);
			return "login/loginform";
		} else {
			return "game/game1/game1";
		}

	}

	// 게임2 클릭
	// 로그인 여부 확인 후 로그인창/게임창 선택
	@RequestMapping(value = "/game/game2/game2.do", method = RequestMethod.GET)
	public String game2(HttpSession session, Model model) {

		String mem_id = (String) session.getAttribute("mem_id");

		if (mem_id == null) {
			String code = "game2";
			logger.info("로그인창 접속 확인1 :" + code);
			model.addAttribute("code", code);
			return "login/loginform";
		} else {
			return "game/game2/game2";
		}

	}

	// 로그인 된 상태에서 게임1 클릭
	@RequestMapping(value = "/game/game1/game1", method = RequestMethod.GET)
	public String shot1(HttpSession session, Model model) {
		logger.info("게임1 게시판 갈 수 있니>");
		String mem_id = (String) session.getAttribute("mem_id");
		return "game/game1/game1";
	}

	// 로그인 된 상태에서 게임2 클릭
	@RequestMapping(value = "/game/game2/game2", method = RequestMethod.GET)
	public String shot2(HttpSession session, Model model) {
		logger.info("게임2게시판 갈 수 있니>");
		String mem_id = (String) session.getAttribute("mem_id");
		return "game/game2/game2";
	}

	
	// 게임1을 통한 로그인 처리!
	@RequestMapping(value = "/game/game1/login.do", method = RequestMethod.POST)
	public String board(@RequestParam(value = "mem_id") String mem_id, @RequestParam(value = "mem_pwd") String mem_pwd,
			@RequestParam(value = "code") String code, HttpSession session, Model model) throws Exception {

		int result = memberService.isExist(mem_id, mem_pwd);
		String check = (String) session.getAttribute("mem_id");

		if ((check == null) && (result == 1) && code.equals("game1")) {
			session.setAttribute("mem_id", mem_id);
			logger.info("게임1 로그인 성공");
			return "redirect:/game/game1/game1";
		} else {
			logger.info("게임1 로그인 실패");
			model.addAttribute("code", "game1");
			return "login/loginform";
		}
	}

	// 게임2을 통한 로그인 처리!
	@RequestMapping(value = "/game/game2/login.do", method = RequestMethod.POST)
	public String board2(@RequestParam(value = "mem_id") String mem_id, @RequestParam(value = "mem_pwd") String mem_pwd,
			@RequestParam(value = "code") String code, HttpSession session, Model model) throws Exception {

		int result = memberService.isExist(mem_id, mem_pwd);
		String check = (String) session.getAttribute("mem_id");

		if ((check == null) && (result == 1) && code.equals("game2")) {
			session.setAttribute("mem_id", mem_id);
			logger.info("게임2 로그인 성공");
			return "redirect:/game/game2/game2";
		} else {
			logger.info("게임2 로그인 실패");
			model.addAttribute("code", "game2");
			return "login/loginform";
		}

	}

	@RequestMapping(value = "/game1/photoCheck.do")
	public String board124() throws Exception {
		return "game/game1/photoCheck";
	}

	@RequestMapping(value = "/game2/1to50.do")
	public String board12123() throws Exception {
		return "game/game2/1to50";
	}

}
