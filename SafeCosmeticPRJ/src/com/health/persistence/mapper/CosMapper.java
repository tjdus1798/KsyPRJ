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
	//ȭ��ǰ���
	public List<cosmeticDTO> getCosList() throws Exception;
	//ȭ��ǰ��
	public cosmeticDTO getcosDetail(String cos_no) throws Exception;
	//���ƿ���
	public likeDTO getLikeList(likeDTO lDTO) throws Exception;
	//�귣������� �˻�
	public List<cosmeticDTO> getBrandSearch(cosmeticDTO cDTO) throws Exception;
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
	public List<cosmeticDTO> getPregnantList() throws Exception;
	//��������õȭ��ǰ
	public List<cosmeticDTO> getBabyList() throws Exception;
	//�˷�������õȭ��ǰ
	public List<cosmeticDTO> getAllergyList() throws Exception;
	
}
