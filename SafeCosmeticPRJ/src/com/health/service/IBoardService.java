package com.health.service;

import java.util.List;

import com.health.DTO.boardDTO;

public interface IBoardService {
	//게시판목록
	List<boardDTO> getBoardList() throws Exception;
	//게시판등록
	int insertBoard(boardDTO bDTO) throws Exception;
	//게시판상세
	boardDTO getBoardDetail(String bo_no) throws Exception;
	//게시판삭제
	int DeleteBoard(String bo_no) throws Exception;
	


}
