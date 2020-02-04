<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	function chk() {
		if (frm.mem_pw.value != frm.mem_pw2.value) {
			alert("암호가 다릅니다");
			frm.mem_pw.focus();
		}
		var a = "${tk}";
		if (a == 1){
			alert("중복체크를 안하셨거나, 아이디가 중복되었습니다 확인하십시오")
			frm.mem_id.focus();
			return false;
		}
		else if (a ==2){
			alert("회원가입되었습니다.")
			frm.mem_id.focus();
			return true;
		}
		
		
		
		
	}
	function winop() {
		if (!frm.mem_id.value) {
			alert("id를 입력하고 사용하세요");
			frm.mem_id.focus();
			return false;
		}
		window.open("confirmId.do?mem_id=" + frm.mem_id.value, "",
				"width=600 height=300");
	}
	
	function chk1() {
		if (!frm.mem_id.value) {
			alert("사번을 입력한 후에 확인하세요");
			frm.mem_id.focus();
			return false;
		} else location.href="confirm1.do?mem_id="+frm.mem_id.value;
	}


</script><style>

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

<body id="LoginForm" bgColor="#f9f7f6">

<div class="container">

<div class="login-form">

<div class="main-div">
    
<h1 class="joinForm_title">회원가입</h1>
<h3 class="align-center"> "대필노트"에 오신것을 환영합니다. </h3>
 <form action="joinPro.do" name="frm" onsubmit="return chk()">

  
      <table>
      <tr><td>아이디</td> <td><input type="text" class="form-control" name="mem_id" required="required" ></td>
      <td><label class="joinForm_joinButton"><a onclick="chk1()">중복확인</a> </label></td><c:if test="${msg!=null}">${mem_id}는 ${msg}</c:if>
   	  
    	</tr>
  
  
	  <tr><td>비밀번호</td> <td>
	  <input type="password" class="form-control" name="mem_pw" required="required" ></td>
		</tr>	
 		<tr>
	  <td><label>비밀번호&nbsp;확인</label></td><td> 
	  <input type="password" class="form-control" name="mem_pw2" required="required" > 
  	</td></tr>
  	<tr>
	  <td>이&nbsp;&nbsp;&nbsp;&nbsp;름</td>
	 <td> <input type="text" class="form-control" name="mem_name" required="required"> </td>
 </tr>
<tr>
	  <td><label>연&nbsp;락&nbsp;처</label> </td>
	<td>  <input type="text" class="form-control"  name="mem_phone" required="required" pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="000-0000-0000"></td>
</tr>
<tr>
	 <td> <label>이&nbsp;메&nbsp;일</label> </td>
	  <td><input type="text" class="form-control" name="mem_email" required="required"></td>
 </tr>
 <tr>
	 <td> <label>주&nbsp;소</label></td>
      <br>
     <td> <input type="text" class="form-control" name="mem_addr" required="required" placeholder="주소를 입력하세요"></td>
 	</tr>
 	<tr>
	 <td><label>&nbsp;성&nbsp;별</label></td>
	<td>
	<label><input type="radio" class="" name="mem_gender" value="1" required="required">남<input type="radio" class="" name="mem_gender" value="2" required="required">여</label>
		</td>
		
		</tr>
		</table>						
	<input class="btn btn-primary" type="submit" value="가입하기">
	</div>
	</div></div>
  </form>
</body>
</html>