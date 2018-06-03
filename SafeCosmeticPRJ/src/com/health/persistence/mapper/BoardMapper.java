package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.boardDTO;
import com.health.config.Mapper;

@Mapper("BoardMapper")
public interface BoardMapper {
	//�Խ��Ǹ��
	List<boardDTO> getBoardList() throws Exception;
	//�Խ��ǵ��
	int insertBoard(boardDTO bDTO) throws Exception;
	//�Խ��� ��
	boardDTO getBoardDetail(String bo_no) throws Exception;
	//�Խ��� ����
	int DeleteBoard(String bo_no) throws Exception;
	
}
