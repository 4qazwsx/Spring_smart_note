<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="myNote_header.jsp"%>

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
<table id="content" class="hide">
    <thead>    
    </thead> 
    <tbody> 
         {{#subject}}
        <tr>
           
            <td><a class="sub_button"  value="{{sub_name}}">{{sub_name}}</a></td> 
           
        </tr> 
        {{/subject}}
    </tbody> 
</table>
</script>

<script type="text/javascript">	


$(document).ready(function(){

	 var furuitSrc= "";

	 $(document).on("click",".sub_button",function(){

			 var furuitSrc= $(this).attr("value");

	 		alert("내노트->"+furuitSrc); 
	 		window.location.href="<%=context%>/conc.do?furuitSrc="+furuitSrc;
	 });

 });
 

 
function note_Search(){
	str    = "";
	str2   = "";
	
	
	$('#note_Search').unbind('click');
	
	 console.log("getListDept Run");
	/* alert("dept-template getListDept Run->"); */  
	 var result = '${mem_id}';
	 var isEmpty = (result == "" || result == null || result == undefined || ( result != null && typeof result == "object" && !Object.keys(result).length ));
	   if(isEmpty){
		  alert("로그인 후 사용 가능합니다");
	      return  window.open("loginForm2.do"); ;
				 
	   }else{ 	 
		  alert(result+"님의 노트를 검색 합니다");
	   } 
	
	
	
	
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

			//핸들바 템플릿에 데이터를 바인딩해서 HTML 생성
			var html = template(data1);
			
			//생성된 HTML을 DOM에 주입
			$('#Dept_list3').append(html);
			

			 /* document.getElementById("note_Search").value = '내 노트 닫기'; */

			 var ns = document.getElementById("note_Search").value;
			 /* alert(ns) */
			
			 if(ns == '내 노트 열기'){
				 document.getElementById("note_Search").value = '내 노트 닫기';
				 
				 document.getElementById('note_Search').onclick = function close_note(){
					   
				        alert("닫겠습니까?")
				    	$("#content").remove();
				 document.getElementById("note_Search").value = '내 노트 열기';
				 
				 document.getElementById('note_Search').onclick = function open_note(){
					  /*  alert("열겠습니까") */	 
					   note_Search();
					 }
				 }

			 }else{
				 
				
				 document.getElementById("note_Search").value = '내 노트 열기';
			 }
			
			 
		}
	});
	
}
	    	
	    	
  
  


function addSub(){ 
	    var tc = new Array(); 
		var html = ''; 
	
		if (!frm.sub_name.value ) {
			alert("과목 입력하세요")
			return false
		} 

		 var result = '${mem_id}';
		 alert("result--->"+result);
		 
		 /* var isEmpty = function(value){ if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ return true }else{ return false } }; */
		
		 var isEmpty = (result == "" || result == null || result == undefined || ( result != null && typeof result == "object" && !Object.keys(result).length ));
		 if(isEmpty){
     		
			 alert("로그인 후 사용 가능합니다");
     		 
     		return  window.open("loginForm2.do"); 
     		
     	 }else{ 
     		 
     		var sub_name = $('#sub_name').val();
     		console.log("aaa");
     		
     		
     		$.ajax({
     			url:"<%=context%>/confirm.do",
     			data: {"sub_name":$('#sub_name').val()},
     			dataType:'json',
      			error:function(error){
      				
      			},
     			success:function(total){
     				 if(total > 0){ 
     					alert("이미 같은 과목이 있습니다!");
     				    $("#frm")[0].reset();} 
     				else{ 
     					alert("성공!");
     		     		alert(sub_name+"과목을 추가 합니다");      		     		
     		     		html += '<td>';  
     		    		html += '<a  class="sub_button" id= "kkk" value="'+sub_name+'">'+sub_name+'</a>'+
     		    		'<input type="button" value="삭제"  class="del_button" onclick="delSub('+"'"+sub_name+"'"+')">'; 
     		    		html += '</td>'; 
     		    		
     		    		$("#dynamicTable").append(html); 
     		    		$("#sub_name").val('');  
     		    		 
     		    		
     				
     				
     				 }
     				
     			}});
     		
     		
     	  } 
		 
}



function delSub(sub_name){ 

    alert("정말 삭제 하시겠습니까?");
	
    $("#dynamicTable").on("click", ".del_button", function () {
        $(this).parent().remove();

	});
    
    
    alert("삭제 sub_name--->"+sub_name);
    
    $.ajax({
			url:"<%=context%>/sub_delete.do",
			data: {"sub_name":sub_name},
			dataType:'json',
			error:function(error){
				
			},
			success:function(data){
				alert("삭제성공!")
			}});
    
    
    
    
                  
 
}	
		
 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 function noRefresh()
 {
     /* CTRL + N키 막음. */
     if ((event.keyCode == 78) && (event.ctrlKey == true))
     {
         event.keyCode = 0;
         return false;
     }
     /* F5 번키 막음. */
     if(event.keyCode == 116)
     {
         event.keyCode = 0;
         return false;
     }
 }
document.onkeydown = noRefresh;


</script>

<style type="text/css">

.sub_button {

    width:100px;

    background-color: #FAE0D4;

    border: none;

    color:#5F00FF; 

    padding: 15px 0;

    text-align: center;

    text-decoration: none; 

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;

    border-radius:10px;
}

.sub_button:hover {
    background-color: #D4F4FA;
}

/* .a{
position:absolute;

bottom:70px;

left:10px;
} */


</style>




</head>

<body>
<h1>내 노트</h1>
<div id="Dept_list3"></div>
	
	<div>
		<table style="border: 1px;" id="dynamicTable">
			<thead>
				<tr>
					<th><h1>선호 과목</h1></th>
                    
				</tr>
			</thead>	
		</table>
	</div>








	<!-- <h2>과목추가</h2> -->
	<!-- <form action="" name="frm" id="frm">
		 <input type="text" name="sub_name" id="sub_name"> 
		
		<input type="button" value="확인" id="submit" onclick="addSub()">   addSub()    sub_insert()
	</form> -->

	
	<!-- <input type="button" value="내 노트 검색"   onclick="note_Search()" >   -->             <!--   id="note_Search" -->
   <!--  <button id="note_Search" >내 노트 검색</button> -->
  <!--  <button id="close_note"   ">내 노트 닫기</button> -->


	<!-- this.onclick=null; -->

	


	
	<!-- <p>Dept_list: -->
	<!-- <div id="Dept_list"></div> -->

	
	<!-- <div id="Dept_list3"></div> -->


	<p>
</body>
</html>