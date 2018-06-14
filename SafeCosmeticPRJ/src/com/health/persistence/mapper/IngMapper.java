package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.ingDTO;
import com.health.config.Mapper;
import com.health.util.Criteria;

@Mapper("IngMapper")
public interface IngMapper {
	//���е��
	public int insertIng(ingDTO iDTO) throws Exception;
	//���и��
	public List<ingDTO> getIngList(int offset, int noOfRecords) throws Exception;
	//���л�
	public ingDTO getingDetail(String ing_no) throws Exception;
	//���м���
	public int updateIng(ingDTO iDTO) throws Exception;
	//���л���
	public int deleteIng(ingDTO iDTO) throws Exception;
	//����������ȸ(ȭ��ǰ��)
	public ingDTO selectIngInfo(List<ingDTO> iList) throws Exception;
	//���и� �ڵ��ϼ�
	public List<ingDTO> getIngNamesAuto() throws Exception;
	//성분 전체 갯수 조회
	public int writeGetCount() throws Exception;

}
