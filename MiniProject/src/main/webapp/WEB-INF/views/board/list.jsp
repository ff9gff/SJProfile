<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sk.project.manager.*, com.sk.project.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Խ���</title>
</head>
<body>
	
	${mem_id}�� ȯ���մϴ�.
	
	
	<a href="../index.do">Ȩ����</a>
	<a href="../logout.do">�α׾ƿ�</a>
	<a href=writeform.do> �۾���</a><br>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('../images/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="../images/table_left.gif" width="5" height="30" /></td>
   <td width="73">��ȣ</td>
   <td width="379">����</td>
   <td width="73">�ۼ���</td>
   <td width="164">�ۼ���</td>
   <td width="58">��ȸ��</td>
   <td width="7"><img src="../images/table_left.gif" width="5" height="30" /></td>
  </tr>


<c:forEach var="board" items="${boardList}">

<tr height="25" align="center">
	<td>&nbsp;</td>
	<td>${board.idx}</td>
	<td align="left">
	<a href="view.do?idx=${board.idx}&pg=1">${board.title}</a>
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
</body>
</html>