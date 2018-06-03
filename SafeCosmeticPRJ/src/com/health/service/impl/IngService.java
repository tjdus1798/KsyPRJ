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
	//���е��
	@Override
	public int insertIng(ingDTO iDTO) throws Exception {
		return ingMapper.insertIng(iDTO);
	}
	//���и��
	@Override
	public List<ingDTO> getIngList() throws Exception {
		return ingMapper.getIngList();
	}
	//���л�
	@Override
	public ingDTO getingDetail(String ing_no) throws Exception {
		return ingMapper.getingDetail(ing_no);
	}
	//���м���
	@Override
	public int updateIng(ingDTO iDTO) throws Exception {
		return ingMapper.updateIng(iDTO);
	}
	//���л���
	@Override
	public int deleteIng(ingDTO iDTO) throws Exception {
		return ingMapper.deleteIng(iDTO);
	}
	//����������ȸ(ȭ��ǰ��)
	@Override
	public ingDTO selectIngInfo(List<ingDTO> iList) throws Exception {
		return ingMapper.selectIngInfo(iList);
	}
	
}
