<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// member/updatePro.jsp
//폼에서 입력한 내용이 서버에 전달 => request 내장객체 저장
//request 한글처리
request.setCharacterEncoding("utf-8");
//request 태그이름에 해당하는 값을 가져오기 => 변수에 저장(id, pass, name)
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
//추가 email address phone mobile
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");

// 수정할 내용을 바구니 객체생성 => 바구니에 저장
MemberDTO updateDto=new MemberDTO();
updateDto.setId(id);
updateDto.setPass(pass);
updateDto.setName(name);
//추가 email address phone mobile
updateDto.setEmail(email);
updateDto.setAddress(address);
updateDto.setPhone(phone);
updateDto.setMobile(mobile);

//MemberDAO 객체생성 
MemberDAO dao=new MemberDAO();
// MemberDTO dto = userCheck(id,pass) 메서드 호출
MemberDTO dto=dao.userCheck(id, pass);

if(dto!=null){
	// 아이디 비밀번호 일치 => 바구니 주소 가져오기
	// dao.updateMember(updateDto) 메서드 호출
	dao.updateMember(updateDto);
	// => ../main/main.jsp 이동
	response.sendRedirect("../main/main.jsp");
}else{
	// 아이디 비밀번호 틀림 => 빈 바구니 주소 가져오기 
//  데이터 없으면 false => 아이디 비밀번호 틀림
//=> script   "아이디 비밀번호 틀림" 뒤로이동
    %>
    <script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		history.back();
    </script>
    <%
}
%>