<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<%@include file="header.jsp" %>

<%@include file="header.jsp" %>

<table class="table table-striped" border="1" width="100%" >
<th width="30%">제목</th><td>　</td>
<tr><td colspan="2">
<a href = "uploadFileList.html">
업로드 파일 리스트</a><br><br><br><br>
</td></tr>

<tr><td colspan="2" >
${pageContext.request.contextPath}/resources/images/write.png
<img src="${pageContext.request.contextPath}/resources/images/write.png">
</td></tr>
</table>
</body>
</html>