<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과목추가</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<script id="dept-template" type="text/x-handlebars-template">
<table>
    <thead>
        <th>과목ID</th> 
        <th>과목이름</th> 
        
    </thead> 
    <tbody> 
         {{#subject}}
        <tr>
            <td>{{sub_id}}</td>
            <td><a href="">{{sub_name}}</a></td> 
        </tr> 
        {{/subject}}
    </tbody> 
</table>
</script>

<script type="text/javascript">	
function getListNote(){
	str    = "";
	str2   = "";

	console.log("getListDept Run");
	alert("dept-template getListDept Run->");  
	$.ajax({
		url:"<%=context%>/sendVO3.do",
		dataType:'json',
		success:function(data){
			var jsondata = JSON.stringify(data);
	        alert("jsondata->"+jsondata);
			$('#Dept_list').append(jsondata);  
			
			//핸들바 템플릿 가져오기
			var source = $("#dept-template").html(); 
			//핸들바 템플릿 컴파일
			var template = Handlebars.compile(source); 
			//핸들바 템플릿에 바인딩할 데이터
			var data1 = { subject: data}; 
/* 				var data = {
			    	users: [
			            { name: "홍길동1", id: "112", email: "aaa1@gmail.com" },
			            { name: "홍길동2", id: "113", email: "aaa2@gmail.com" },
			            { name: "홍길동3", id: "114", email: "aaa3@gmail.com" }
			        ]
}; */ 
			//핸들바 템플릿에 데이터를 바인딩해서 HTML 생성
			var html = template(data1);

			//생성된 HTML을 DOM에 주입
			$('#Dept_list3').append(html);
		}
	});
}



 
 
	
	
  function addSub() {
	 
		var sub_name = $('#sub_name').val();
		alert(sub_name+"를 추가 합니다"); 
		
		 $.ajax({
			url:"<%=context%>/addSubName.do",
			data:{sub_name : sub_name },
			dataType:'text',
           success : function(data){
                alert("success");
                //check.jsp에서 DB확인해서 출력은 index에서
                $("#msg").val(data);
                $("#msg").html(data);
                //$("#ajaxReturn").html("(ex)사용할 수 있는 ID입니다.");
            },
            error : function(){
                alert("error");
            }
 
	
 
	});	
  
	}
  
  
  <%-- function addFavSub() {
		 
	  var dynamicTag = '<input type="text" name="sub_name" />';
	  $("msg").html(dynamicTag);
		
		 $.ajax({
			url:"<%=context%>/addSubName.do",
			data:{sub_name : sub_name },
			dataType:'text',
         success : function(data){
              alert("success");
              //check.jsp에서 DB확인해서 출력은 index에서
              $("#msg").val(data);
              $("#msg").html(data);
              //$("#ajaxReturn").html("(ex)사용할 수 있는 ID입니다.");
          },
          error : function(){
              alert("error");
          }

	

	});	

	}
 --%>
  
  
  
  
  
	
</script>

</head>

<body>
	<h2>마이 노트</h2>
	<table>
		<tr>
			<th>선호 과목</th>
		</tr>

    

	</table>

    <a href=""><div id="msg"></div></a>

	<h2>추가과목</h2>
	<form action="">
		<input type="text" name="sub_name" id="sub_name">
		<p>
			<input type="button" value="확인" id="submit" onclick="addSub()">
		<p>
			
	</form>

	RestController LISTVO3:
	<input type="button" id="note_Search" value="내 노트 검색"
		onclick="getListNote()">



	<input type="button" id="note_Search" value="과목 추가"
		onclick="addFavSub()">
	
	<button id="top_my_page_button" class="delSub_Button"
		onclick="delSub()">과목삭제</button>
	<p>Dept_list:
	<div id="Dept_list"></div>

	Dept_list3:
	<div id="Dept_list3"></div>

	
	<p>
</body>
</html>