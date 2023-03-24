package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@RestController
public class AjaxController {
	
	// 부모 인페이스 멤버변수 선언 => 자동으로 객체생성 
	@Inject
	private MemberService memberService;
	
	
	// 가상주소 http://localhost:8080/SFunWeb/member/idCheck
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		String result="";
		// request 파라미터 id값 가져오기
		String id=request.getParameter("id");
		// 디비 아이디 중복체크
		MemberDTO memberDTO=memberService.getMember(id);
		if(memberDTO!=null) {
			//아이디 있음 => 아이디 중복
			result="iddup";
		}else {
			//아이디 없음 => 아이디 사용가능
			result="idok";
		}
		//출력 결과 ResponseEntity 저장 => 되돌아감
		ResponseEntity<String> entity=
				new ResponseEntity<String>(result,HttpStatus.OK);
		return entity;
	}
	
}
