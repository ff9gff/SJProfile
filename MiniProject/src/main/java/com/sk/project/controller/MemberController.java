package com.sk.project.controller;

import java.util.List;

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
import com.sk.project.vo.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// 회원가입 하러가기
	@RequestMapping(value = "/member/registerform.do", method = RequestMethod.GET)
	public String registerHome(HttpSession session, Model model) {
		return "member/registerform";
	}

	// 회원가입 절차
	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public String registerStart(Member member, Model model) throws Exception {

		int result = memberService.insert(member);

		if (result > 0) {
			logger.info("가입 성공");
			return "member/listmember";
		} else {
			logger.info("가입 실패");
			return "member/listmember";
		}

	}

	// 전체 회원 조회
	@RequestMapping(value = "/member/listmember.do", method = RequestMethod.GET)
	public String list(HttpSession session, Model model) throws Exception {

		List<Member> list = memberService.select();

		logger.info(">>> gdgd");

		String mem_id = (String) session.getAttribute("mem_id");

		if (mem_id.equals("admin")) {
			logger.info("전체 회원 조회!");
			model.addAttribute("memberList", list);
			return "member/listmember";
		} else {
			logger.info("전체 회원 조회 실패!");
			return "";
		}

	}

	// 회원 정보 수정하러가기
	@RequestMapping(value = "/member/updateStart.do", method = RequestMethod.GET)
	public String updateMemberGO(@RequestParam(value = "mem_id") String mem_id, Model model) throws Exception {

		Member member = memberService.selectById(mem_id);

		String[] checked = new String[] { "", "", "", "", "", "", "", "" };

		if (member.getGender().equals("man")) {
			checked[0] = "checked";
		} else if (member.getGender().equals("woman")) {
			checked[1] = "checked";
		}

		if (member.getHobby().contains("운동")) {
			checked[2] = "checked";
		}
		if (member.getHobby().contains("영화")) {
			checked[3] = "checked";
		}
		if (member.getHobby().contains("여행")) {
			checked[4] = "checked";
		}
		if (member.getHobby().contains("게임")) {
			checked[5] = "checked";
		}
		if (member.getHobby().contains("독서")) {
			checked[6] = "checked";
		}
		if (member.getHobby().contains("낚시")) {
			checked[7] = "checked";
		}

		model.addAttribute("member", member);
		model.addAttribute("checked", checked);
		return "member/editmemberform";
	}

	// 회원 정보 수정
	@RequestMapping(value = "/member/updatePlease.do", method = RequestMethod.POST)
	public String updateMember(Member member, Model model) throws Exception {

		int result = memberService.update(member);

		if (result > 0) {
			logger.info("회원 정보 수정 성공");
			return "member/listmember";
		} else {
			logger.info("회원 정보 수정 실패");
			return "member/listmember";
		}

	}

	@RequestMapping(value = "/member/deletePlease.do", method = RequestMethod.GET)
	public String deleteMember(@RequestParam(value = "mem_id") String mem_id) throws Exception {

		int result = memberService.delete(mem_id);

		if (result > 0) {
			logger.info("회원 삭제 성공");
			return "member/listmember";
		} else {
			logger.info("회원 삭제 실패");
			return "member/listmember";
		}

	}

}
