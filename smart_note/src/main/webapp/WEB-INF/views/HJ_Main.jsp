<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
div{
border: solid;
}
#wrap { position: absolute; top: 10px; left: 50%; margin-left: -512px; width:1034px; }
#Header { position: absolute; top: 10px; left: 5px; width: 1024px; height: 80px; align: center; background: #EAEAEA; }
#Menu { position: absolute; top: 100px; left: 5px; width: 250px; height: 600px; align: center; background: #EAEAEA; }
#Content { position: absolute; top: -3px; left: 260px; width: 762px; height: 600px; align: center; background: #EAEAEA; text-align: Center;}
#Footer { position: absolute; top: 620px; left: 5px; width: 1024px; height: 50px; align: center; background: #EAEAEA; }
</style>

</head>
<body>

<div id="wrap">
<div id="Header">
 <table>
	<h1>${sub_name}</h1> 
</table>	
</div>
 <div id="Menu">
 <table>
 <tr>
 <h1>리스트</h1><br>
  <input type="button" value="필기 원본"><br><br>
  <input type="button" value="음성 녹음"><br><br>
  </tr>
  <tr>
   <h1>자료</h1><br>
     <input type="button" value="강의자료"><br><br>
     <input type="button" value="공유자료"><br><br>
 </tr>
 </table>
 <div id="Content">
<table>
	<tr><th >과목</th><th>작성자</th><th>제목</th><th>내용</th><th>공유여부</th></tr>
	
</table>
<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="HJ_Main.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
	<a href="HJ_Main.do?currentPage=${i}">[${i}]</a>
</c:forEach>
<c:if test="${pg.endPage < pg.totalPage }">
	<a href="HJ_Main.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
</c:if>
<br/>
<input type="text">
<input type="button" value="검색">
 </div>
 <div id="Footer">
 </div>
 </div>

</div>
</body>
</html>