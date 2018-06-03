package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.boardDTO;
import com.health.persistence.mapper.BoardMapper;
import com.health.service.IBoardService;

@Service("BoardService")
public class BoardService implements IBoardService{
	@Resource(name="BoardMapper")
	private BoardMapper boardMapper;
	//게시판목록
	@Override
	public List<boardDTO> getBoardList()  throws Exception {
		return boardMapper.getBoardList();
	}
	//게시판등록
	@Override
	public int insertBoard(boardDTO bDTO) throws Exception {
		return boardMapper.insertBoard(bDTO);
	}

	//게시판상세
	@Override
	public boardDTO getBoardDetail(String bo_no) throws Exception {
		return boardMapper.getBoardDetail(bo_no);
	}
	//게시판삭제
	@Override
	public int DeleteBoard(String bo_no) throws Exception {
		return boardMapper.DeleteBoard(bo_no);
	}

	
	
}
