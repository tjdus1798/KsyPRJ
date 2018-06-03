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
	//���м���
	int updateIng(ingDTO iDTO) throws Exception;
	//���л���
	int deleteIng(ingDTO iDTO) throws Exception;
	//����������ȸ(ȭ��ǰ��)
	ingDTO selectIngInfo(List<ingDTO> iList) throws Exception;

}
