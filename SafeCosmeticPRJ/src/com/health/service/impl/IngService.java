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
	//성분수정
	@Override
	public int updateIng(ingDTO iDTO) throws Exception {
		return ingMapper.updateIng(iDTO);
	}
	//성분삭제
	@Override
	public int deleteIng(ingDTO iDTO) throws Exception {
		return ingMapper.deleteIng(iDTO);
	}
	//성분정보조회(화장품상세)
	@Override
	public ingDTO selectIngInfo(List<ingDTO> iList) throws Exception {
		return ingMapper.selectIngInfo(iList);
	}
	
}
