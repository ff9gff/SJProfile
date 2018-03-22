<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.io.*, com.sk.project.controller.*, com.sk.project.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>

<body>
	
	<a href="../index.jsp">메인화면(3초 후 자동 이동)</a>


	<table border=1>

		<c:forEach var="member" items="${memberList}">

			<tr>
				<td>${member.mem_id}</td>
				<td>${member.mem_name}</td>
				<c:choose>
					<c:when test="${member.gender == 'man'}">
						<td><img src="../images/man.png" width=20 height=20></td>
					</c:when>
					<c:otherwise>
						<td><img src="../images/woman.png" width=20 height=20></td>
					</c:otherwise>
				</c:choose>
				<td><a href="deletePlease.do?mem_id=${member.mem_id}">삭제</a></td>
				<td><a href="updateStart.do?mem_id=${member.mem_id}">수정</a></td>
		</c:forEach>
				
	</table>

</body>
</html>