<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<title>park의 게시판</title>
<!-- meta tags 필요 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">	
</head>

<body>
<!-- 먼저 jQuery가 오고 그 다음 Popper.js 그 다음 Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" ></script>
	<div align="center">
		<header>
			<%@include file="include/header.jsp" %>
		</header>
		<hr />
		<nav>
			<%@include file="include/nav.jsp" %>
		</nav>
		<hr />
		
		<section id="container">
			<h2>글 목록</h2>
			<table border="1" width="1200px">
				<tr align="center">
					<th width="50px">번 호</th> 
					<th width="850px">제 목</th>
					<th width="100px">작성자</th>
					<th width="200px">작성일자</th>
					<th width="100px">조회수</th>
				</tr>
				
				<!-- 목록 start -->
				<c:forEach items="${list}" var="list">
					<tr align="center">
						<td>${list.bno}</td>
						<td>
							<%-- <a href="/board/read?bno=${list.bno}">${list.title}</a> --%>
							<a href='/board/read${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${list.bno}'>${list.title}</a>
						</td>
						<td>${list.writer}</td>
						<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
						<td>${list.viewCnt}</td>
					</tr>
				</c:forEach>
				<!-- 목록 end -->
			</table>
			<!-- 검색 -->
			<div class="text-center">
				<div class="box-body">
					<select name = "searchType">
						<option value="n" <c:out value="${cri.searchType} == null? 'selected' : ''}"/>> --- </option>
						<option value="t" <c:out value="${cri.searchType} eq 't' ? 'selected' : ''}"/>> 제목 </option>
						<option value="c" <c:out value="${cri.searchType} eq 'c' ? 'selected' : ''}"/>> 내용 </option>
						<option value="tc" <c:out value="${cri.searchType} eq 'tc' ? 'selected' : ''}"/>> 제목 or 내용 </option>
					</select>
					<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
					<button id="searchBtn">검색</button>
				</div>
				<script>
					$(document).ready(function() {
						$('#searchBtn').on("click", function(event) {
							
							self.location = "/board/listPage"
							+ "${pageMaker.makeQuery(1)}"
							+ "&searchType="
							+ $("select option:selected").val()
							+ "&keyword=" + encodeURIComponent($("#keywordInput").val());
						});
					});
				</script>
			</div>
			<!-- 검색 끝 -->
			
			<!-- 페이징 -->
			<nav aria-label = "Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test = "${pageMaker.prev}">
						<li class="page-item"><a class="page-link" href="/board/listPage${pageMaker.makeSearch(pageMaker.startPage -1 )}">이전</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? ' class=active' : ''}" />>
							<a class="page-link" href="/board/listPage${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>
					<c:if test = "${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item"><a class="page-link" href="/board/listPage${pageMaker.makeSearch(pageMaker.endPage + 1 )}">다음</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- 페이징 끝 -->

		</section><br />
		<a href="/board/create"><button type="submit">글 작성</button></a><br />
		<!-- <a href="/board/create">글 작성 페이지로..</a> <br> -->
		<hr>
		
		<footer>
			<%@include file="include/footer.jsp" %>
		</footer>
	</div>
</body>
</html>