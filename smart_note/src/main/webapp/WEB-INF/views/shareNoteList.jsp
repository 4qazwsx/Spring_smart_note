<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content=Type" content="text/html; charset=UTF-8">

<!-- Bootstrap CSS -->

<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function fn_contentView(note_id){
		var url = "${pageContext.request.contextPath}/getBoardContent.do";
		url = url + "?note_id="+note_id;
		location.href = url;
	}
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/getBoardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
	  //페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			var url = "${pageContext.request.contextPath}/getBoardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;	
		}
	//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "${pageContext.request.contextPath}/getBoardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
		$(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
			var url = "${getBoardList}";
			url = url + "?searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
			console.log(url);
		});
</script>



<title>Insert title here</title>


<body>
<%@ include file="header.jsp" %>
<article>
	<div class="container">
		<div class="table-responsive">
<h2>공유노트리스트</h2>

	 		<table class="table table-striped table-sm">
				<colgroup>
					<col style="width:5%;" />
					<col style="width:auto;" />
					<col style="width:15%;" />
					<col style="width:10%;" />
					<col style="width:10%;" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>글제목</th>
					<!-- 	<th>작성자</th> -->
						<!-- <th>조회수</th> -->
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty shareNoteList }" >
							<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
						</c:when> 
						<c:when test="${!empty shareNoteList}">
							<c:forEach var="list" items="${shareNoteList}">
								<tr>
									<td><c:out value="${list.note_share}"/></td>
									<td>
										<a href="#" onClick="fn_contentView(<c:out value="${list.note_id}"/>)">
											<c:out value="${list.note_title}"/>
										</a>		
									</td>
									<%-- <td><c:out value="${list.mem_id}"/></td> --%>
									<%-- <td><c:out value="${list.view_cnt}"/></td> --%>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.note_date}"/>
									<%-- <td><c:out value="${list.note_date}"/></td> --%>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
	<!-- pagination{s} -->
	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
			</c:if>
		
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
			</c:forEach>

			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination{e} -->
	<!-- search{s} -->
		<div class="form-group row justify-content-center">
			<div class="w100" style="padding-right:10px">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="note_title">제목</option>
					<option value="note_Contents">본문</option>
					<option value="mem_id">작성자</option>
				</select>
			</div>
			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>
			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>
		<!-- search{e} -->
	</div>

</article>
 
</body>
</html>