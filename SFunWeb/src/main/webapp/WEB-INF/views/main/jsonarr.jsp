<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// main/jsonarr.jsp
BoardDAO dao=new BoardDAO();
List<BoardDTO> boardList=dao.getBoardList(1, 5);

// 자바를 json변경하는 => 프로그램설치 
// WEB-INF - lib - json-simple-1.1.1.jar
// 자바배열데이터 => json 바꾸는 작업 
// JSON배열 
JSONArray arr=new JSONArray();
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
for(int i=0;i<boardList.size();i++){
	BoardDTO dto=boardList.get(i);
	// BoardDTO 한개의 글 json 저장
	JSONObject object=new JSONObject();
	object.put("num", dto.getNum());
	object.put("subject", dto.getSubject());
	object.put("date", dateFormat.format(dto.getDate()));
	//배열한칸에 json 저장
	arr.add(object);
}
%>
<%=arr%>

