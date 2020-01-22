<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<script type='text/javascript'></script>

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
<link href="${pageContext.request.contextPath}/css/HJ_SrhLoginStyle.css" rel="stylesheet" />

</head>
<body id="LoginForm">

<div class="container">

<div class="login-form">

<div class="main-div">
	<div class="content">
		<div class="agree">
			<ul class="idpwSrh">
				<li>
					<div class="login_form">
						<div class="srhTop">
							<h1>비밀번호  찾기</h1>
							<br/>
							<br/>
							내정보에 등록한 정보로
							<br/>
							비밀번호를 찾을 수 있습니다.
						</div>
						<div class="info">
							<form name="pwForm" method="post" action="pwSrhPro.do">
								<input type="hidden" name="MEM_PW" value=" " />
								<fieldset>
									
        <div class="form-group">	
									<p>
										<label>아이디</label> <input type="text" name="mem_id"
											required=required placeholder="아이디" title="아이디 입력" />
									</p>
									</div>
									<p>
									
        <div class="form-group">
										<label>이&nbsp;&nbsp;름</label> <input type="text" name="mem_name"
											required="required" 
											placeholder="이름" title="이름 입력" />
									</div>	</p>
									<p>
										
        <div class="form-group"><label>이메일</label> <input type="text" name="mem_email"
											required=required placeholder="이메일" title="이메일 입력" />
									</div></p>
									<button class="btn btn-primary" type="submit">찾기</button>
								</fieldset>
							</form>
						</div>
					</div>
					</div>
					</div></div>
				</li>
			</ul>
		</div>
	</div>
	
</body>
</html>