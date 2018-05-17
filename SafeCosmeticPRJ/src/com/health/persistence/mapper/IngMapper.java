package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.ingDTO;
import com.health.config.Mapper;

@Mapper("IngMapper")
public interface IngMapper {
	//���е��
	public int insertIng(ingDTO iDTO) throws Exception;
	//���и��
	public List<ingDTO> getIngList() throws Exception;
	//���л�
	public ingDTO getingDetail(String ing_no) throws Exception;

}
