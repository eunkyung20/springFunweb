<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/front.css" rel="stylesheet" type="text/css">

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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">
//jQuery 준비 => 대상.함수()
	$(document).ready(function(){
// 		alert("준비");
		// class="brown" 클릭했을때  "클릭"
		$('.brown').click(function(){
// 			alert("클릭");
//         xml <= 디비에서 가져옴
// <board>
// 	<tr><subject>제목1</subject><date>2023-01-01</date></tr>
// 	<tr><subject>제목2</subject><date>2023-01-02</date></tr>
// 	<tr><subject>제목3</subject><date>2023-01-03</date></tr>
// </board>

//         자바스크립트 배열(json) <= 디비에서 가져옴
// JSON ( 제이슨 , JavaScript Object Notation )
// 			var arr=[
// 				     {"subject":"제목1","date":"2023-01-01"},
// 				     {"subject":"제목2","date":"2023-01-02"},
// 				     {"subject":"제목3","date":"2023-01-03"}
// 				    ];

// [{"date":"2023.02.01","subject":"제목13","num":13},
// 	{"date":"2023.02.01","subject":"제목12","num":12},
// 	{"date":"2023.02.01","subject":"제목11","num":11},
// 	{"date":"2023.02.01","subject":"제목10","num":10},
// 	{"date":"2023.02.01","subject":"제목9","num":9}]
			
			//초기화
			$('table').html('');
			
			$.ajax({
				url:'${pageContext.request.contextPath}/board/listjson',
// 				data:{이름 : 값},
				dataType:'json',
				success:function(arr){
					
//			        반복해서 출력 .each()
					$.each(arr,function(index,item){
//		 				alert(index);
//		 				alert(item.subject);
//		 				alert(item.date);
//		               태그 뒤부분에 추가해서 넣기 append()
						$('table').append('<tr><td class="contxt"><a href="#">'+item.subject+'</a></td><td>'+item.date+'</td></tr>');
					});
					
				}
			});




		});
	});
</script>
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="${pageContext.request.contextPath}/resources/images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>Web Hosting Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="security">
<h3>Web Security Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="payment">
<h3>Web Payment Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Security</span> News</h3>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown">News &amp; Notice</h3>
<table>
			<%
// 			BoardDAO dao=new BoardDAO();
// 			List<BoardDTO> boardList=dao.getBoardList(1, 5);
// 			for(int i=0;i<boardList.size();i++){
// 				BoardDTO dto=boardList.get(i);
				%>
<%-- 	<tr><td class="contxt"><a href="#"><%=dto.getSubject() %></a></td>  --%>
<%--     <td><%=dto.getDate() %></td></tr>			 --%>
				<%
// 			}
			%>
<!-- <tr><td class="contxt"><a href="#">Vivans....</a></td> -->
<!--     <td>2012.11.02</td></tr> -->
<!-- <tr><td class="contxt"><a href="#">Vivans....</a></td> -->
<!--     <td>2012.11.02</td></tr> -->
<!-- <tr><td class="contxt"><a href="#">Vivans....</a></td> -->
<!--     <td>2012.11.02</td></tr> -->
<!-- <tr><td class="contxt"><a href="#">Vivans....</a></td> -->
<!--     <td>2012.11.02</td></tr> -->
<!-- <tr><td class="contxt"><a href="#">Vivans....</a></td> -->
<!--     <td>2012.11.02</td></tr> -->
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>