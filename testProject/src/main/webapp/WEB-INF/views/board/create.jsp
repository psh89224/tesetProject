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
		<h2>글 작성</h2>
			<form role="form" method="post" autocomplete="off" >
			<div align="center">
				<table width="1200px" border="1">
					<tr>
						<td>제목 : <input type="text" id="title" name="title" style="width:600px;" value="${board.title}" /></td>
					</tr>
					<tr>
						<td>작성자 : <input type="text" id="writer" name="writer" style="width:170px;" maxlength="10" value="${member.userName}" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>비밀번호 : <input type="password" id="password" name="password" style="width:170px;" maxlength="10" /></td>
					</tr>
					<tr>
						<td> 내용 : <textarea id="content" name="content" rows="10" cols="80">${board.content}</textarea></td>
					</tr>
				</table>
			</div>
				<p>
					<button id="submit">작성</button>				
				</p>
			</form>
		</section>
		<hr />
		
		<footer>
			<%@include file="include/footer.jsp" %>
		</footer>
		
	</div>
</body>
</html>