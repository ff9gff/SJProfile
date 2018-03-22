<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.*"%>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<%

	// application 객체
	// 프로젝트에 한정된 공유 공간

	String chat = request.getParameter("chat");
	String message = (String) application.getAttribute("message");
		
	String mem_id = (String) session.getAttribute("mem_id");

	// 처음 서비스를 시작하면 제일 처음 걸리는 곳
	// 처음 서비스를 시작하면 메시지 객체는 null!
	// 26라인 이후엔 message 객체는 String(문자열) 타입이다.
	if (message == null) {
		message = "";
		application.setAttribute("message", message);
		message = "채팅서비스<br>";
	}
	
	if ( chat != null ) {
		message += "[" + mem_id + "] " + chat + "<br>";
		application.setAttribute("message", message);
		message = "OK!"; 
	}
	
%>

<%=message%>
