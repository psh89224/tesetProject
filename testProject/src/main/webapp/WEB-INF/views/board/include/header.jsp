<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div id="logo"><h1><a href="/">park의 게시판</a></h1></div>
<c:if test="${member != null}">
	<p>${member.userName} 님 환영합니다.</p>
	<a href="../member/logout">로그아웃</a>
</c:if>