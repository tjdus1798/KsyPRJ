package com.health.service;

import java.util.List;

import com.health.DTO.cos_imgDTO;
import com.health.DTO.cosmeticDTO;

public interface ICosService {
	//ȭ��ǰ���
	int insertCos(cosmeticDTO cDTO) throws Exception ;
	//ȭ��ǰ���
	List<cosmeticDTO> getCosList() throws Exception ;
	//ȭ��ǰ�󼼺���
	cosmeticDTO getCosNo(cosmeticDTO cDTO) throws Exception;
	
	
	


}
