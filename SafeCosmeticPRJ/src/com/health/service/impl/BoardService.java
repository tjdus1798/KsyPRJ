package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.bo_imgDTO;
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
	//이미지업로드시 검색
	@Override
	public boardDTO getBo_no(boardDTO dDTO) throws Exception {
		return boardMapper.getBo_no(dDTO);
	}
	//이미지업로드
	@Override
	public void insertImage(bo_imgDTO bi) throws Exception {
		boardMapper.insertImage(bi);
	}
	//게시판상세
	@Override
	public boardDTO getBoardDetail(String bo_no) throws Exception {
		return boardMapper.getBoardDetail(bo_no);
	}
	@Override
	public bo_imgDTO getBo_img(String bo_no) throws Exception {
		return boardMapper.getBo_img(bo_no);
	}
	
	
}
