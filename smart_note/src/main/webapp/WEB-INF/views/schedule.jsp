<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대필노트</title>
<%@include file="header.jsp" %>
<style type="text/css">

#schedule_table{
	width: 100%;
}

#schedule_table td{
	height: 150px;
	width: 10%;
	text-align: center;
}

</style>

<!-- <script type="text/javascript" src="js/jquery.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

//시간표에서 드래그한 부분의 색
var drag_color = "#D5D5D5";
//시간표 배경 색
var bg_color = "white";

//시간표 line 수 초기화
var line = 9;

//드래그 이벤트 상태 변수 / 1일 경우 드래그 중
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
	//
	var startTd;
	var endTd;
	//직전의 td id를 저장
	var lastTd;
	
	function colorRollback(endTd){//매개변수로 td의 아이디 값을 받는다.
		//endTd = $(this).attr('id');
		
		
		day = startTd.split("_")[1];
		start_time = startTd.split("_")[2];
		end_time = endTd.split("_")[2];
		end_time++;
		drag = 0;
		//저장한 기록을 통해 드래그한 부분의 색을 원래대로 돌린다
		for(var i = start_time ; i < end_time ; i++){
			$("#schedule_"+day+"_"+i).css({"background-color": bg_color});
		}
	}
	
	$('.schedule_event').mousedown(function(){
		//alert($(this).attr('bgcolor'));

		if(drag==0 && !$(this).attr('bgcolor')){
			$(this).css({"background-color": drag_color});
			startTd = $(this).attr('id');
			lastTd =  $(this).attr('id');
			drag = 1;	
		}

	});
	
	$('.schedule_event').mouseover(function(){
		if(drag==1){
			
			var this_day = $(this).attr('id').split("_")[1];
			var this_time = $(this).attr('id').split("_")[2];
			start_day = startTd.split("_")[1];
			var last_time = lastTd.split("_")[2];
			//드래그를 위로 한 경우
			if(this_time < last_time){
				
				$("#"+lastTd).css({"background-color": bg_color});
				
				if(this_time < startTd.split("_")[2]){
					drag = 0;
					return;
				}
			}
			//옆으로 드래그한 경우
			if(this_day != start_day){
				colorRollback($(this).attr('id'))
				return;
			}
			if($(this).attr('bgcolor')){
				colorRollback($(this).attr('id'))
				$(this).css({"background-color": $(this).attr('bgcolor')});
				return;
			}
			
			$(this).css({"background-color": drag_color});
			lastTd =  $(this).attr('id');
		}
	});
	
	$('.schedule_event').mouseup(function(){
		if(drag==1){ 
			colorRollback($(this).attr('id'));
			var day = $(this).attr('id').split("_")[1];
			var start_time = startTd.split("_")[2]; 
			var end_time = $(this).attr('id').split("_")[2];
			
			window.open("schdulePopup.do?day="+day+"&start_time="+start_time+"&end_time="+end_time,
						"과목 선택",
						"width = 1000px, height = 650px, top = 50%, left = 50%, location = no, toolbars = no")
			return;
		}
	});
}

/* function deleteSubjectTime(sub_id){
	alert(sub_id);
	
	$.ajax({
		
		url : "deleteSubjectTime.do",
		data : "sub_id=" + sub_id,
		success : function(s){
			//reload();
		}
		
	})
} */

function subjectSetting(sub_id){
	window.open("subjectSetting.do?sub_id="+sub_id,
			"과목 설정",
			"width = 500, height = 500, top = 50%, left = 50%, location = no, toolbars = no")
}

$(document).ready(function(){
	dragEvent();
})
</script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
<table border="1px" id="schedule_table">
	<!-- <tr>
		<td id="linePlusButton" onclick="linePlus()">+</td>
		<td id="lineMinusButton" onclick="lineMinus()">-</td>
	</tr> -->
	<tr>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
		<th>일</th>
	</tr>
	<c:forEach begin="0" end="9" var="sub">
		<tr id="schedule_line_${sub}">
		<c:forEach begin="0" end="6" var="day">
				<td bgcolor="${daysSubList[day][sub].getSub_color()}"
					class="schedule_event"
					id="schedule_${day}_${sub}"
					onmousedown="">
					<p bgcolod="white">${daysSubList[day][sub].getSub_name()}</p>
					<c:if test="${daysSubList[day][sub] != null }">
						<button onclick="location.href='deleteSubjectTime.do?sub_id=${daysSubList[day][sub].getSub_id()}&time=${sub }&day=${day }'">시간표에서 빼기</button>
						<button onclick="location.href='myNote.do?sub_id=${daysSubList[day][sub].getSub_id()}'">필기목록</button>
						<button onclick="subjectSetting('${daysSubList[day][sub].getSub_id()}')">과목설정</button>
						<button onclick="location.href='writeNote.do?sub_id=${daysSubList[day][sub].getSub_id()}'">새 필기</button>
					</c:if>
				</td>
		</c:forEach>
		</tr>
	</c:forEach>
</table>
</body>
</html>