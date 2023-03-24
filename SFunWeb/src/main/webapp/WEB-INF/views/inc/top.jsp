<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<header>
<%
// inc/top.jsp

// EL(Expression Language) : 표현언어 %= %  => ${ }
// 내장객체  pageScope, requestScope, sessionScope, applicationScope
//         param, paramValues
// 연산자    . , [], (), 조건?참:거짓, empty => null, 0
//          +, -,  *,  / div , %  mod
//          && and, || or, ! not
//          == eq, != ne, < lt, > gt , <= le, >= ge

// JSTL(JSP Standard Tag Library) : JSP 표준 태그 함수
// 프로그램 설치 tomcat.apache.org  => Download => Taglibs
// => taglibs-standard-impl-1.2.5.jar
//    taglibs-standard-spec-1.2.5.jar 
//    taglibs-standard-jstlel-1.2.5.jar
//    taglibs-standard-compat-1.2.5.jar
// => WEB-INF - lib - 넣기
// => <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
//    가져와서 사용
// => 변수선언 <c:set>, 조건 <c:if> , <c:choose> <c:when> <c:otherwise>
// => 반복 <c:forEach> , <c:forTokens>
// => 이동 <c:redirect>, <c:url>, <c:import>, <c:param>

// => <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
//    가져와서 사용
//    날짜포맷 <fmt:formatDate>, 숫자포맷 <fmt:formatNumer>
//    한글 <fmt:requestEncoding>

// String id=(String)session.getAttribute("id");
// if(id != null){
	// 로그인성공 => 세션값 "id" 있음 => ...님 로그아웃 , 회원정보수정
			%>
<%-- <div id="login"><%=id %> => ${sessionScope.id } 님 |  --%>
<!--                 <a href="MemberLogout.me">logout</a> |  -->
<!--                 <a href="MemberUpdateForm.me">update</a></div>				 -->
			<%
// }else{
	// 로그인실패(로그인 하지 않은 상태) => 세션값 "id" 없음 => 로그인,회원가입
	%>
<!-- <div id="login"><a href="MemberLoginForm.me">login</a> |  -->
<!--                 <a href="MemberInsertForm.me">join</a></div>	 -->
	<%		
// }
%>

<c:if test="${! empty sessionScope.id}">
	<div id="login">${sessionScope.id } 님 | 
       <a href="${pageContext.request.contextPath}/member/logout">logout</a> | 
       <a href="${pageContext.request.contextPath}/member/update">update</a></div>	
</c:if>

<c:if test="${empty sessionScope.id }">
	<div id="login">
	   <a href="${pageContext.request.contextPath}/member/login">login</a> | 
       <a href="${pageContext.request.contextPath}/member/insert">join</a></div>
</c:if>

<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="${pageContext.request.contextPath}/main/main">HOME</a></li>
	<li><a href="${pageContext.request.contextPath}/company/welcome">회사소개</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="${pageContext.request.contextPath}/board/list">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>