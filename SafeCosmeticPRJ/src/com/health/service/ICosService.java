package com.health.service;

import java.util.List;

import com.health.DTO.cos_imgDTO;
import com.health.DTO.cosmeticDTO;
import com.health.DTO.likeDTO;

public interface ICosService {
	//화장품등록
	int insertCos(cosmeticDTO cDTO) throws Exception ;
	//화장품목록
	List<cosmeticDTO> getCosList() throws Exception ;
	//화장품상세
	cosmeticDTO getcosDetail(String cos_no) throws Exception ;
	//좋아요목록
	likeDTO getLikeList(likeDTO lDTO) throws Exception ;
	
	
	


}
