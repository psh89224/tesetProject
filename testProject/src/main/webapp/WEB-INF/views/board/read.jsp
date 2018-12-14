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
		<h2>글 읽기</h2>
			
			<!-- 수정,삭제에는 bno만 필요하기 때문에 form을 bno만 감싸준다 -->
			<form role="form" method="post" autocomplete="off" >	
				<p>
					<label for="bno">번호 : ${read.bno}</label>
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" value="${cri.page}" />
					<input type="hidden" id="perPageNum" value="${cri.perPageNum}" />
					<input type="hidden" id="searchType" value="${cri.searchType}" />
					<input type="hidden" id="keyword" value="${cri.keyword}" />
				</p>
			</form>
				<div align="center">
					<table border="1" width="1200px">
						<tr>
							<td width="900px">제목 : ${read.title}</td>
						</tr>
						<tr>
							<td>작성자 : ${read.writer}</td>
						</tr>
						<tr height="500px">
							<td colspan="2" valign="top">${read.content}</td>
						</tr>
						<tr>
							<td>작성 날짜 <span><fmt:formatDate value="${read.regDate}" pattern="yyy-MM-dd" /></span></td>
						</tr>
						
					</table>
				</div>
				<p>
					<button id="modify_btn">수정</button>
					<button id="delete_btn">삭제</button>
					<button id="listpage_btn">목록으로</button>
					
					<script>
					
					// 폼을 변수에 저장
					var formObj = $("form[role='form']");
					
					// 수정
					$("#modify_btn").on("click", function() {
						formObj.attr("action", "/board/modify");
						formObj.attr("method", "get");
						formObj.submit();
					});
					
					// 삭제
					$("#delete_btn").on("click", function() {
						formObj.attr("action", "/board/delete");
						formObj.attr("method", "get");
						formObj.submit();
					});
					
					// 목록으로
					$("#listpage_btn").on("click", function() {
						formObj.attr("action", "/board/listPage");
						formObj.attr("method", "get");
						formObj.submit();
					});
					</script>
				</p>
		</section>
		<hr />
		
		<footer>
			<%@include file="include/footer.jsp" %>
		</footer>
		
	</div>
</body>
</html>