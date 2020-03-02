<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과목 설정</title>
<style type="text/css">
#popup_body{
	text-align: center;
}
#color_palette{
	height: 20px;
	display: inline-table;
}
#color_palette td{
	width: 20px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function subjectSettingSubmit(){
	var params = $("#subjectSettingForm").serialize();
	$.ajax({
		url : "changeSubjectSetting.do",
		data : params,
		success : function(s){
			opener.parent.location.reload();
			window.close();
		}
	})
}
function delectSubjectSubmit(){
	var params = $("#subjectSettingForm").serialize();
	$.ajax({
		url : "delectSubject.do",
		data : params,
		success : function(s){
			opener.parent.location.reload();
			window.close();
		}
	})
}
function copy_color(color){
	$("#subject_color").val(color);
}
</script>
</head>
<body>
<br>
<br>
<br>
<div id="popup_body">
	<h2>${subject.getSub_name()}</h2>
	<form id="subjectSettingForm" action="subjectSettingSubmit()">
		<input hidden="hidden"/>
		<input type="hidden" name="sub_id" value="${subject.getSub_id() }">
		<br>
		<table id="color_palette" border="1px">
			<tr>
				<td bgcolor="#FFA7A7" onclick="copy_color('#FFA7A7')"></td>
				<td bgcolor="#FFC19E" onclick="copy_color('#FFC19E')"></td>
				<td bgcolor="#FAED7D" onclick="copy_color('#FAED7D')"></td>
				<td bgcolor="#CEF279" onclick="copy_color('#CEF279')"></td>
				<td bgcolor="#B2CCFF" onclick="copy_color('#B2CCFF')"></td>
				<td bgcolor="#B5B2FF" onclick="copy_color('#B5B2FF')"></td>
				<td bgcolor="#D1B2FF" onclick="copy_color('#D1B2FF')"></td>
			</tr>
		</table>
		<p>과목 색 <input type="text" id="subject_color" name="sub_color" value="${subject.getSub_color() }"></p>
	</form>
	<button onclick="subjectSettingSubmit()">확인</button>
	<button onclick="delectSubjectSubmit()">과목 삭제</button>
</div>
</body>
</html>