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
<table id="content" class="hide">
    <thead>
       
        <th><h2>내 노트<h2></th> 
       
    </thead> 
    <tbody> 
         {{#subject}}
        <tr>
           
            <td><a href="" class="sub_button" id="sub_button">{{sub_name}}</a></td> 
           
        </tr> 
        {{/subject}}
    </tbody> 
</table>
</script>

<script type="text/javascript">	


  function note_Search(){
	str    = "";
	str2   = "";
	 $('#note_Search').unbind('click');
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

			//핸들바 템플릿에 데이터를 바인딩해서 HTML 생성
			var html = template(data1);
			
			//생성된 HTML을 DOM에 주입
			$('#Dept_list3').append(html);
			

			 /* document.getElementById("note_Search").value = '내 노트 닫기'; */

			 var ns = document.getElementById("note_Search").value;
			 alert(ns)
			
			 if(ns == '내 노트 검색'){
				 document.getElementById("note_Search").value = '내 노트 닫기';
				 
				 document.getElementById('note_Search').onclick = function close_note(){
					    alert("닫겠습니까?")
				    	$("#content").remove();
				 document.getElementById("note_Search").value = '내 노트 검색';
				 
				 document.getElementById('note_Search').onclick = function open_note(){
					   alert("열겠습니까")	 
					   note_Search();
					 }
				 }

			 }else{
				  document.getElementById("note_Search").value = '내 노트 검색';
			 }

		}
	});

}


	/*  if($('#note_Search').text()=="내 노트 검색"){
		 $('#note_Search').text("내 노트 닫기"); 
		
	    
	 }
	
	else{
		$('#note_Search').text("내 노트 검색");
	}   */
	
	 /* $('#note_Search').click(function () {
		 alert("hahahhah")
		 close_note();
		 $('#note_Search').text("내 노트 검색");
		
	    	});
	
	 $('#note_Search').click(function () {
		return; 
		
		
	    	}); */
  
  
	    	
	    	
	    	
	    	
	    	
	    	
  
  


function addSub(){ 
		var tc = new Array(); 
		var html = ''; 
		
		var sub_name = $('#sub_name').val();
		

		 if (!frm.sub_name.value ) {
			alert("과목 입력하세요")
			return false
		} 
		
		 
	
		 
		 
		 
		 
		 
		
     	alert(sub_name+"를 추가 합니다"); 
		
		
		
		html += '<tr>'; 
		html += '<td>'+'<a href="" class="sub_button">'+sub_name+'</a>'+
		'<input type="button" value="삭제"  class="del_button" onclick="delSub()">'+'</td>'; 
		html += '</tr>';
		
		$("#dynamicTable").append(html); 
		$("#sub_name").val(''); 
		}


function delSub(){ 
	 
	

     alert("정말 삭제 하시겠습니까?")
	
  /* $('#dynamicTable  tbody tr:last').remove();   */
		
	
     $("#dynamicTable").on("click", ".del_button", function () {
             $(this).parent().parent().remove();

    	});

}	
		
 
 
function db_sub(){
	str    = "";
	str2   = "";
	console.log("getListDept Run");
	alert("dept-template getListDept Run->");  
	$.ajax({
		url:"<%=context%>/sendVO3.do",
		dataType:'json',
		success:function(data){
			var jsondata = JSON.stringify(data);
			alert(jsondata);
			
			
			
			
			
			/* for(var ele in jsondata){ 
				 
					console.log(jsondata[ele]); } 
 */
			
 
			var i=[{"t_no":"120","t_content":"test11","t_writer":"여성게","obtain":"0","t_date":"2018-         04-27"},
	            {"t_no":"119","t_content":"test10","t_writer":"여성게","obtain":"0","t_date":"2018-04-27"},
	            {"t_no":"118","t_content":"test9","t_writer":"여성게","obtain":"0","t_date":"2018-04-27"},
	            {"t_no":"117","t_content":"test8","t_writer":"여성게","obtain":"0","t_date":"2018-04-27"},
	            {"t_no":"114","t_content":"test7","t_writer":"여성게","obtain":"0","t_date":"2018-04-27"},
	            {"t_no":"113","t_content":"test6","t_writer":"여성게","obtain":"0","t_date":"2018-04-26"},
	            {"t_no":"110","t_content":"hi","t_writer":"여성게","obtain":"0","t_date":"2018-04-26"},
	            {"t_no":"109","t_content":"test5","t_writer":"여성게","obtain":"0","t_date":"2018-04-26"},
	            {"t_no":"107","t_content":"test4","t_writer":"여성게","obtain":"0","t_date":"2018-04-26"},
	            {"t_no":"76","t_content":"test3","t_writer":"여성게","obtain":"1","t_date":"2018-04-25"},
	            {"t_no":"75","t_content":"test2","t_writer":"여성게","obtain":"0","t_date":"2018-04-25"},
	            {"t_no":"74","t_content":"test1","t_writer":"여성게","obtain":"1","t_date":"2018-04-25"},
	            {"t_no":"72","t_content":"hello","t_writer":"여성게","obtain":"0","t_date":"2018-04-25"},
	            {"t_no":"49","t_content":"spring create","t_writer":"여성게","obtain":"1","t_date":"2018-04-25"},
	            {"t_no":"29","t_content":"도전과제","t_writer":"여성게","obtain":"1","t_date":"2018-04-25"},
	            {"t_no":"28","t_content":"서블릿공부","t_writer":"여성게","obtain":"0","t_date":"2018-04-25"},
	            {"t_no":"8","t_content":"헬로우","t_writer":"여성게","obtain":"1","t_date":"2018-04-24"},
	            {"t_no":"7","t_content":"안녕하세요.","t_writer":"여성게","obtain":"0","t_date":"2018-04-24"},
	            {"t_no":"5","t_content":"오늘할일4","t_writer":"여성게","obtain":"1","t_date":"2018-04-24"},
	            {"t_no":"1","t_content":"오늘할일1","t_writer":"여성게","obtain":"1","t_date":"2018-04-24"}];
	    
			for(var ele in i){
		        /*for(var ele2 in i[ele]){
		            console.log(i[ele][ele2]);
		        } */
		        console.log(i[ele].t_no);
		        console.log(i[ele].t_content);
		        console.log(i[ele].t_writer);
		        console.log(i[ele].obtain);
		        console.log(i[ele].t_date);
		    }


		


	
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

		
			
			
			
			/* $.each(jsondata,function(idx,row){
        	   if(jsondata[idx].sub_name == "국어"){
        		   return jsondata[idx];
        	   }
           return"";
           }); */
			
          
           
           
		}
			
			
			/* for(var ele in jsondata){ 
				console.log(jsondata[ele].mem_id); } */

			
	});

	
}
 
 
 
 
 
 
 
 
 
 
	
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




</style>




</head>

<body>
	

	<div>
		<table style="border: 1px;" id="dynamicTable">
			<thead>
				<tr>
					<th>선호 과목</th>
                    
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>








	<h2>과목추가</h2>
	<form action="" name="frm">
		<input type="text" name="sub_name" id="sub_name">
		
		<input type="button" value="확인" id="submit" onclick="addSub()">   <!-- addSub() -->
	</form>

	
	<input type="button" value="내 노트 검색" id="note_Search" onclick="note_Search()">
   <!--  <button id="note_Search" >내 노트 검색</button> -->
  <!--  <button id="close_note"   ">내 노트 닫기</button> -->


	<!-- this.onclick=null; -->

	


	
	<p>Dept_list:
	<div id="Dept_list"></div>

	
	<div id="Dept_list3"></div>


	<p>
</body>
</html>