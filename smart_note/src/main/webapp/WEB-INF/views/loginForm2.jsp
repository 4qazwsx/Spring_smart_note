<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->
<html>

<script type="text/javascript">
	function chk() {
		var mem_id = document.getElementById("mem_id")
		var mem_pw = document.getElementById("mem_pw")
		
		if (!mem_id.value || !mem_pw.value) {
			alert("아이디 또는 패스워드를 입력하세요")
			return false
		}
		
		return true
	}
</script>
</head>
  
<body id="LoginForm">
<div class="container">
<div class="login-form">
<div class="main-div">

    <div class="panel">
   <h2 class="botto-text">대필노트 <br><br> 로그인</h2>
   <br><br><p>아이디와 비밀번호를 입력해주세요</p>
   </div>
	<form action="loginPro.do" onsubmit="return chk()" >

        <div class="form-group">


            <input type="text" class="form-control" name="mem_id" id="mem_id" placeholder="Id">

        </div>

        <div class="form-group">

            <input type="password" class="form-control" name="mem_pw" id="mem_pw" placeholder="Password">

        </div>
        <div class="forgot">
        <a href="idSrhForm.do">아이디 찾기</a>     <a href="pwSrhForm.do">비밀번호 찾기</a>
</div>		<div style="text-align: center; margin: 30px 0px 10px 0px;">
        <button type="submit" class="btn btn-primary">Login</button>
        </div>
        <br>
         </form><!-- 
		<form action="joinForm.do" >
			<input class="btn btn-primary" type="submit" value="회원가입">
			</form> -->
   
 
    </div>
    
<p class="botto-text"> 대필 노트</p>
</div></div></div>


</body>
</html>
