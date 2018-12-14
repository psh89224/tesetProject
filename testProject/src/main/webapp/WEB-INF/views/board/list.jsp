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
	<!-- Jquery -->
	<script src ='http://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
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
				<tr>
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
							<a href="/board/read?bno=${list.bno}">${list.title}</a>
						</td>
						<td>${list.writer}</td>
						<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
						<td>${list.viewCnt}</td>
					</tr>
				</c:forEach>
				<!-- 목록 end -->
			</table>
		</section></br >
		<button type="submit"><a href="/board/create">글 작성</a></button><br>
		<!-- <a href="/board/create">글 작성 페이지로..</a> <br> -->
		<hr>
		
		<footer>
			<%@include file="include/footer.jsp" %>
		</footer>
	</div>
</body>
</html>