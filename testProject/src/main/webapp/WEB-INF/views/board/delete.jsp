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
		<h2>글 삭제</h2>
			
			<form role="form" method="post" autocomplete="off" >	
				<p>
					<label for="bno">글 번호</label>
					<input type="text" id="bno" name="bno" value="${delete}" readonly="readonly" />
				</p>
				<p>정말로 삭제 하시겠습니까?</p>
				<p>
					<button id="submit">예</button>
					<button id="cancel_btn">아니오</button>
					
					<script>
					
					// 폼을 변수에 저장
					var formObj = $("form[role='form']");
					
					// 취소
					$("#cancel_btn").click(function() {
						formObj.attr("action", "/board/read?bno=" +$("bno").val());
						formObj.attr("method", "get");
						formObj.submit();
					});
					</script>
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