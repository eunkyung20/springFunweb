<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// member/logout.jsp
// 세션내장객체(연결정보를 저장) 전체 삭제
session.invalidate();

%>
<script>
	alert("로그아웃");
	location.href="../main/main.jsp";
</script>