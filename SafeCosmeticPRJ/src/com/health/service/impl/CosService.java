package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.cos_imgDTO;
import com.health.DTO.cosmeticDTO;
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
	//화장품목록
	@Override
	public List<cosmeticDTO> getCosList() throws Exception {
		return cosMapper.getCosList();
	}
	//화장품상세보기
	@Override
	public cosmeticDTO getCosNo(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getCosNo(cDTO);
		}

}
