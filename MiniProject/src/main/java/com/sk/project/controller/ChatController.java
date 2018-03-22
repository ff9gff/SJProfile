package com.sk.project.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping(value = "/chat/chatajaxform2.do")
	public String board124( HttpSession session, Model model ) throws Exception {
		
		String mem_id = (String) session.getAttribute("mem_id");
		
		if (mem_id == null) {
			logger.info("채팅 로그인 실패");
			model.addAttribute("code", "game2");
			return "login/loginform";
		} else {
			logger.info("채팅 로그인 성공");
			return "chat/chatajaxform2";
		}
		
	}
	
	@RequestMapping(value = "/chat/chatajax.do", method = RequestMethod.GET)
	public String chatman( HttpSession session, HttpServletRequest request , String chat, Model model ) throws Exception {
		
		String message = "";
		BufferedReader br = new BufferedReader(new FileReader("C:/Study/chat.txt"));
		String line;
		while ((line = br.readLine()) != null) {
			message += line;
		}

		br.close();
		
		String chat2 = request.getParameter("chat");
		// String chat3 = (String) application.getAttribute("message");
		
		// session.getServletContext(); 어플리케이션개체
		// session.getSession
			
		String mem_id = (String) session.getAttribute("mem_id");
		/* // 세션에 저장된 아이디 정보를 가져온다.
		String userid = (String) session.getAttribute("userid");
		if ( userid == null ) {	
			response.sendRedirect("loginform.jsp?code=chat");
		}	 */
		
		// 처음 서비스를 시작하면 제일 처음 걸리는 곳
		// 처음 서비스를 시작하면 메시지 객체는 null!
		// 26라인 이후엔 message 객체는 String(문자열) 타입이다.
	/*	if (message == null) {
			message = "";
			application.setAttribute("message", message);
			message = "채팅서비스<br>";
		}
		
		if ( chat != null ) {	
			message += "[" + mem_id + "] " + chat + "<br>";
			application.setAttribute("message", message);
			message = "OK!"; 
		}*/
		
		logger.info("에이작스: " + chat);
		model.addAttribute("message", chat);
		model.addAttribute("mem_id", mem_id);
		
		return null;
		
	}
	
	
	
}
