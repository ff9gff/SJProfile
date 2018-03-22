package com.sk.project.controller;

import javax.servlet.http.HttpServletResponse;
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

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MemberService memberService;
	
/*	@RequestMapping(value = "/loginIndex1.do", method = RequestMethod.GET)
	public String loginFirst(HttpSession session, Model model) throws Exception {
	
		String mem_id = (String) session.getAttribute("mem_id");
		
		if (mem_id == null) {
			String code = "index1";
			logger.info("로그인창 접속 확인1 :" + code);
			model.addAttribute("code", code);
			return "login/loginform";
		} else {
			return "redirect:index";
		}
	}*/
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String loginFirst() {
		logger.info("홈화면으로");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginTEss(@RequestParam(value="mem_id") String mem_id, @RequestParam(value="mem_pwd") String mem_pwd, @RequestParam(value="code") String code, HttpSession session, Model model) throws Exception {
		
		int result = memberService.isExist(mem_id, mem_pwd);
		
		String check = (String) session.getAttribute("mem_id");
		
		System.out.println("검색결과: " + result);
		
		if ((check == null) && (result == 1) && code.equals("index1")) {
			session.setAttribute("mem_id", mem_id);
			logger.info("일반 로그인 성공"); 
			return "redirect:/";
		} else {
			logger.info("일반 로그인 실패");
			model.addAttribute("code", "index1");
			return "login/loginform";
		}
		
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response, Model model) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
}
