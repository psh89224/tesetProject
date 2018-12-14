<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>park의 게시판</title>
</head>

<body>
	<div align="center">
		<header>
			<%@include file="../include/header.jsp" %>
		</header>
		<hr />
		
		<form role="form" method="post" autocomplete="off">
			<p>
				<label for="userId">아이디</label>
				<input type="text" id="userId" name="userId" />
			</p>
			<p>
				<label for="userPass">비밀번호</label>
				<input type="password" id="userPass" name="userPass" />
			</p>
			<p>
				<label for="userName">닉네임</label>
				<input type="text" id="userName" name="userName" />
			</p>
			<p><button type="submit">가입</button></p>
		</form>
		<hr />
		<footer>
			<%@include file="../include/footer.jsp" %>
		</footer>
	</div>

</body>
</html>
