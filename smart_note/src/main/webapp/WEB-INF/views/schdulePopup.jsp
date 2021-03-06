<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시간표 추가</title>
<style type="text/css">
#popup_body{
	text-align: center;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function addSchuleTimeSubmit(){
	var params = $("#addSchduleTimeForm").serialize();
	$.ajax({
		url : "addSchduleTime.do",
		data : params,
		success : function(s){
			opener.parent.location.reload();
			window.close();
		}
	})
}

function newSubjectSubmit(){
	var params = $("#newSubjectForm").serialize();
	$.ajax({
		url : "newSubject.do",
		data : params,
		success : function(sub_id){
			//새 과목을 DB에 추가 후 추가한 과목을 시간표에 추가
			params = 'day=${param.day }&start_time=${param.start_time }&end_time=${param.end_time }&sub_id='+sub_id
			$.ajax({
				url : "addSchduleTime.do",
				data : params,
				success : function(s){
					opener.parent.location.reload();
					window.close();
				}
			})
		}
		
	})
}
</script>

</head>
<body>
<br>
<br>
<br>
<div id="popup_body">
	<h2>
	시간표 추가
	</h2>
	
	<span>
	<c:choose>
		<c:when test="${param.day == 0 }">월</c:when>
		<c:when test="${param.day == 1 }">화</c:when>
		<c:when test="${param.day == 2 }">수</c:when>
		<c:when test="${param.day == 3 }">목</c:when>
		<c:when test="${param.day == 4 }">금</c:when>
		<c:when test="${param.day == 5 }">토</c:when>
		<c:when test="${param.day == 6 }">일</c:when>
	</c:choose>
	요일 ${param.start_time+1 }교시~ ${param.end_time+1 }교시
	</span>
	
	<form id="addSchduleTimeForm">
		<input hidden="hidden"/>
		<input type="hidden" name="day" value="${param.day }">
		<input type="hidden" name="start_time" value="${param.start_time }">
		<input type="hidden" name="end_time" value="${param.end_time }">
		<select name="sub_id" id="subId">
			<c:forEach items="${subList }" var="sub">
				<option value="${sub.getSub_id() }">${sub.getSub_name() }</option>
			</c:forEach>
		</select>
		<button onclick="addSchuleTimeSubmit()">시간표에 추가</button>
	</form>
	
	<br>
	<br>
	
	<h3>새 과목 추가</h3>
	<form id="newSubjectForm">
		<input hidden="hidden"/>
		<input type="text" id="subName" name="sub_name" placeholder="추가할 과목명...">
		<br><br>
		<textarea rows="7" cols="22" id="subDescription" name="sub_description" placeholder="과목 설명..."></textarea>
		<br><br>
		<button onclick="newSubjectSubmit()">새 과목 추가</button>
	</form>
	
</div>
</body>
</html>