package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.boardDTO;
import com.health.config.Mapper;

@Mapper("BoardMapper")
public interface BoardMapper {
	//게시판목록
	List<boardDTO> getBoardList() throws Exception;
	//게시판등록
	int insertBoard(boardDTO bDTO) throws Exception;
	//게시판 상세
	boardDTO getBoardDetail(String bo_no) throws Exception;
	//게시판 삭제
	int DeleteBoard(String bo_no) throws Exception;
	
}
