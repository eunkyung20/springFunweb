package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.boardMapper";
	
	@Override
	public void insertBoard(BoardDTO boardDTO) {
		System.out.println("BoardDAOImpl insertBoard()");
		
		sqlSession.insert(namespace+".insertBoard", boardDTO);
	}

	@Override
	public Integer getMaxNum() {
		System.out.println("BoardDAOImpl getMaxNum()");
		
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("BoardDAOImpl getBoardList()");
		// startRow -1 
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getBoardList", pageDTO);
	}

	@Override
	public int getBoardCount(PageDTO pageDTO) {
		System.out.println("BoardDAOImpl getBoardCount()");
		
		return sqlSession.selectOne(namespace+".getBoardCount",pageDTO);
	}

	@Override
	public BoardDTO getBoard(int num) {
		System.out.println("BoardDAOImpl getBoard()");
		
		return sqlSession.selectOne(namespace+".getBoard", num);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		System.out.println("BoardDAOImpl updateBoard()");
		
		sqlSession.update(namespace+".updateBoard", boardDTO);
	}

	@Override
	public void deleteBoard(int num) {
		System.out.println("BoardDAOImpl deleteBoard()");
		
		sqlSession.delete(namespace+".deleteBoard", num);
	}

}
