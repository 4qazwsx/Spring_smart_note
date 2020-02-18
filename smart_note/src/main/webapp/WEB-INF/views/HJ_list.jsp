<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
div {
	
}

#wrap {
	position: absolute;
	top: 10px;
	left: 50%;
	margin-left: -512px;
	width: 1034px;
}

#Header {
	position: absolute;
	top: 110px;
	left: 5px;
	width: 1024px;
	height: 80px;
	align: center;
	background: #EAEAEA;
}

#Menu {
	position: absolute;
	top: 200px;
	left: 5px;
	width: 250px;
	height: 600px;
	align: center;
	background: #EAEAEA;
}

#Content {
	position: absolute;
	top: 0px;
	left: 260px;
	width: 762px;
	height: 600px;
	align: center;
	background: #EAEAEA;
	text-align: Center;
}
th {
	width: 200px;
	align: center;
}

#Footer {
	position: absolute;
	top: 620px;
	left: 5px;
	width: 1024px;
	height: 50px;
	align: center;
	background: #EAEAEA;
}
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
					<h1>메뉴</h1>
					<br>
					<input type="button" value="내자료 보기">
					<br>
					<br>
					<input type="button" value="공유자료 보기">
					<br>
					<br>
					<input type="button" value="과목선택"
						onClick="location.href='myNoteView.do'">
				</tr>
			</table>
			<div id="Content" text-align="center";>
				<table>
					<tr>
						<th>과목</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일자</th>
						<th>공유여부</th>
					</tr>
					<%
						session.setAttribute("id", "abcde");
					%>
					<c:forEach var="note" items="${list }">
						<tr>
							<td>${sub_id }</td>
							<td>${mem_id }</td>
							<td><a href="detail.do?note.title=${note.title}"
								onclick="setSession(${note.note_id})">${note.note_contents}</a></td>
							<td>${note_date }</td>
							<td>${note_share }</td>
						</tr>
						<c:set var="num" value="${num - 1 }"></c:set>
					</c:forEach>
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
				<br /> <input type="text"> <input type="button" value="검색">
			</div>
			<div id="Footer"></div>
		</div>

	</div>
</body>
</html>