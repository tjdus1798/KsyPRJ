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
	public List<boardDTO> getBoardList(int offset, int noOfRecords)  throws Exception {
		return boardMapper.getBoardList(offset,noOfRecords);
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
	//�Խ��Ǽ���
	@Override
	public int updateBoard(boardDTO bdto) throws Exception {
		return boardMapper.updateBoard(bdto);
	}
	//��ȸ�� ����
	@Override
	public void cntUpdate(boardDTO bDTO) throws Exception {
		boardMapper.cntUpdate(bDTO);
	}
	@Override
	public int writeGetCount() throws Exception {
		return boardMapper.writeGetCount();
	}

	
	
}
