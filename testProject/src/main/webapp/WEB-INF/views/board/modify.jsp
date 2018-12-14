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
		<h2>글 수정</h2>
			
			<!-- 전체를 수정하기에 form을 전체로 감싸줌 -->
			<form role="form" method="post" autocomplete="off" >	
				<%-- <p>
					<label for="bno">글 번호</label>
					<input type="text" id="bno" name="bno" value="${modify.bno}" readonly="readonly" />
				</p>			
				<p>
					<label for="title">글 제목</label>
					<input type="text" id="title" name="title" value="${modify.title}" />
				</p>
				<p>
					<label for="content">글 내용</label>
					<textarea id="content" name="content">${modify.content}</textarea>
				</p>
				<p>
					<label for="writer">작성자</label>
					<input type="text" id="writer" name="writer" value="${modify.writer}" readonly="readonly"/><br />
					<label>작성 날짜</label> <span><fmt:formatDate value="${modify.regDate}" pattern="yyyy-MM-dd" /></span>
				</p> --%>
				<p>
					<label for="bno">번호 : ${modify.bno}</label>
					<input type="hidden" id="bno" name="bno" value="${modify.bno}" />
				</p>
				<div align="center">
					<table border="1" width="1200px">
						<tr>
							<td>제목 : <input type="text" id="title" name="title" style="width:600px;" value="${modify.title}" /></td>
						</tr>
						<tr>
							<td>작성자 : ${modify.writer}</td>
						</tr>
						<tr>
							<td>비밀번호 : <input type="password" id="password" name="password" style="width:170px;" maxlength="10" /></td>
						</tr>
						<tr>
							<td> 내용 : <textarea id="content" name="content" rows="10" cols="80">${modify.content}</textarea></td>
						</tr>
						<tr>
							<td>작성 날짜 <span><fmt:formatDate value="${modify.regDate}" pattern="yyy-MM-dd" /></span></td>
						</tr>
					</table>
				</div>
				
				<p>
					<button id="submit">수정</button>
					<button id="cancel_btn">취소</button>
					
					<script>
					
					// 폼을 변수에 저장
					var formObj = $("form[role='form']");
					
					// cancel_btn
					$("#cancel_btn").click(function() {
						formObj.attr("action", "/board/read?bno=" + $("#bno").val());
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