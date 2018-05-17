package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.ingDTO;
import com.health.persistence.mapper.IngMapper;
import com.health.service.IIngService;

@Service("IngService")
public class IngService implements IIngService{
	
	@Resource(name="IngMapper")
	private IngMapper ingMapper;
	//성분등록
	@Override
	public int insertIng(ingDTO iDTO) throws Exception {
		return ingMapper.insertIng(iDTO);
	}
	//성분목록
	@Override
	public List<ingDTO> getIngList() throws Exception {
		return ingMapper.getIngList();
	}
	//성분상세
	@Override
	public ingDTO getingDetail(String ing_no) throws Exception {
		return ingMapper.getingDetail(ing_no);
	}
	
	
}
