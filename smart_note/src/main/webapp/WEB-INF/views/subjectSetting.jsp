<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과목 설정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function subjectSettingSubmit(){
	var params = $("#subjectSettingForm").serialize();
	$.ajax({
		url : "newSubject.do",
		data : params,
		success : function(s){
			opener.parent.location.reload();
			window.close();
		}
		
	})
}
</script>
</head>
<body>
<h2>${subject.getSub_name()}</h2>
<form id="subjectSettingForm">
<p>과목 색 <input type="text" name="sub_color" value="${subject.getSub_color() }"></p>
</form>
<button onclick="subjectSettingSubmit()">확인</button>
<button onclick="">과목 삭제</button>
</body>
</html>