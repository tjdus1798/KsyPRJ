package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.cosmeticDTO;
import com.health.DTO.ingDTO;
import com.health.DTO.likeDTO;
import com.health.config.Mapper;

@Mapper("CosMapper")
public interface CosMapper {
	//화장품등록
	public int insertCos(cosmeticDTO cDTO) throws Exception ;
	//화장품등록 - 성분목록
	public List<ingDTO> CosIng();
	//화장품등록 - 브랜드목록
	public List<cosmeticDTO> CosBrand();
	//화장품목록
	public List<cosmeticDTO> getCosList() throws Exception;
	//화장품상세
	public cosmeticDTO getcosDetail(String cos_no) throws Exception;
	//좋아요목록
	public likeDTO getLikeList(likeDTO lDTO) throws Exception;
	//브랜드명으로 검색
	public List<cosmeticDTO> getBrandSearch(cosmeticDTO cDTO) throws Exception;
	//브랜드명 자동완성
	public List<cosmeticDTO> getBrandAuto(cosmeticDTO cDTO) throws Exception;
	//성분으로 검색
	public List<cosmeticDTO> getIngSearch(cosmeticDTO cDTO) throws Exception;
	//좋은성분제외 검색
	public List<cosmeticDTO> getWithoutGood(cosmeticDTO cDTO) throws Exception;
	//피할성분제외 검색
	public List<cosmeticDTO> getWithoutBad(cosmeticDTO cDTO) throws Exception;
	//화장품타입제외 검색
	public List<cosmeticDTO> getWithoutCosType(cosmeticDTO cDTO) throws Exception;
	//나쁜성분명 자동완성
	public List<ingDTO> getIngBadAuto(ingDTO iDTO) throws Exception;
	//좋은성분명 자동완성
	public List<ingDTO> getIngGoodAuto(ingDTO iDTO) throws Exception;
	//임산부추천화장품
	public List<cosmeticDTO> getPregnantList() throws Exception;
	//영유아추천화장품
	public List<cosmeticDTO> getBabyList() throws Exception;
	//알레르기추천화장품
	public List<cosmeticDTO> getAllergyList() throws Exception;
	
}
