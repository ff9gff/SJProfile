<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*, com.sk.project.controller.*, com.sk.project.vo.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*,javax.sql.*, javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>	
<body>


회원 수정<br>

	
<form action="updatePlease.do" method="post"> 
아이디 : <input type="text" name="mem_id" readonly value=${member.mem_id } ><br/>
패스워드 : <input type="password" name="mem_pwd" value=${member.mem_pwd } ><br/>

이름 : <input type="text" name="mem_name" value=${member.mem_name }><br/>

성별 : <input type="radio" value="man" name="gender" ${checked[0]}>남자
	<input type="radio" value="woman" name="gender" ${checked[1]}>여자<br/>
	
취미 : 
<input type="checkbox" value="운동 " name="hobby" ${checked[2]}>운동
<input type="checkbox" value="영화" name="hobby" ${checked[3]}>영화
<input type="checkbox" value="여행 " name="hobby" ${checked[4]}>여행
<input type="checkbox" value="게임" name="hobby" ${checked[5]}>게임
<input type="checkbox" value="독서" name="hobby" ${checked[6]}>독서	
<input type="checkbox" value="낚시 " name="hobby" ${checked[7]}>낚시<br/>
<input type="submit" value="보내기"/> 
<input type="reset" value="다시입력"/>

</form>
	
 
</body>
</html>