package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.ingDTO;
import com.health.persistence.mapper.IngMapper;
import com.health.service.IIngService;
import com.health.util.Criteria;

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
	public List<ingDTO> getIngList(int offset, int noOfRecords) throws Exception {
		return ingMapper.getIngList(offset, noOfRecords);
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
	//���и� �ڵ��ϼ�
	@Override
	public List<ingDTO> getIngNamesAuto() throws Exception {
		return ingMapper.getIngNamesAuto();
	}
	//성분 전체 갯수 조회
	@Override
	public int writeGetCount() throws Exception {
		return ingMapper.writeGetCount();
	}
	
}
