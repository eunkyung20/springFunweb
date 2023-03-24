package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void insertBoard(BoardDTO boardDTO) {
		System.out.println("BoardServiceImpl insertBoard()");
		// name, subject,content
		// num , readcount, date 
		if(boardDAO.getMaxNum()==null) {
			boardDTO.setNum(1);
		}else {
			boardDTO.setNum(boardDAO.getMaxNum()+1);
		}
		
		boardDTO.setReadcount(0);
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		boardDAO.insertBoard(boardDTO);
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("BoardServiceImpl getBoardList()");
		// startRow endRow 구하기
		//시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
			
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
			
		return boardDAO.getBoardList(pageDTO);
	}
//검색어
	@Override
	public int getBoardCount(PageDTO pageDTO) {
		System.out.println("BoardServiceImpl getBoardCount()");
		
		return boardDAO.getBoardCount(pageDTO);
	}

	@Override
	public BoardDTO getBoard(int num) {
		System.out.println("BoardServiceImpl getBoard()");
		
		return boardDAO.getBoard(num);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		System.out.println("BoardServiceImpl updateBoard()");
		
		boardDAO.updateBoard(boardDTO);
	}

	@Override
	public void deleteBoard(int num) {
		System.out.println("BoardServiceImpl deleteBoard()");
		
		boardDAO.deleteBoard(num);
	}

}
