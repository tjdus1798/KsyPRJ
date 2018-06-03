package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.ingDTO;
import com.health.config.Mapper;

@Mapper("IngMapper")
public interface IngMapper {
	//성분등록
	public int insertIng(ingDTO iDTO) throws Exception;
	//성분목록
	public List<ingDTO> getIngList() throws Exception;
	//성분상세
	public ingDTO getingDetail(String ing_no) throws Exception;
	//성분수정
	public int updateIng(ingDTO iDTO) throws Exception;
	//성분삭제
	public int deleteIng(ingDTO iDTO) throws Exception;
	//성분정보조회(화장품상세)
	public ingDTO selectIngInfo(List<ingDTO> iList) throws Exception;

}
