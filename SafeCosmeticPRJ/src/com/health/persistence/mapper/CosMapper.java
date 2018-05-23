package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.cosmeticDTO;
import com.health.DTO.likeDTO;
import com.health.config.Mapper;

@Mapper("CosMapper")
public interface CosMapper {
	//ȭ��ǰ���
	public int insertCos(cosmeticDTO cDTO) throws Exception ;
	//ȭ��ǰ���
	public List<cosmeticDTO> getCosList() throws Exception;
	//ȭ��ǰ��
	public cosmeticDTO getcosDetail(String cos_no) throws Exception;
	//���ƿ���
	public likeDTO getLikeList(likeDTO lDTO) throws Exception;
	
}
