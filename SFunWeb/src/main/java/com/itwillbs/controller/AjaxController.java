package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;
import com.itwillbs.service.MemberService;

@RestController
public class AjaxController {
	
	// 부모 인페이스 멤버변수 선언 => 자동으로 객체생성 
	@Inject
	private MemberService memberService;
	
	@Inject
	private BoardService boardService;
	
	
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
	
	
	// 가상주소 http://localhost:8080/SFunWeb/board/listjson
	@RequestMapping(value = "/board/listjson", method = RequestMethod.GET)
	public ResponseEntity<List<BoardDTO>> listjson() {  //리턴할 형 => List<BoardDTO> 형

		// 디비 최근글 5개 가져오기
		PageDTO pageDTO=new PageDTO(); 
		pageDTO.setPageSize(5);
		pageDTO.setPageNum("1");
		pageDTO.setCurrentPage(1); //현재페이지 1페이지
		
		List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
		
		//출력 결과 ResponseEntity 저장 => 되돌아감
		ResponseEntity<List<BoardDTO>> entity=
				new ResponseEntity<List<BoardDTO>>(boardList,HttpStatus.OK);
		
		// List<BoardDTO>형을 => json데이터 형으로 변경
		// jackson-databind 프로그램설치 => 스프링에서는 자동으로 json데이터형으로 변경 해줌
		
		return entity;
	}
	
}
