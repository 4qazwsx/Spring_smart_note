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
	width: 100px;
}

</style>

<!-- <script type="text/javascript" src="js/jquery.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

//시간표 line 수 초기화
var line = 9;

//드래그 이벤트 상태 변수
var drag = 0;

function linePlus(){
	//alert(line);
	
	//시간표 라인 수가 15 보다 작다면 새로운 행을 만든다.
	if(line < 16) {
		line++;
		var trTd = $("<tr id='schedule_line_"+line+"'><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
		$("#schedule_table").append(trTd);
	}
	else alert("시간표가 너무 길어집니다.");
	
}
function lineMinus(){
	//시간표 라인 수가 0보다 크다면 행 삭제 불가
	if(line > 0) {
		$("#schedule_line_"+line).remove();
		line--;
	}
	
}

function dragEvent(){
	var startTd;
	var endTd;
	$('.schedule_event').click(function(){
		//alert($(this).attr('id'));
		if(drag==1){
			//$(".schedule_event").css({"background-color": "white"});
			endTd = $(this).attr('id');
			
			
			day = endTd.split("_")[1];
			start_time = startTd.split("_")[2];
			end_time = endTd.split("_")[2];
			end_time++;
			drag = 0;
			//.schedule_?_?
			for(var i = start_time ; i < end_time ; i++){
				$("#schedule_"+day+"_"+i).css({"background-color": "white"});
			}
			
			return;
		}
		if(drag==0){
			$(this).css({"background-color": "gold"});
			startTd = $(this).attr('id');
			drag = 1;	
		}

	});
	
	$('.schedule_event').mouseover(function(){
		if(drag==1){
			$(this).css({"background-color": "gold"});
		}
	});
	
	$('.schedule_event').mouseup(function(){

	});
}

$(document).ready(function(){
	dragEvent();
})
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
	<c:forEach begin="0" end="9" var="sub">
		<tr id="schedule_line_${sub}">
		<c:forEach begin="0" end="6" var="day">
				<td bgcolor="${daysSubList[day][sub].getSub_color()}"
					class="schedule_event"
					id="schedule_${day}_${sub}"
					onmousedown="">
					${daysSubList[day][sub].getSub_name()}
				</td>
		</c:forEach>
		</tr>
	</c:forEach>
</table>
</body>
</html>