<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대필노트</title>
<style type="text/css">

#schedule_table tr{
	height: 100px;
}

</style>

<!-- <script type="text/javascript" src="js/jquery.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

var line = 0;

function linePlus(){
	//alert(line);
	
	if(line < 15) {
		line++;
		var trTd = $("<tr id='schedule_line_"+line+"'><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
		$("#schedule_table").append(trTd);
	}
	else alert("시간표가 너무 길어집니다.")
	
}

function lineMinus(){
	//alert(line);
	$("#schedule_line_"+line).remove();
	if(line > 0) line--;
	
}

	
</script>
</head>
<body>
<table border="1px" width="80%" id="schedule_table">
	<tr>
		<td id="linePlusButton" onclick="linePlus()">+</td>
		<td id="lineMinusButton" onclick="lineMinus()">-</td>
	</tr>
	<tr>
		<td>월</td>
		<td>화</td>
		<td>수</td>
		<td>목</td>
		<td>금</td>
		<td>토</td>
		<td>일</td>
	</tr>
	<tr height="200px" id="schedule_line_0">
		<td bgcolor="${param.color })">
			<%-- <c:if test="${sub.day == 0}"> --%>
			<c:if test="${param.day == 0}">
			</c:if>
		</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
</body>
</html>