<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과목추가</title>
<script type="text/javascript">
	function confirmFavSub() {
		var sub_name = document.getElementById("sub_name")
		

		if (!sub_name.value ) {
			alert("아이디 또는 패스워드를 입력하세요")
			return false
		}

		return true
	}
</script>
<style type="text/css">
h2.addSubForm_title {
	color: #343A40; /*font color*/
	text-align: center;
	margin: 30px 0px 30px 0px;
}

.addSubForm_ul {
	list-style-type: none;
	padding: 0;
	width: 80%;
	margin-left: 10%;
}

.addSubForm_ul li label {
	display: block;
	color: #343A40;
	padding: 10px 0px;
	font-size: 15px;
   
}

.addSubForm_ul li input {
	padding: 12px 10px;
	border: 1px solid #e0dcdc;
	width: -webkit-fill-available;
   
}

.addSubForm_Button {
	border: solid 2px;
	border-bottom: solid 4px;
	border-color: #F9F7F6;
	background-color: #373B43;
	color: white;
	font-size: 15px;
	padding: 12px 26px;
}
</style>
</head>

<body bgColor="#f9f7f6">
	<h2 class="addSubForm_title">과목 추가</h2>
	<form action="confirmSub.do" onsubmit= return "confirmFavSub()">
		<ul class="addSubForm_ul">
			<li class="list-item" >
			<input name="sub_name" type="text" required="required"  placeholder="추가할 과목을 입력 해주세요">
			</li>
		</ul>
             <div style="text-align: center; margin: 30px 0px 40px 20px;">
				<!-- <input type="button" id="note_Search" value="확인" onclick="confirmFavSub()"> -->
				 <input class="addSubForm_Button" type="submit" value="확인"> 
			</div>


	</form>
</body>
</html>