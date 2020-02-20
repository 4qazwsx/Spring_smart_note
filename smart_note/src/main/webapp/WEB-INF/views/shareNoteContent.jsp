<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(document).on('click', '#btnList', function() {
		location.href = "${pageContext.request.contextPath}/shareNoteList/getBoardList";
	});
</script>

</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>shareNote Content</h2>
			
			<div class="bg-white rounded shadow-sm">
				<div class="shareNote_title"><c:out value="${shareNoteContent.note_title }"/> </div>
				<div class="shareNote_info_box">
					<span class="shareNote_authoer"><c:out value="${shareNoteContent.mem_id}"/>,
					</span><span class="shareNote_date"><c:out value="${shareNoteContent.note_date}"/></span>
				</div>
				<div class="shareNote_Content">${shareNoteContent.note_contents}</div>
				<%-- <div class="shareNote_tag">TAG : <c:out value="${shareNoteContent.tag }"/> </div> --%>
			</div>
			<div style="margin-top : 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

			</div>
		</div>
	
	
	</article>
</body>
</html>