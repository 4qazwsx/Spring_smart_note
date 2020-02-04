<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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



</head>
<body>
addSubName1.jsp입니다.

</body>
</html>