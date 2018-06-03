package com.health.service;

import java.util.List;

import com.health.DTO.cosmeticDTO;
import com.health.DTO.ingDTO;
import com.health.DTO.likeDTO;

public interface ICosService {
	//ȭ��ǰ���
	int insertCos(cosmeticDTO cDTO) throws Exception ;
	//ȭ��ǰ��� - ���и��
	List<ingDTO> CosIng() throws Exception ;
	//ȭ��ǰ��� - �귣����
	List<cosmeticDTO> CosBrand() throws Exception ;
	//ȭ��ǰ���
	List<cosmeticDTO> getCosList() throws Exception ;
	//ȭ��ǰ��
	cosmeticDTO getcosDetail(String cos_no) throws Exception ;
	//���ƿ���
	likeDTO getLikeList(likeDTO lDTO) throws Exception ;
	//�귣������� �˻�
	List<cosmeticDTO> getBrandSearch(cosmeticDTO cDTO) throws Exception;
	//�귣��� �ڵ��ϼ�
	List<cosmeticDTO> getBrandAuto(cosmeticDTO cDTO) throws Exception;
	//����ü �������� �˻�
	List<cosmeticDTO> getIngSearch(cosmeticDTO cDTO) throws Exception;
	//������������ �˻�
	List<cosmeticDTO> getWithoutGood(cosmeticDTO cDTO) throws Exception;
	//���Ҽ������� �˻�
	List<cosmeticDTO> getWithoutBad(cosmeticDTO cDTO) throws Exception;
	//�������и� �ڵ��ϼ�
	List<ingDTO> getIngGoodAuto(ingDTO iDTO) throws Exception;
	//���ۼ��и� �ڵ��ϼ�
	List<ingDTO> getIngBadAuto(ingDTO iDTO) throws Exception;
	//ȭ��ǰŸ������ �˻�
	List<cosmeticDTO> getWithoutCosType(cosmeticDTO cDTO) throws Exception;
	//�ӻ����õȭ��ǰ
	List<cosmeticDTO> getPregnantList() throws Exception;
	//��������õȭ��ǰ	
	List<cosmeticDTO> getBabyList() throws Exception;
	//�˷�������õȭ��ǰ	
	List<cosmeticDTO> getAllergyList() throws Exception;
	
}
