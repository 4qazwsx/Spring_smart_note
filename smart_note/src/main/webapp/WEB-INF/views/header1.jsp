<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 -->
 <%-- <script src="${pageContext.request.contextPath}/resources/common/js/jquery-3.3.1.min.js" ></script> --%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 

<!-- session이 없으면(비로그인시) 디폴트 값으로 서울의 날씨 코드를 넣어준다. -->
<c:if test="${sessionScope.loc == null}">
	<c:set var="loc" value="1168066000" scope="session"></c:set>
</c:if>
<!-- gender 1:남자, 2:여자 -->

<c:if test="${sessionScope.gender == null }">
	<c:set var="gender" value="2" scope="session"></c:set>
</c:if>

<c:catch var="exception"> 
	<!-- 받은 지역코드에 맞는 날씨 데이터를 기상청에서 가져온다. -->
	<c:import var="xmldata" url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=${sessionScope.loc }" charEncoding="utf-8"></c:import>
	<x:parse var="doc" xml="${xmldata }"></x:parse>
	<x:set var="wf" select="$doc//*/data/wfKor"/>
	<x:set var="temp" select="$doc//*/data/temp"/>
	<x:set var="rp" select="$doc//*/data/pop"/>
</c:catch>

<script src="js/jquery.js"></script>
<script type="text/javascript">
	//문서 시작시 적용
	$(function(){
		var thisPage = window.location.href.split('oMybatis3/')[1];
		if(thisPage.split('?')[0] == "genderSelector.do"){
			history.pushState(null,null,window.location.href.split('thisPage=')[1]);
			window.location.reload();
		}
		
		if(thisPage.split('?')[0] == "styleDetail.do" || thisPage.split('?')[0] == "prddetail.do"){
			$("#header_bottom").css('display','none')
		}
		
		if(thisPage == "logout.do"){
			history.pushState(null,null,"main.do");
		}	
	})
	
	function logoutConfirm(){
		if(confirm("정말 로그아웃 하시겠습니까?") == true){
	        location.href='logout.do'
	    }
	    else{
	        return ;
	    }
	}
	
	function myCogiMenuControler(){
		
		if('${sessionScope.mem_id}'){
			location.href='memUpForm.do?sido=${sessionScope.mem_id}'
		}else{
			alert("로그인 해주세요.")
			login()
		}
	}
	
	function login() {
        window.open('loginForm2.do','로그인','width=1280,height=748,left=200,top=200,status=no,scrollbars=no')
	}

</script>

<style type="text/css">
/* theme color list
	#E45151	
	#F9F7F6 background
	#373B43
	#F3F1F0
 */

/* header style start */
header{
	background-color : #F9F7F6;
}
  
header a:link{color: #FFEEE4; text-decoration: none;}
header a:visited{color: #FFEEE4; text-decoration: none;}
header a:hover{text-decoration: none;}
header a:active{color: black; text-decoration: none;}

#header_root{
	margin-left: 0%;
	margin-right: 0%;
}

#logo_title{
	font-size: 50px;
	color: #FFEEE4; 
	padding-right: 15px;
	 
}

/* icon */
#header_logo{
	text-align: center;
	display: flex;
}
#header_logo_pic{
	margin-left: 8%;
}
#sun_icon{
	border-radius: 5px;
	display: inline-block;
}

/* header section */
#header_top{
	position: relative;
}
#header_center{
	margin-top: 0px; 
	background-color: #FFBB00;
	border-bottom: 2px solid #d5d5d5;
	/* height: 72px; */
}

/* weather_today */
#weather_today{
	margin-top: -65px;
	margin-right: 30px;
	float:right;
	color: #666666;
	font-size: 18px;
	position: relative;
	z-index: 2;
}
#weather_pic{
	margin-left: 10px;
	vertical-align: -15px; 
}

/* member_space */
#member_space{
	float:right;
	padding: 10px 10px 0px 0px;
	color: #373b43;
	position: relative;
	z-index: 1;
}

.top_left_button{
	background-color : #F9F7F6;
	border : none;
	font-size: 15px;
	cursor: pointer;
	font-weight: bold;
}
 
.top_right_button{
	background-color : #F9F7F6;
	border : none;
	font-size: 15px;
	cursor: pointer;
	font-weight: bold;
}

/* menu_bar */
#menu_bar{
	display: inline-block;
	cursor: pointer;
}
.menu_bar_table{
	text-align: center;
	background-color: #FFBB00;
	color: white;
	border-spacing: 0px;
}
.menu_bar_table td{
	padding: 0px 30px;
	font-size: 20px; 
}
.menu_bar_table td:hover{
	box-shadow: 0px -2px white inset;
}
.menu_bar_table td:first-child{
	padding: 15px 30px 15px 30px;
	background-color: #FFBB00;
	font-size: 30px;
	font-weight: bold;
}

/* search_bar */
#search_bar{
	margin: 10px 29px 0px 0px;
	display: inline-block;
	float: right;
}
#search_target{
	border: none;
	font-size: 15px;
}
#search_input{
	border-bottom: 1px solid white;
}
#search_word{
	width: 300px;
	border: none;
	background-color: #E45151;
	color : white;
	font-size: 15px;
}
#search_word::placeholder{
	color: #D34747;
	font-weight: bold;
}

#search_button{
	height: 23px;
	width: 30px;
}

#search_button:hover{
	border-radius: 5px;
	background-color: #D34747;
	border: none;
}

#search_radio{
	float: right;
	color: white;
	margin-top: 7px;
	font-size: 13px;
}

/* #search_radio  */
#search_radio input[type='radio'],
#search_radio input[type='radio']:checked {
  -webkit-appearance: none;
  width: 0.8rem;
  height: 0.8rem;
  border-radius: 100%;
  margin-right: 3px;
}

#search_radio input[type='radio'] {
  background-color: white;
}
#search_radio input[type='radio']:checked {
  background-color: #D34747;
    border: 3px solid white;
}


/* gender_selector */
#gender_selector{
	display: inline-block;
	color: #666666;
	cursor: pointer;
}
#gender_selector td{
	padding: 10px 25px 10px 25px;
	color: #666666;
}

.ui-autocomplete{
	list-style: none;
	background-color: white;
	cursor: pointer;
}
/* hot_tag */

#hot_tag_list{ 
	position:absolute;
	/* border: 2px solid; */
	right: 50px;
	float: right;
	top: 400px;
	width: 170px;
	/*
	width: 10%;
	margin-top: 1%;
	margin-bottom: 2%; */

}

#hot_tag_Tic{ 
	padding-left: 10px;
    text-decoration: none;
    color: white;
    font-weight: bold;
    display: inline-block;
    border-right: 30px solid transparent;
    border-bottom: 30px solid #373b43;
    height: 0;
    line-height: 40px; 
}

#hot_tag_top10{
	border: 1px solid #B0B5BD;
	background-color: #f9f7f6;
	color: #666666;
}

#hot_tag_top10 ol li{
	margin: 0px 0px 10px 0px;
}

#hot_tag_list a:link{text-decoration: none; color: #666666;} 
#hot_tag_list a:active{text-decoration: none; color: #666666;}
#hot_tag_list a:visited{text-decoration: none; color: #666666;}
#hot_tag_list a:hover{text-decoration: none; color: #666666;}

/* header style end */
</style>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- Bootstrap theme -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css"> --%>

<!-- common CSS -->
<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" >

<!--메뉴바 추가 부분-->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <a class="navbar-brand" href="schedule.do">대 필 NOTE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="schedule.do">MAIN <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">내 필기 관리</a>
      </li>   <li class="nav-item">
        <a class="nav-link" href="#">내 필기 공유</a>
      </li>
     
    </ul>
  </div>
  
<div id="header_root">
	<div id="member_space">
		<c:if test="${empty sessionScope.mem_id }">
			<button id="top_login_button" class="top_left_button" onclick="login()">로그인</button>
			<button id="top_signup_button" class="top_right_button" onclick="location.href='joinForm.do'">회원가입</button>
		</c:if>
		<c:if test="${not empty sessionScope.mem_id }">
			<span>${sessionScope.mem_id }님 환영합니다!</span>
			<button id="top_logout_button" class="top_left_button" onclick="logoutConfirm()">로그아웃</button>
			<button id="top_my_page_button" class="top_right_button" onclick="myCogiMenuControler()" >회원정보수정</button>
		</c:if>
	</div>

</nav>
