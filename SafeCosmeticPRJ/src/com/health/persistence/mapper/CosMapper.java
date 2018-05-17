package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.cos_imgDTO;
import com.health.DTO.cosmeticDTO;
import com.health.config.Mapper;

@Mapper("CosMapper")
public interface CosMapper {
	//화장품등록
	public int insertCos(cosmeticDTO cDTO) throws Exception ;
	//화장품목록
	public List<cosmeticDTO> getCosList() throws Exception;
	//화장품상세보기
	public cosmeticDTO getCosNo(cosmeticDTO cDTO) throws Exception;
	
}
