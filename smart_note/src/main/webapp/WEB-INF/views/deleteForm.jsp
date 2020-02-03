<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>




<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style type="text/css">


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
  margin: 10px auto 30px;
  max-width: 38%;
  padding: 50px 70px 70px 71px;
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

h1.deleteForm_title {
	color: #343A40; /*font color*/
	text-align: center;
	margin: 30px 0px 30px 0px;
}

h3.align-center {
	color: #343A40; /*font color*/
	text-align: center;
	margin: 30px 0px 30px 0px;
}



.deleteForm_ul {
	list-style-type: none;
	 /*  text-align: center;  */ 
	padding: 0;
	width: 80%;
	 margin-left: 38%; 
} 

 
 
.deleteForm_ul li input {
	padding: 20px 0px;
	border: 1px solid #e0dcdc;
	width: 30%;  
} 

.deleteForm_deleteButton {
	border: solid 2px;
	border-bottom: solid 4px;
	border-color: #F9F7F6;
	background-color: #373B43;
	color: white;
	font-size: 15px;
	padding:12px 26px; 
	width: 30%; 
	
} 

.element{
  font-size: 20px;
  font-weight:bold;
}
</style>




</head>
<body id="LoginForm" bgColor="#f9f7f6">
	
<div class="container">

<div class="login-form">

<div class="main-div">
	
	<h1 class="deleteForm_title">회원탈퇴</h1>
    <h3 class="align-center"> 회원 탈퇴를 위해서 비밀번호를 확인합니다. </h3>
	  <form action="deletePro.do">
									
				<input type="hidden" class="form-control" name="mem_id" value="${mem_id}" placeholder="아이디를 입력하세요"> <br />
				<input type="password" class="form-control" name="mem_pw" required="required" placeholder="비밀번호를 입력하세요" id="mem_pw"><br>
				<input class="btn btn-primary" type="submit" value="탈퇴하기">
		    			
	</form>
	</div>
	</div>
	</div>
	
</body>
</html>