<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#myNoteListBody{
	text-align: center;
}
#myNoteListTable{
	display: inline-table;
	width: 60%;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<%@include file="header.jsp" %>
<br><br>
<div id="myNoteListBody">
	<h2>${param.subName} 노트 목록</h2>
	<br>
	<table id="myNoteListTable" border="1px">
		<th>노트제목</th><th>작성일</th><th>공유</th>
		<c:forEach var="note" items="${noteList}">
			<tr>
				<td><a href="updateNote.do?note_id=${note.getNote_id() }">${note.getNote_title() }</a></td>
				<td>${note.getNote_date() }</td>
				<td>
				<c:if test="${note.getNote_share() == '1' }">
					<input type="checkbox">
				</c:if>
				<c:if test="${note.getNote_share() == '0' }">
					<input type="checkbox" checked>
				</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>