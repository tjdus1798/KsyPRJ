package com.health.service;

import java.util.List;

import com.health.DTO.cosmeticDTO;
import com.health.DTO.ingDTO;
import com.health.DTO.likeDTO;

public interface ICosService {
	//화장품등록
	int insertCos(cosmeticDTO cDTO) throws Exception ;
	//화장품등록 - 성분목록
	List<ingDTO> CosIng() throws Exception ;
	//화장품등록 - 브랜드목록
	List<cosmeticDTO> CosBrand() throws Exception ;
	//화장품목록
	List<cosmeticDTO> getCosList() throws Exception ;
	//화장품상세
	cosmeticDTO getcosDetail(String cos_no) throws Exception ;
	//좋아요목록
	likeDTO getLikeList(likeDTO lDTO) throws Exception ;
	//브랜드명으로 검색
	List<cosmeticDTO> getBrandSearch(cosmeticDTO cDTO) throws Exception;
	//브랜드명 자동완성
	List<cosmeticDTO> getBrandAuto(cosmeticDTO cDTO) throws Exception;
	//완전체 성분으로 검색
	List<cosmeticDTO> getIngSearch(cosmeticDTO cDTO) throws Exception;
	//좋은성분제외 검색
	List<cosmeticDTO> getWithoutGood(cosmeticDTO cDTO) throws Exception;
	//피할성분제외 검색
	List<cosmeticDTO> getWithoutBad(cosmeticDTO cDTO) throws Exception;
	//좋은성분명 자동완성
	List<ingDTO> getIngGoodAuto(ingDTO iDTO) throws Exception;
	//나쁜성분명 자동완성
	List<ingDTO> getIngBadAuto(ingDTO iDTO) throws Exception;
	//화장품타입제외 검색
	List<cosmeticDTO> getWithoutCosType(cosmeticDTO cDTO) throws Exception;
	//임산부추천화장품
	List<cosmeticDTO> getPregnantList() throws Exception;
	//영유아추천화장품	
	List<cosmeticDTO> getBabyList() throws Exception;
	//알레르기추천화장품	
	List<cosmeticDTO> getAllergyList() throws Exception;
	
}
