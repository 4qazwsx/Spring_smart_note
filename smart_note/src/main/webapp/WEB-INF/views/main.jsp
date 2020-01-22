<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="utf-8">
<title>개인정보 수정</title>
<script type="text/javascript">
	function chk() {
		if (frm.mem_pw.value != frm.mem_pw2.value) {
			alert("암호가 다릅니다");
			frm.mem_pw.focus();
			return false;
		}
		return true;
	}
	function winop() {
		if (!frm.mem_id.value) {
			alert("id를 입력하고 사용하세요");
			frm.id.focus();
			return false;
		}
		window.open("confirmId.do?mem_id=" + frm.mem_id.value, "",
				"width=600 height=300");
	}
	function next() {
		if (confirm("회원 탈퇴를 하겠습니까?")) {
			location.href = "deleteForm.do";
		} else {
		}
	}
	function next() {
		if (confirm("회원 탈퇴를 하겠습니까?")) {
			location.href = "deleteForm.do";
		} else {
		}
	}
</script>
<style>

body#LoginForm{ background-image:url("https://hdwallsource.com/img/2014/9/blur-26347-27038-hd-wallpapers.jpg"); background-repeat:no-repeat; background-position:center; background-size:cover; padding:10px;}

.form-heading { color:#fff; font-size:23px;}
.panel h2{ color:#444444; font-size:18px; margin:0 0 8px 0;}
.panel p { color:#777777; font-size:14px; margin-bottom:30px; line-height:24px;}
.login-form .form-control {
  background: #f7f7f7 none repeat scroll 0 0;
  border: 1px solid #d4d4d4;
  border-radius: 4px;
  font-size: 14px;
  height: 50px;
  line-height: 50px;
}
.main-div {
  background: #ffffff none repeat scroll 0 0;
  border-radius: 2px;
  margin: 20px auto 60px;
  max-width: 58%;
  padding: 20px 20px 20px 20px;
}
.panel {

  margin: 20px 50px 60px 50px; 
}
.login-form .form-group {
  margin-bottom:10px;
}
.login-form{ text-align:center;}
.forgot a {
  color: #777777;
  font-size: 14px;
  text-decoration: underline;
}
.login-form  .btn.btn-primary {
  background: #f0ad4e none repeat scroll 0 0;
  border-color: #f0ad4e;
  color: #ffffff;
  font-size: 14px;
  width: 100%;
  height: 50px;
  line-height: 50px;
  padding: 0;
}
.forgot {
  text-align: left; margin-bottom:30px;
}
.botto-text {
  color: #ffffff;
  font-size: 14px;
  margin: auto;
}
.login-form .btn.btn-primary.reset {
  background: #ff9900 none repeat scroll 0 0;
}
.back { text-align: left; margin-top:10px;}
.back a {color: #444444; font-size: 13px;text-decoration: none;}

.joinForm_joinButton {
	border: solid 2px;
	border-bottom: solid 4px;
	border-color: #F9F7F6;
	background-color: #FFBB00;
	color: white;
	font-size: 15px;
	padding:12px 26px; 
	
}
</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<%@include file="header.jsp" %>
<body id="LoginForm" bgColor="#f9f7f6">

	<c:if test="${result == 1}">
		<script type="text/javascript">
			alert("로그인을 성공하였습니다.")
			sessionStorage.setItem('mem_id', getParameterByName('mem_id'));
			sessionStorage.setItem('mem_name', getParameterByName('mem_name'));
			sessionStorage.setItem('mem_phone', getParameterByName('mem_phone'));
			sessionStorage.setItem('mem_email', getParameterByName('mem_email'));
			//opener.document.location.reload();//팝업창닫으면서 원래창 새로고침
			location.href = "main.do"
			window.close();
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("아이디 또는 비밀번호를 확인해주세요")
			history.go(-1)
		</script> 
	</c:if>
	
<div class="container">
<div class="login-form">
<div class="main-div">
	
 <h1 class="memUpForm_title">회원정보 수정</h1>
 <h3 class="align-center">  ${members1.mem_id}회원님의 
 							<br>회원정보를 수정할 수 있습니다. </h3>
   <form action="memUpPro.do" name="frm" onsubmit="return chk()">
	
      <table>
      <tr><td>아&nbsp;이&nbsp;디</td><td><input type="text" class="form-control" name="mem_id" value="${members1.mem_id}" readonly required="required" >  
      </td>
      </tr>
      
	  <tr><td>비밀번호</td>  
	  <td><input type="password" class="form-control" name="mem_pw" required="required" >
  	</td></tr>
   		<tr><td>비밀번호&nbsp;확인</td><td> 
	  <input type="password" class="form-control" name="mem_pw2" required="required" > 
	  </td></tr>
	  
	  <tr><td>이&nbsp;&nbsp;&nbsp;&nbsp;름</td>
	  <td>
	  <input type="text" class="form-control" name="mem_name" value="${members1.mem_name}" readonly required="required"> 
	  </td>
	  </tr>
	  
	  <tr><td>연&nbsp;락&nbsp;처</td>
	  <td> 
	  <input type="text" class="form-control" name="mem_phone" value="${members1.mem_phone}" required="required" pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="000-0000-0000">
   		</td></tr>
   		<tr><td>
	  이&nbsp;메&nbsp;일</td><td> <input type="text" class="form-control" name="mem_email" value="${members1.mem_email}" required="required">
   	</td>
   	<tr><td>주&nbsp;소</td>
   	<td><input type="text" class="form-control" name="mem_addr" required="required" placeholder="주소를 입력하세요">
  	</td>
  	</tr>
  	<tr><td>&nbsp;성&nbsp;별</td><td>
	 <label><input type="radio" name="mem_gender" value="1" required="required">남</label>
	 <label><input type="radio" name="mem_gender" value="2" required="required">여</label>
	 </td>
	 </tr>								
	 <tr><td>
	 <input type="submit" class="btn btn-primary" value="수정하기">
	 </td></form>	
	 
	 <form action="deleteForm.do" name="frm" onsubmit="return next()">
	  <input type="hidden" class="a" name="mem_id" value="${members1.mem_id}" readonly required="required" >  
      
		<td><input type="submit" class="btn btn-primary" value="회원탈퇴" font-color="gray">
	</td>
	</tr>
	</table>
	</form>
	
	</div>
	</div>
	</div>
  </body>
</html>