package com.health.service;

import java.util.List;

import com.health.DTO.boardDTO;

public interface IBoardService {
	//�Խ��Ǹ��
	List<boardDTO> getBoardList() throws Exception;
	//�Խ��ǵ��
	int insertBoard(boardDTO bDTO) throws Exception;
	//�Խ��ǻ�
	boardDTO getBoardDetail(String bo_no) throws Exception;
	//�Խ��ǻ���
	int DeleteBoard(String bo_no) throws Exception;
	


}
