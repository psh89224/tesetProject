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
			<%@include file="board/include/header.jsp" %>			
		</header>
		<hr />
		<nav>
			<%@include file="board/include/nav.jsp" %>
		</nav>
		<hr />
		
		<c:if test="${member == null}">
			<form role="form" method="post" autocomplete="off" action="/member/login">
				<p>
					<label for="userId">아이디</label>
					<input type="text" id="userId" name="userId" />
				</p>
				<p>
					<label for="userPass">비밀번호</label>
					<input type="password" id="userPass" name="userPass" />
				</p>
				<p><button type="submit">로그인</button></p>
				<p><a href="/member/register">회원가입</a></p>
			</form>
			
		</c:if>
		
		<c:if test="${msg == false}">
			<p style="color:#f00;">로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.</p>
		</c:if>
		<hr />
		
		
		<footer>
			<%@include file="board/include/footer.jsp" %>
		</footer>
	</div>

</body>
</html>
