package com.health.service;

import java.util.List;

import com.health.DTO.ingDTO;

public interface IIngService {

	//���е��
	int insertIng(ingDTO iDTO) throws Exception;
	//���и��
	List<ingDTO> getIngList() throws Exception;
	//���л�
	ingDTO getingDetail(String ing_no) throws Exception;

}
