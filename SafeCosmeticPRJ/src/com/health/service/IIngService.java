package com.health.service;

import java.util.List;

import com.health.DTO.ingDTO;

public interface IIngService {

	//성분등록
	int insertIng(ingDTO iDTO) throws Exception;
	//성분목록
	List<ingDTO> getIngList() throws Exception;
	//성분상세
	ingDTO getingDetail(String ing_no) throws Exception;
	//성분수정
	int updateIng(ingDTO iDTO) throws Exception;
	//성분삭제
	int deleteIng(ingDTO iDTO) throws Exception;
	//성분정보조회(화장품상세)
	ingDTO selectIngInfo(List<ingDTO> iList) throws Exception;

}
