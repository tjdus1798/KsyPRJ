package com.health.service;

import java.util.List;

import com.health.DTO.boardDTO;

public interface IBoardService {
	//�Խ��Ǹ��
	List<boardDTO> getBoardList(int offset, int noOfRecords) throws Exception;
	//�Խ��ǵ��
	int insertBoard(boardDTO bDTO) throws Exception;
	//�Խ��ǻ�
	boardDTO getBoardDetail(String bo_no) throws Exception;
	//�Խ��ǻ���
	int DeleteBoard(String bo_no) throws Exception;
	//�Խ��� ����
	int updateBoard(boardDTO bdto) throws Exception;
	//��ȸ�� ����
	void cntUpdate(boardDTO bDTO) throws Exception;
	//게시판 총 개수
	int writeGetCount() throws Exception;
	


}
