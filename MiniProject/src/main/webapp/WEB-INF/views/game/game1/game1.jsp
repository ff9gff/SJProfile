<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> 축구 팀 맞추기 </title>
	</head>
	
	<body>
		
		<a href="../../logout.do">로그아웃</a>
		<a href="../../index.do">홈으로</a>
		<label>${mem_id}님 환영합니다.</label>
	
		<br><br>
		
		<iframe src="../../game1/photoCheck.do" frameborder="0"	width="100%" height="380"></iframe>
		<iframe src="../../chat/chatajaxform2.do" frameborder="0" width="100%" height="380"></iframe>

	</body>
</html>