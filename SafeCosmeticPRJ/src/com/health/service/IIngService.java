package com.health.service;

import java.util.List;

import com.health.DTO.ingDTO;
import com.health.util.Criteria;

public interface IIngService {

	//성분등록
	int insertIng(ingDTO iDTO) throws Exception;
	//성분목록
	List<ingDTO> getIngList(int offset, int noOfRecords) throws Exception;
	//성분상세
	ingDTO getingDetail(String ing_no) throws Exception;
	//성분수정
	int updateIng(ingDTO iDTO) throws Exception;
	//성분삭제
	int deleteIng(ingDTO iDTO) throws Exception;
	//����������ȸ(ȭ��ǰ��)
	ingDTO selectIngInfo(List<ingDTO> iList) throws Exception;
	//���и� �ڵ��ϼ�
	List<ingDTO> getIngNamesAuto() throws Exception;
	//성분 전체 갯수 조회
	int writeGetCount() throws Exception;

}
