<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<c:if test="${result_sub == 1}">
		<script type="text/javascript">
			alert("로그인을 성공하였습니다.")
			
			opener.document.location.reload();//팝업창닫으면서 원래창 새로고침
			//location.href = "main.do"
			window.close();
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("아이디 또는 비밀번호를 확인해주세요")
			history.go(-1)
		</script> 
	</c:if>

			
</body>
</html>