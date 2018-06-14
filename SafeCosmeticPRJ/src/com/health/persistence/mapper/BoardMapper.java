package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.boardDTO;
import com.health.config.Mapper;

@Mapper("BoardMapper")
public interface BoardMapper {
	//�Խ��Ǹ��
	List<boardDTO> getBoardList(int offset, int noOfRecords) throws Exception;
	//�Խ��ǵ��
	int insertBoard(boardDTO bDTO) throws Exception;
	//�Խ��� ��
	boardDTO getBoardDetail(String bo_no) throws Exception;
	//�Խ��� ����
	int DeleteBoard(String bo_no) throws Exception;
	//�Խ��� ����
	int updateBoard(boardDTO bdto) throws Exception;
	//��ȸ�� ����
	void cntUpdate(boardDTO bDTO) throws Exception;
	
	int writeGetCount() throws Exception;
	
}
