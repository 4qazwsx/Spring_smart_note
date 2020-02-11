<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#note_table{
	height : 1000px;
	width: 90%;
}
#note_table td{
}
#note_tools{
	height: 10%;
	
}
#note_title{
	height: 5%;
}
#note_uploadFileList{
	height: 10%;
}
#note_titleInput{
	height: 100%;
	width: 100%;
	font-size: 20px;
}

#note_contentInput{
	height: 100%;
	width: 100%;
}

</style>
</head>
<body>
<%@include file="header.jsp" %>
<form action="testpage">
	<table id="note_table">
		
		<tr id="note_tools">
			<td>note_tools</td>
		</tr>
		
		<tr id="note_title">
			<td><input type="text" placeholder="제목" name="note_title" id="note_titleInput"></td>
		</tr>
		
		<tr id="note_uploadFileList">
			<td><input type="file"> </td>
		</tr>
		
		<tr id="note_contents">
			<td><textarea  placeholder="내용" name="note_content" id="note_contentInput"></textarea></textarea> </td>
		</tr>
		
	</table>
</form>
</body>
</html>