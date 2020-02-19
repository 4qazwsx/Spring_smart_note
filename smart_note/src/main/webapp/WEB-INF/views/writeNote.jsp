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
brightPen{
	background-color: yellow;
}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

var i = 1;
var selText = window.getSelection();

$(document).ready(function(){
	$("input").change(function(){//input 내용이 바뀔때마다
		addFileForm();
	});
	/* $("div").change(function(){
		addContent();
	})
	$("#note_contentInput").mouseup(function(a){
		
	}); */
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

function tagAction(tag){//추가할 태그의 이름을 매개변수로 받는 함수
	if(selText.isCollapsed == 0){//드래그한 부분이 있을 때만 실행
		
		const selTextRange = selText.getRangeAt(0);//선택 영역을 Range오브젝트로 선언
		const parent_node = selTextRange.commonAncestorContainer.parentNode;//선택 영역의 부모 노드
		const child_nodes = selTextRange.commonAncestorContainer.childNodes;//선택 영역의 자식 리스트
		
		if(parent_node.nodeName == tag.toUpperCase()){//이미 같은 태그가 적용된 곳일 경우
			alert("tag 중복 감지");
			for(var i = 0 ; i < child_nodes.length ; i++){
				alert(child_nodes.item(i).nodeName);
			}
			
		}else{//해당 태그가 적용되지 않은 영역일 경우
			const newNode = document.createElement(tag);//새로운 노드를 만들어 태그 속성을 추가
			for(var i = 0 ; i < child_nodes.length ; i++){
				alert(child_nodes.item(i).nodeName);
			}
			newNode.appendChild(selTextRange.extractContents());//노드에 기존의 내용을 이동
			selTextRange.insertNode(newNode);//선택영역에 노드를 삽입
		}
	}
}

function addContent(){
	$("#note_content").val($("#note_contentInput").html());
}

</script>

</head>
<body>
<%@include file="header.jsp" %>

<input hidden="hidden"/>
	<table id="note_table">
		
		<tr id="note_tools">
			<td>
				<button onclick="tagAction('bold')">볼드</button>
				<button onclick="tagAction('brightPen')">형광펜</button>
				<button onclick="tagAction('h1')">h1</button>
				<button onclick="tagAction('h2')">h2</button>
				<button onclick="tagAction('h3')">h3</button>
				<button onclick="asd()">aaaaaaaaaaaa</button>
			</td>
		</tr>
		
		<form action="noteSave.do" enctype="multipart/form-data" method="post" id="noteForm">
		
		<tr id="note_title">
			<td><input type="text" placeholder="제목" name="note_title" id="note_titleInput"></td>
		</tr>
		
		<tr>
			<td id="note_uploadFileList">
			<input type="file" name="file1" id="file1">
			</td>
		</tr>
		
		<tr id="note_contents">
			<td><div contentEditable="true" id="note_contentInput"></div></td>
			<td><input type="hidden" name="note_contents" id="note_contents"></td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name="sub_id" value="${param.sub_id }">
				<input onclick="addContent()" type="submit" value="저장">
			</td>
		</tr>
		</form>
		
	</table>
</body>
</html>