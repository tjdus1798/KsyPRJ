package com.health.service;

import java.util.List;

import com.health.DTO.cosmeticDTO;
import com.health.DTO.ingDTO;
import com.health.DTO.likeDTO;

public interface ICosService {
	//화장품 등록
	int insertCos(cosmeticDTO cDTO) throws Exception ;
	//성분명으로 검색
	List<ingDTO> CosIng() throws Exception ;
	//브랜드명으로 검색
	List<cosmeticDTO> CosBrand() throws Exception ;
	//화장품 목록
	List<cosmeticDTO> getCosList(int offset, int noOfRecords) throws Exception ;
	//화장품 상세
	cosmeticDTO getcosDetail(String cos_no) throws Exception;
	//화장품 상세 - 성분목록
	List<ingDTO> getcosDetailIng(String cos_no) throws Exception;
	//화장품 수정
	int updateCos(cosmeticDTO cdto) throws Exception;
	//화장품 삭제
	int DeleteCos(String cos_no) throws Exception;
	//좋아요 목록
	likeDTO getLikeList(likeDTO lDTO) throws Exception ;
	//브랜드명으로 검색
	List<cosmeticDTO> getBrandSearch(String search,int offset, int noOfRecords) throws Exception;
	//브랜드명 자동완성
	List<cosmeticDTO> getBrandAuto(cosmeticDTO cDTO) throws Exception;
	//성분명으로 검색
	List<cosmeticDTO> getIngSearch(cosmeticDTO cDTO) throws Exception;
	//좋은성분제외
	List<cosmeticDTO> getWithoutGood(cosmeticDTO cDTO) throws Exception;
	//나쁜성분제외
	List<cosmeticDTO> getWithoutBad(cosmeticDTO cDTO) throws Exception;
	//좋은성분 자동완성
	List<ingDTO> getIngGoodAuto(ingDTO iDTO) throws Exception;
	//나쁜성분 자동완성
	List<ingDTO> getIngBadAuto(ingDTO iDTO) throws Exception;
	//타입 제외
	List<cosmeticDTO> getWithoutCosType(cosmeticDTO cDTO) throws Exception;
	//임산부 추천화장품
	List<cosmeticDTO> getPregnantList(int offset, int noOfRecords) throws Exception;
	//영유아 추천화장품
	List<cosmeticDTO> getBabyList(int offset, int noOfRecords) throws Exception;
	//알레르기 추천화장품
	List<cosmeticDTO> getAllergyList(int offset, int noOfRecords) throws Exception;
	//화장품 전체 갯수 조회
	int writeGetCount() throws Exception;
	//코드테이블 ing_no 등록
	void codeInsert(String ing_name,String cos_name) throws Exception;
	int writePregGetCount() throws Exception;
	
	int writeBabyGetCount() throws Exception;
	
	int writeAllergyGetCount() throws Exception;
	
	void codeDelete(String cos_no) throws Exception;
	
	int writeBrandGetCount(String search) throws Exception;
	
	List<cosmeticDTO> getWithoutBad(String good, String cos_type, int offset, int maxPost) throws Exception;
	
	int writeIngGetCount(String good, String cos_type) throws Exception;
	
}
