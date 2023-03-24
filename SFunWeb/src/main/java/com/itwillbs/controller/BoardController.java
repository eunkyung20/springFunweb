package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
public class BoardController {
	
	// 부모 인터페이스 멤버변수 정의 => 객체생성
	@Inject
	private BoardService boardService;
	
	// 가상주소 http://localhost:8080/SFunWeb/board/write
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public String write() {
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/center/write.jsp
		return "center/write";
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/board/writePro
	@RequestMapping(value = "/board/writePro", method = RequestMethod.POST)
	public String writePro(BoardDTO boardDTO) {
		System.out.println("BoardController writePro()");
		//글쓰기 처리 BoardService, BoardServiceImpl, insertBoard()
		//         BoardDAO, BoardDAOImpl, insertBoard()
		boardService.insertBoard(boardDTO);
		
//		주소줄 변경하면서 이동
		return "redirect:/board/list";
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/board/list
	// 가상주소 http://localhost:8080/SFunWeb/board/list?pageNum=2
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		System.out.println("BoardController list()");
		//검색어 가져오기
		String search=request.getParameter("search");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize=15;
		// 현페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			//pageNum 없으면 1페이지 설정
			pageNum="1";
		}
		// 페이지번호를 => 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		//검색어
		pageDTO.setSearch(search);
		
		List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
		
		//페이징 처리
		//검색어
		int count = boardService.getBoardCount(pageDTO);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
				
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/center/notice.jsp
		return "center/notice";
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/board/content?num=
	@RequestMapping(value = "/board/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		System.out.println("BoardController content()");
		int num=Integer.parseInt(request.getParameter("num"));
		
		BoardDTO boardDTO=boardService.getBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/center/content.jsp
		return "center/content";
	}
	
	// 가상주소 http://localhost:8080/SFunWeb/board/update?num=
		@RequestMapping(value = "/board/update", method = RequestMethod.GET)
		public String update(HttpServletRequest request, Model model) {
			System.out.println("BoardController update()");
			int num=Integer.parseInt(request.getParameter("num"));
			
			BoardDTO boardDTO=boardService.getBoard(num);
			
			model.addAttribute("boardDTO", boardDTO);
			
//			주소줄 변경없이 이동
//			/WEB-INF/views/파일이름.jsp
//			/WEB-INF/views/center/update.jsp
			return "center/update";
		}
		
		// 가상주소 http://localhost:8080/SFunWeb/board/updatePro
		@RequestMapping(value = "/board/updatePro", method = RequestMethod.POST)
		public String updatePro(BoardDTO boardDTO) {
			System.out.println("BoardController updatePro()");
			
			boardService.updateBoard(boardDTO);
			
//			주소줄 변경하면서 이동
			return "redirect:/board/list";
		}
		
		// 가상주소 http://localhost:8080/SFunWeb/board/delete?num=
		@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
		public String delete(HttpServletRequest request, Model model) {
			System.out.println("BoardController delete()");
			int num=Integer.parseInt(request.getParameter("num"));
			
			boardService.deleteBoard(num);
			
//			주소줄 변경하면서 이동
			return "redirect:/board/list";
		}
	
}
