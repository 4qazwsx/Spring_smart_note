<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
bold{
	font-weight: bold;
}
brightPen{
	background-color: yellow;
}
#noteViewPageBody{
	text-align: center;
}
#noteTable{
	display: inline-table;
	width: 60%;
}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<br><br>
<div id="noteViewPageBody">
	<table border="1px #8C8C8C" id="noteTable">
		<tr>
			<td>제목</td><td>${note.getNote_title() }</td>
		</tr>
		<tr>
			<td>내용</td><td>${note.getNote_contents() }</td>
		</tr>
		<tr>
			<td><input type="button" value="뒤로가기"> </td>
			<td>
				공유<c:if test="${note.getNote_share() == '1' }">
						<input type="checkbox">
					</c:if>
					<c:if test="${note.getNote_share() == '0' }">
						<input type="checkbox" checked>
					</c:if>
			</td>
		</tr>
	</table>
</div>

</body>
</html>