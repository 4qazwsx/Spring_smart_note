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
	border: 1px solid black;
}

bold{
	font-weight: bold;
}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

var i = 1;
var selText = document.getSelection();

$(document).ready(function(){
	$("input").change(function(){
		addFileForm();
	});
	$("#note_contentInput").mouseup(function(a){
		//alert("selText->"+selText);
		//alert("selText.ancherNode->"+selText.ancherNode);
		//alert("selText.anchorOffset->"+selText.anchorOffset);
		//alert("selText.focusNode->"+selText.focusNode);
		//alert("selText.focusOffset->"+selText.focusOffset);
		//alert("selText.isCollapsed->"+selText.isCollapsed);
		//alert("selText.rangeCount->"+selText.rangeCount);
		//alert("document.selection.createRange().text->"+document.selection.createRange().text);
	});
	$("#note_contentInput").append("<h1>asd</h1>");
	$("#note_contentInput").append("<h2><bold>asdasd</bold></h2>");
	$("#note_contentInput").append("asdasdasd");
})

function addFileForm(){
	if($("#file"+i).val()){//파일이 있으면
		i++;
		$("#note_uploadFileList").append("<br><input type='file' name='file"+i+"' id='file"+i+"'>");
		$(document).ready(function(){//새로 만든 input 태그에 이벤트 갱신
			$("input").change(function(){
				addFileForm();
			});
		});
	}
}

function addTag(tag){
	if(selText.isCollapsed == 0){//드래그한 부분이 있을 때
		selText.val() = "1111111"
		$("#note_contentInput").append("<"+tag+">asdasd</"+tag+">");	
	}
}

</script>

</head>
<body>
<%@include file="header.jsp" %>

<input hidden="hidden"/>
	<table id="note_table">
		
		<tr id="note_tools">
			<td>
				<button onclick="addTag('bold')">볼드</button>
				<button onclick="addTag('brightPen')">형광펜</button>
			</td>
		</tr>
		
		<form action="" enctype="multipart/form-data" method="post" id="noteForm">
		
		<tr id="note_title">
			<td><input type="text" placeholder="제목" name="note_title" id="note_titleInput"></td>
		</tr>
		
		<tr>
			<td id="note_uploadFileList">
			<input type="file" name="file1" id="file1">
			</td>
		</tr>
		
		<tr id="note_contents">
			<td>
			<div contentEditable="true" id="note_contentInput"></div>
			</td>
			<!-- <td><textarea placeholder="내용" name="note_content" id="note_contentInput" style="resize:none"></textarea></td> -->
		</tr>
		<tr>
			<td><input type="submit" value="저장"></td>
		</tr>
		</form>
		
	</table>
</body>
</html>