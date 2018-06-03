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
	//화장품등록
	@Override
	public int insertCos(cosmeticDTO cDTO) throws Exception {
		return cosMapper.insertCos(cDTO);
	}
	//화장품등록 - 성분목록
	@Override
	public List<ingDTO> CosIng() throws Exception {
		return cosMapper.CosIng();
	}
	//화장품등록 - 브랜드목록
	@Override
	public List<cosmeticDTO> CosBrand() throws Exception {
		return cosMapper.CosBrand();
	}
	//화장품목록
	@Override
	public List<cosmeticDTO> getCosList() throws Exception {
		return cosMapper.getCosList();
	}
	//화장품상세보기
	@Override
	public cosmeticDTO getcosDetail(String cos_no) throws Exception {
		return cosMapper.getcosDetail(cos_no);
	}
	//좋아요목록
	@Override
	public likeDTO getLikeList(likeDTO lDTO) throws Exception {
		return cosMapper.getLikeList(lDTO);
	}
	//브랜드명으로 검색
	@Override
	public List<cosmeticDTO> getBrandSearch(cosmeticDTO cDTO)  throws Exception{
		return cosMapper.getBrandSearch(cDTO);
	}
	//브랜드명 자동완성
	@Override
	public List<cosmeticDTO> getBrandAuto(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getBrandAuto(cDTO);
	}
	//성분으로 검색
	@Override
	public List<cosmeticDTO> getIngSearch(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getIngSearch(cDTO);
	}
	//좋은성분제외 검색
	@Override
	public List<cosmeticDTO> getWithoutGood(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getWithoutGood(cDTO);
	}
	//피할성분제외 검색
	@Override
	public List<cosmeticDTO> getWithoutBad(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getWithoutBad(cDTO);
	}
	//화장품타입제외 검색
	@Override
	public List<cosmeticDTO> getWithoutCosType(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getWithoutCosType(cDTO);
	}
	//좋은성분명 자동완성
	@Override
	public List<ingDTO> getIngGoodAuto(ingDTO iDTO) throws Exception {
		return cosMapper.getIngGoodAuto(iDTO);
	}
	//나쁜성분명 자동완성
	@Override
	public List<ingDTO> getIngBadAuto(ingDTO iDTO) throws Exception {
		return cosMapper.getIngBadAuto(iDTO);
	}
	//임산부추천화장품
	@Override
	public List<cosmeticDTO> getPregnantList() throws Exception {
		return cosMapper.getPregnantList();
	}
	//영유아추천화장품
	@Override
	public List<cosmeticDTO> getBabyList() throws Exception {
		return cosMapper.getBabyList();
	}
	//알레르기추천화장품
	@Override
	public List<cosmeticDTO> getAllergyList() throws Exception {
		return cosMapper.getAllergyList();
	}

}
