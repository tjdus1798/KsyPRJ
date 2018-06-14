package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.cosmeticDTO;
import com.health.DTO.ingDTO;
import com.health.DTO.likeDTO;
import com.health.persistence.mapper.CosMapper;
import com.health.service.ICosService;

@Service("CosService")
public class CosService implements ICosService{
	@Resource(name="CosMapper")
	private CosMapper cosMapper;
	//화장품 등록
	@Override
	public int insertCos(cosmeticDTO cDTO) throws Exception {
		return cosMapper.insertCos(cDTO);
	}
	//ȭ��ǰ��� - ���и��
	@Override
	public List<ingDTO> CosIng() throws Exception {
		return cosMapper.CosIng();
	}
	//ȭ��ǰ��� - �귣����
	@Override
	public List<cosmeticDTO> CosBrand() throws Exception {
		return cosMapper.CosBrand();
	}
	//ȭ��ǰ���
	@Override
	public List<cosmeticDTO> getCosList(int offset, int noOfRecords) throws Exception {
		return cosMapper.getCosList(offset,noOfRecords);
	}
	//화장품 상세
	@Override
	public cosmeticDTO getcosDetail(String cos_no) throws Exception {
		return cosMapper.getcosDetail(cos_no);
	}
	//화장품 상세 - 성분목록
	@Override
	public List<ingDTO> getcosDetailIng(String cos_no) throws Exception {
		return cosMapper.getcosDetailIng(cos_no);
	}
	//화장품 수정
	@Override
	public int updateCos(cosmeticDTO cdto) throws Exception {
		return  cosMapper.updateCos(cdto);
	}
	//화장품 삭제
	@Override
	public int DeleteCos(String cos_no) throws Exception {
		return cosMapper.DeleteCos(cos_no);
	}
	//좋아요 목록
	@Override
	public likeDTO getLikeList(likeDTO lDTO) throws Exception {
		return cosMapper.getLikeList(lDTO);
	}
	//브랜드명으로 검색
	@Override
	public List<cosmeticDTO> getBrandSearch(String search,int offset, int noOfRecords)  throws Exception{
		return cosMapper.getBrandSearch(search,offset,noOfRecords);
	}
	//브랜드명 자동완성
	@Override
	public List<cosmeticDTO> getBrandAuto(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getBrandAuto(cDTO);
	}
	//성분명으로 검색
	@Override
	public List<cosmeticDTO> getIngSearch(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getIngSearch(cDTO);
	}
	//좋은성분제외
	@Override
	public List<cosmeticDTO> getWithoutGood(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getWithoutGood(cDTO);
	}
	//나쁜성분제외
	@Override
	public List<cosmeticDTO> getWithoutBad(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getWithoutBad(cDTO);
	}
	//타입 제외
	@Override
	public List<cosmeticDTO> getWithoutCosType(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getWithoutCosType(cDTO);
	}
	//좋은 성분명 자동완성
	@Override
	public List<ingDTO> getIngGoodAuto(ingDTO iDTO) throws Exception {
		return cosMapper.getIngGoodAuto(iDTO);
	}
	//나쁜 성분명 자동완성
	@Override
	public List<ingDTO> getIngBadAuto(ingDTO iDTO) throws Exception {
		return cosMapper.getIngBadAuto(iDTO);
	}
	//임산부 추천 화장품
	@Override
	public List<cosmeticDTO> getPregnantList(int offset, int noOfRecords) throws Exception {
		return cosMapper.getPregnantList(offset,noOfRecords);
	}
	//영유아 추천 화장품
	@Override
	public List<cosmeticDTO> getBabyList(int offset, int noOfRecords) throws Exception {
		return cosMapper.getBabyList(offset,noOfRecords);
	}
	//알레르기 추천 화장품
	@Override
	public List<cosmeticDTO> getAllergyList(int offset, int noOfRecords) throws Exception {
		return cosMapper.getAllergyList(offset,noOfRecords);
	}
	//화장품 전체 갯수 조회
	@Override
	public int writeGetCount() throws Exception {
		return cosMapper.writeGetCount();
	}
	//코드테이블 ing_no 등록
	@Override
	public void codeInsert(String ing_name,String cos_name) throws Exception {
		cosMapper.codeInsert(ing_name,cos_name);
	}
	@Override
	public int writePregGetCount() throws Exception {
		return cosMapper.writePregGetCount();
	}
	@Override
	public int writeBabyGetCount() throws Exception {
		return cosMapper.writeBabyGetCount();
	}
	@Override
	public int writeAllergyGetCount() throws Exception {
		return cosMapper.writeAllergyGetCount();
	}
	@Override
	public void codeDelete(String cos_no) throws Exception {
		cosMapper.codeDelete(cos_no);
	}
	@Override
	public int writeBrandGetCount(String search) throws Exception {
		return cosMapper.writeBrandGetCount(search);
	}
	@Override
	public List<cosmeticDTO> getWithoutBad(String good, String cos_type, int offset, int maxPost) throws Exception {
		return cosMapper.getWithoutBad(good,cos_type,offset,maxPost);
	}
	@Override
	public int writeIngGetCount(String good, String cos_type) throws Exception {
		return  cosMapper.writeIngGetCount(good,cos_type);
	}
}
