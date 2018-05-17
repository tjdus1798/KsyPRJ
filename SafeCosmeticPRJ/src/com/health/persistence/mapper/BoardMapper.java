package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.bo_imgDTO;
import com.health.DTO.boardDTO;
import com.health.config.Mapper;

@Mapper("BoardMapper")
public interface BoardMapper {
	//게시판목록
	List<boardDTO> getBoardList() throws Exception;
	//게시판등록
	int insertBoard(boardDTO bDTO) throws Exception;
	//이미지업로드시 검색
	boardDTO getBo_no(boardDTO dDTO) throws Exception;
	//이미지업로드
	void insertImage(bo_imgDTO bi) throws Exception;
	//게시판 상세
	boardDTO getBoardDetail(String bo_no) throws Exception;
	
	bo_imgDTO getBo_img(String bo_no) throws Exception;

}
