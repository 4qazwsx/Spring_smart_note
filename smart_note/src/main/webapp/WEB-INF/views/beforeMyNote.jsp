<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>     
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
	
$(function() {
	$('#note_Search').click(function() {
		$.ajaxSetup({
			type     : 'POST',
			url      : 'note_Search.jsp',
			dataType : 'text',
			success  : function(msg) {
				$('#msg').html(msg);
			}

		});
		$.ajax({
			data : sendData
		});

	});

});
	
	
	
	
	
	
</script>

</head>

<body>
<h2>마이 노트</h2>
<table>
  <tr><th>선호 과목 </th></tr>
  
 

</table>
  <form>
    <input type="button" id="note_Search" value="내 노트 검색">
	<button id="top_logout_button" class="addSub_Button" onclick="addSub()">과목추가</button>
    <button id="top_my_page_button" class="delSub_Button" onclick="delSub()" >과목삭제</button>
  </form>
	<div id="msg"></div>
	
	
</body>
</html>