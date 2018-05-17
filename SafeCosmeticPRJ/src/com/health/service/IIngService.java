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

}
