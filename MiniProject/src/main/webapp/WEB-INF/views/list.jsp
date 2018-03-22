<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<a href=writeform.do> 글쓰기</a><br>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('../images/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="../images/table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"><img src="../images/table_left.gif" width="5" height="30" /></td>
  </tr>


<c:forEach var="board" items="${boardList}">

<tr height="25" align="center">
	<td>&nbsp;</td>
	<td>${board.idx}</td>
	<td align="left">
	<a href="view.do?idx=${board.idx}&pg=${pg}">${board.title}</a>
	</td>
	<td align="center">${board.uname}</td>
	<td align="center">${board.time}</td>
	<td align="center">${board.hit}</td>
	<td>&nbsp;</td>
	<tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
</tr>

</c:forEach>
   

 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
</table>