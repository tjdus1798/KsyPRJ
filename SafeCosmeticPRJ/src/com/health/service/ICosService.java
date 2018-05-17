package com.health.service;

import java.util.List;

import com.health.DTO.cos_imgDTO;
import com.health.DTO.cosmeticDTO;

public interface ICosService {
	//화장품등록
	int insertCos(cosmeticDTO cDTO) throws Exception ;
	//화장품목록
	List<cosmeticDTO> getCosList() throws Exception ;
	//화장품상세보기
	cosmeticDTO getCosNo(cosmeticDTO cDTO) throws Exception;
	
	
	


}
