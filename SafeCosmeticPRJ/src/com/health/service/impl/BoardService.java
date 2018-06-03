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
	//�Խ��Ǹ��
	@Override
	public List<boardDTO> getBoardList()  throws Exception {
		return boardMapper.getBoardList();
	}
	//�Խ��ǵ��
	@Override
	public int insertBoard(boardDTO bDTO) throws Exception {
		return boardMapper.insertBoard(bDTO);
	}

	//�Խ��ǻ�
	@Override
	public boardDTO getBoardDetail(String bo_no) throws Exception {
		return boardMapper.getBoardDetail(bo_no);
	}
	//�Խ��ǻ���
	@Override
	public int DeleteBoard(String bo_no) throws Exception {
		return boardMapper.DeleteBoard(bo_no);
	}

	
	
}
