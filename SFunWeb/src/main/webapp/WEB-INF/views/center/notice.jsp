<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
// //BoardDAO 객체생성
// BoardDAO dao=new BoardDAO();
// // 한페이지에 보여줄 글개수 설정
// int pageSize=10;
// // 현 페이지 번호 가져오기 => 페이지번호가 없으면 1페이지 설정
// // http://localhost:8080/webProject/board/list.jsp
// // http://localhost:8080/webProject/board/list.jsp?pageNum=2
// String pageNum=request.getParameter("pageNum");
// if(pageNum==null){
// 	//=> 페이지번호가 없으면 1페이지 설정
// 	pageNum="1";		
// }
// // pageNum 문자열 => 숫자변경
// int currentPage=Integer.parseInt(pageNum);
// // 시작하는 행번호 구하기
// // pageNum(currentPage)   pageSize   => startRow   
// // 	1                       10      =>    (1-1)*10+1=>0*10+1=> 0+1=>1 ~10
// // 	2                       10      =>    (2-1)*10+1=>1*10+1=>10+1=>11 ~20
// // 	3                       10      =>    (3-1)*10+1=>2*10+1=>20+1=>21 ~30
// int startRow=(currentPage-1)*pageSize+1;
// // 끝나는 행번호 구하기
// //   startRow    pageSize     =>  endRow
// //       1           10       =>    1+10-1      => 10
// //       11          10       =>    11+10-1     => 20
// //       21          10       =>    21+10-1     => 30
// int endRow = startRow+pageSize-1;

// // select * from board order by num desc limit 시작행-1, 몇개
// // 리턴할형 ArrayList<BoardDTO>  getBoardList(int startRow,int pageSize) 메서드 정의 
// // ArrayList<BoardDTO>  boardList = dao.getBoardList(startRow,pageSize) 메서드 호출
// ArrayList<BoardDTO> boardList=dao.getBoardList(startRow,pageSize);

// SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");

// ArrayList<BoardDTO> boardList=(ArrayList<BoardDTO>)request.getAttribute("boardList");
		
// int currentPage=(Integer)request.getAttribute("currentPage");
// int startPage=(Integer)request.getAttribute("startPage");
// int pageBlock=(Integer)request.getAttribute("pageBlock");
// int endPage=(Integer)request.getAttribute("endPage");
// int pageCount=(Integer)request.getAttribute("pageCount");

// // 검색어
// String search=(String)request.getAttribute("search");
		
%>
<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    
 <c:forEach var="dto" items="${boardList}">
  	<tr onclick="location.href='${pageContext.request.contextPath}/board/content?num=${dto.num}'">
 	<td>${dto.num}</td>
    <td class="left">
<%--     <c:if test=""> --%>
<%--     	<c:set var="wid" value=""></c:set> --%>
<%--     	<img src="/resources/images/center/level.gif" width="" height="15">  --%>
<%--      	<img src="/resources/images/center/re.gif"> --%>
<%--     </c:if> --%>
    ${dto.subject}</td>
    <td>${dto.name}</td>
    <td><fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd"/></td>
    <td>${dto.readcount}</td></tr>  
 </c:forEach>   
    
</table>

<div id="table_search">

<c:if test="${ ! empty sessionScope.id }">

	<input type="button" value="글쓰기" class="btn" 
onclick="location.href='${pageContext.request.contextPath}/board/write'">

</c:if>


</div>

<div id="table_search">
<form action="${pageContext.request.contextPath}/board/list" method="get">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
</div>

<div class="clear"></div>
<div id="page_control">
<%
// // 한 화면에 보여줄 페이지 개수 설정
// int pageBlock=10;
// // 시작하는 페이지 번호 구하기
// //  currentPage         pageBlock  =>  startPage
// //     1 ~ 10(0~9)           10     =>   (currentPage-1)/10*10+1=>0*10+1=> 0+1=>1
// //    11 ~ 20(10~19)         10     =>   (currentPage-1)/10*10+1=>1*10+1=>10+1=>11
// //    21 ~ 30(20~29)         10     =>   (currentPage-1)/10*10+1=>2*10+1=>20+1=>21

// int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// // 끝나는 페이지 번호 구하기
// // startPage pageBlock => endPage
// //     1         10    =>   1+10-1 => 10
// //    11         10    =>   11+10-1 => 20
// //    21         10    =>   21+10-1 => 30
// int endPage=startPage+pageBlock-1;
// //전체글 개수 select count(*) from board
// // int 리턴할형 getBoardCount() 메서드 정의 
// // getBoardCount() 메서드 호출
// int count = dao.getBoardCount();
// //끝나는 페이지(endPage) = 10  <=  전체페이지(pageCount) = 2
// // 전체페이지(pageCount) 구하기 
// // => 전체글의 개수 13 /글개수 10 => 1 페이지 +(0.3글 남아있으면 1페이지 추가)   
// //    
// int pageCount=count/pageSize+(count%pageSize==0?0:1);
// if(endPage > pageCount){
// 	endPage = pageCount;
// }

// if(search==null){
	//검색어 없음
	
	//10페이지 이전
// 	if(startPage > pageBlock){
		%>
<%-- 	<a href="BoardList.bo?pageNum=<%=startPage-pageBlock%>">Prev</a> --%>
		<%
// 	}

// 	for(int i=startPage;i<=endPage;i++){
		%>
<%-- 		<a href="BoardList.bo?pageNum=<%=i%>"><%=i %></a>  --%>
		<%
// 	}

	//10페이지 다음
// 	if(endPage < pageCount){
		%>
<%-- 	<a href="BoardList.bo?pageNum=<%=startPage+pageBlock%>">Next</a> --%>
		<%
// 	}
	
// }else{
	//검색어 있음
	//10페이지 이전
// 	if(startPage > pageBlock){
		%>
<%-- 	<a href="BoardList.bo?pageNum=<%=startPage-pageBlock%>&search=<%=search%>">Prev</a> --%>
		<%
// 	}

// 	for(int i=startPage;i<=endPage;i++){
		%>
<%-- 		<a href="BoardList.bo?pageNum=<%=i%>&search=<%=search%>"><%=i %></a>  --%>
		<%
// 	}

	//10페이지 다음
// 	if(endPage < pageCount){
		%>
<%-- 	<a href="BoardList.bo?pageNum=<%=startPage+pageBlock%>&search=<%=search%>">Next</a> --%>
		<%
// 	}
// }


%>

<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/board/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}">Prev</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/board/list?pageNum=${i}&search=${pageDTO.search}">${i}</a>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/board/list?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}">Next</a>
</c:if>

</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>