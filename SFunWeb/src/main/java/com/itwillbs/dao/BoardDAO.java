package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

public interface BoardDAO {

	void insertBoard(BoardDTO boardDTO);

	Integer getMaxNum();

	List<BoardDTO> getBoardList(PageDTO pageDTO);
//검색어
	int getBoardCount(PageDTO pageDTO);

	BoardDTO getBoard(int num);

	void updateBoard(BoardDTO boardDTO);

	void deleteBoard(int num);

}
