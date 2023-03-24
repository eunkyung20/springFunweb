<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// http://localhost:8080/FunWeb/member/idCheck.jsp
// member/idCheck.jsp?id=kim
String id=request.getParameter("id");
// MemberDAO 객체생성
MemberDAO dao=new MemberDAO();
// MemberDTO dto =  getMember(id)메서드 호출
MemberDTO dto=dao.getMember(id);
String result="";
// dto null 아니면 아이디 있음, 아이디 중복
// dto null 이면   아이디 없음, 아이디 사용가능
if(dto!=null){
	// 아이디 있음, 아이디 중복
	result="아이디 중복";
}else{
	// 아이디 없음, 아이디 사용가능
	result="아이디 사용가능";
}
%>
<%=result%>