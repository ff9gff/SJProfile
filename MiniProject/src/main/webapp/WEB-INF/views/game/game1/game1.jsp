<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> 축구 팀 맞추기 </title>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
	</head>
	
	<style>
		body {
			background-color: black
		}
	</style>
	
	<body>
		
	<%-- 	<a href="../../logout.do">로그아웃</a>
		<a href="../../index.do">홈으로</a>
		<label>${mem_id}님 환영합니다.</label> --%>
	
		
		
		<!-- Navbar -->
		<div class="w3-top">
			<div class="w3-bar w3-black w3-card">
				<c:choose>
					<c:when test="${empty mem_id}">
						<a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
						<a href="../../index.do" class="w3-bar-item w3-button w3-padding-large">HOME</a> 
						<a href="#login" class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그인</a>
						<a href="member/registerform.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회원가입</a>
						<!-- <a href="chat/chatajaxform.jsp">채팅</a> -->
						<a href="board/board.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">게시판</a>
					</c:when>
					
					<c:when test="${mem_id eq 'admin'}">
						<a href="../../index.do" class="w3-bar-item w3-button w3-padding-large">HOME</a> 
						<a class="w3-bar-item w3-button w3-padding-large w3-hide-small"	>${mem_id}님 환영합니다.</a> 
						<a href="../../logout.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그아웃</a>
						<a href="member/listmember.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회원관리</a>
						<a href="board/board.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">게시판</a> 
						<!-- <a href="chat/chatajaxform.jsp">채팅</a> -->
					</c:when>
					
					<c:otherwise>
						<a href="../../index.do" class="w3-bar-item w3-button w3-padding-large">HOME</a> 
						<a class="w3-bar-item w3-button w3-padding-large w3-hide-small"	>${mem_id}님 환영합니다.</a> 
						<a href="../../logout.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그아웃</a>
						<a href="board/board.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">게시판</a> 
					</c:otherwise>
				</c:choose>
				
				<div class="w3-dropdown-hover w3-hide-small">
					<button class="w3-padding-large w3-button" title="Game"> 
						GAME <i class="fa fa-caret-down"></i>
					</button>
					<div class="w3-dropdown-content w3-bar-block w3-card-4">
						<a href="../../game/game1/game1.do" class="w3-bar-item w3-button">축구</a> 
						<a href="../../game/game2/game2.do" class="w3-bar-item w3-button">50</a>
					</div>
				</div>
				<a href="javascript:void(0)"
					class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i
					class="fa fa-search"></i></a>
			</div>
		</div>
		
		<br><br>
		
		<iframe src="../../game1/photoCheck.do" frameborder="0"	width="100%" height="380"></iframe>
		<iframe src="../../chat/chatajaxform2.do" frameborder="0" width="100%" height="380"></iframe>

	</body>
</html>