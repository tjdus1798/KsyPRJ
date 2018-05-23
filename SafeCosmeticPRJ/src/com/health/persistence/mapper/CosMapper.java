package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.cosmeticDTO;
import com.health.DTO.likeDTO;
import com.health.config.Mapper;

@Mapper("CosMapper")
public interface CosMapper {
	//화장품등록
	public int insertCos(cosmeticDTO cDTO) throws Exception ;
	//화장품목록
	public List<cosmeticDTO> getCosList() throws Exception;
	//화장품상세
	public cosmeticDTO getcosDetail(String cos_no) throws Exception;
	//좋아요목록
	public likeDTO getLikeList(likeDTO lDTO) throws Exception;
	
}
