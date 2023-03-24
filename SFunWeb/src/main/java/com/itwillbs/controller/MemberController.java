package com.itwillbs.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
public class MemberController {
	
	// 부모 인페이스 멤버변수 선언 => 자동으로 객체생성 
	@Inject
	private MemberService memberService;
	
	// 가상주소 http://localhost:8080/SFunWeb/member/insert
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/member/join.jsp
		return "member/join";
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/member/insertPro
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertPro()");
		//회원가입 처리 부모인터페이스 MemberService, 
		//           자식클래스 MemberServiceImpl
		// 리턴할형 없음 insertMember(MemberDTO memberDTO) 메서드 정의
		// 메서드 호출
		memberService.insertMember(memberDTO);
		
//		주소줄 변경하면서 이동
		return "redirect:/member/login";
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/member/login
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/member/login.jsp
		return "member/login";
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/member/loginPro
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO,HttpSession session) {
		System.out.println("MemberController loginPro()");
		// 리턴할형 MemberDTO userCheck(MemberDTO memberDTO) 메서드 정의
		// 메서드 호출
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		if(memberDTO2!=null) {
			//아이디 비밀번호 일치
			//세션값 생성 "id",값
			session.setAttribute("id", memberDTO.getId());
//			주소줄 변경하면서 이동
			return "redirect:/main/main";
		}else {
			//아이디 비밀번호 틀림  뒤로이동  member/msg
//			주소줄 변경없이 이동
//			/WEB-INF/views/member/msg.jsp
			return "member/msg";
		}
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/main/main
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main() {
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/main/main.jsp
		return "main/main";
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/member/logout
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		//세션초기화
		session.invalidate();
		
//		주소줄 변경하면서 이동
		return "redirect:/main/main";
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/member/update
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update(HttpSession session,Model model) {
		//세션기억장소 id값 가져오기
		String id=(String)session.getAttribute("id");
		
		// id에 대한 정보를 조회 가져오기
		MemberDTO memberDTO=memberService.getMember(id);
		
		// model에 memberDTO를 담아서 이동
		model.addAttribute("memberDTO", memberDTO);
		
//		주소줄 변경없이 이동
//		/WEB-INF/views/member/update.jsp
		return "member/update";
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/member/updatePro
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String updatePro(MemberDTO memberDTO) {
		System.out.println("MemberController updatePro()");
		// 리턴할형 MemberDTO userCheck(MemberDTO memberDTO) 메서드 정의
		// 메서드 호출
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		if(memberDTO2!=null) {
			//아이디 비밀번호 일치
			//회원수정
			memberService.updateMember(memberDTO);
//			주소줄 변경하면서 이동
			return "redirect:/main/main";
		}else {
			//아이디 비밀번호 틀림  뒤로이동  member/msg
//			주소줄 변경없이 이동
//			/WEB-INF/views/member/msg.jsp
			return "member/msg";
		}
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/member/listmap
	@RequestMapping(value = "/member/listmap", method = RequestMethod.GET)
	public String listmap(Model model) {
		//메서드 호출
		List<Map<String, Object>> memberListMap
		     =memberService.getMemberListMap();
		//model 담아서 이동
		model.addAttribute("memberListMap", memberListMap);
		
//		주소줄 변경없이 이동
//		/WEB-INF/views/member/listmap.jsp
		return "member/listmap";
	}
	
	
}
