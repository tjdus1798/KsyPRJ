package com.health.service;

import java.util.List;

import com.health.DTO.bo_imgDTO;
import com.health.DTO.boardDTO;

public interface IBoardService {
	//�Խ��Ǹ��
	List<boardDTO> getBoardList() throws Exception;
	//�Խ��ǵ��
	int insertBoard(boardDTO bDTO) throws Exception;
	//�̹������ε�� �˻�
	boardDTO getBo_no(boardDTO dDTO) throws Exception;
	//�̹������ε�
	void insertImage(bo_imgDTO bi) throws Exception;
	//�Խ��ǻ�
	boardDTO getBoardDetail(String bo_no) throws Exception;
	
	bo_imgDTO getBo_img(String bo_no) throws Exception;

}
