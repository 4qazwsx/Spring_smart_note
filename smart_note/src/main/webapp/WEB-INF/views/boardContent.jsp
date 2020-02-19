<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공유노트</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).on('click', '#btnList', function(){
		location.href = "${pageContext.request.contextPath}/getBoardList.do";
	});
</script>

</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>내용</h2>
			
			<div class="bg-white rounded shadow-sm">
				<div class="board_title"><c:out value="${boardContent.note_title}"/></div>
				<div class="board_info_box">
					<%-- <span class="board_author"><c:out value="${boardContent.mem_id}"/></span><span class="board_date"><c:out value="${boardContent.note_date}"/></span> --%>
				</div>
				<div class="board_content">${boardContent.note_contents}</div>
<%-- 				<div class="board_tag">TAG : <c:out value="${boardContent.tag}"/></div>
 --%>			</div>
			<div style="margin-top : 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				<button type="button" class="" id="addnote">추가</button>
			</div>
		</div>
	</article>

</body>
</html>