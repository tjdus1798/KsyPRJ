package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.cosmeticDTO;
import com.health.DTO.ingDTO;
import com.health.DTO.likeDTO;
import com.health.config.Mapper;

@Mapper("CosMapper")
public interface CosMapper {
	//ȭ��ǰ���
	public int insertCos(cosmeticDTO cDTO) throws Exception ;
	//ȭ��ǰ��� - ���и��
	public List<ingDTO> CosIng();
	//ȭ��ǰ��� - �귣����
	public List<cosmeticDTO> CosBrand();
	//화장품 목록
	public List<cosmeticDTO> getCosList(int offset, int noOfRecords) throws Exception;
	//화장품 상세
	public cosmeticDTO getcosDetail(String cos_no) throws Exception;
	//화장품 상세 - 성분목록
	public List<ingDTO> getcosDetailIng(String cos_no) throws Exception;
	//화장품 수정
	public int updateCos(cosmeticDTO cdto) throws Exception;
	//화장품 삭제
	public int DeleteCos(String cos_no) throws Exception;
	//���ƿ���
	public likeDTO getLikeList(likeDTO lDTO) throws Exception;
	//�귣������� �˻�
	public List<cosmeticDTO> getBrandSearch(String search,int offset, int noOfRecords) throws Exception;
	//�귣��� �ڵ��ϼ�
	public List<cosmeticDTO> getBrandAuto(cosmeticDTO cDTO) throws Exception;
	//�������� �˻�
	public List<cosmeticDTO> getIngSearch(cosmeticDTO cDTO) throws Exception;
	//������������ �˻�
	public List<cosmeticDTO> getWithoutGood(cosmeticDTO cDTO) throws Exception;
	//���Ҽ������� �˻�
	public List<cosmeticDTO> getWithoutBad(cosmeticDTO cDTO) throws Exception;
	//ȭ��ǰŸ������ �˻�
	public List<cosmeticDTO> getWithoutCosType(cosmeticDTO cDTO) throws Exception;
	//���ۼ��и� �ڵ��ϼ�
	public List<ingDTO> getIngBadAuto(ingDTO iDTO) throws Exception;
	//�������и� �ڵ��ϼ�
	public List<ingDTO> getIngGoodAuto(ingDTO iDTO) throws Exception;
	//�ӻ����õȭ��ǰ
	public List<cosmeticDTO> getPregnantList(int offset, int noOfRecords) throws Exception;
	//��������õȭ��ǰ
	public List<cosmeticDTO> getBabyList(int offset, int noOfRecords) throws Exception;
	//�˷�������õȭ��ǰ
	public List<cosmeticDTO> getAllergyList(int offset, int noOfRecords) throws Exception;
	//화장품 전체 갯수 조회
	public int writeGetCount() throws Exception;
	//코드테이블 ing_no 등록
	public void codeInsert(String ing_name,String cos_name) throws Exception;
	//
	public int writePregGetCount() throws Exception;
	//
	public int writeBabyGetCount() throws Exception;
	//
	public int writeAllergyGetCount() throws Exception;
	public void codeDelete(String cos_no) throws Exception;
	public int writeBrandGetCount(String search) throws Exception;
	public List<cosmeticDTO> getWithoutBad(String good, String cos_type, int offset, int maxPost) throws Exception;
	public int writeIngGetCount(String good, String cos_type) throws Exception;
	
}
