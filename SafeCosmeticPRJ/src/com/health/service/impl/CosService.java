package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.cosmeticDTO;
import com.health.DTO.ingDTO;
import com.health.DTO.likeDTO;
import com.health.persistence.mapper.CosMapper;
import com.health.service.ICosService;

@Service("CosService")
public class CosService implements ICosService{
	@Resource(name="CosMapper")
	private CosMapper cosMapper;
	//ȭ��ǰ���
	@Override
	public int insertCos(cosmeticDTO cDTO) throws Exception {
		return cosMapper.insertCos(cDTO);
	}
	//ȭ��ǰ��� - ���и��
	@Override
	public List<ingDTO> CosIng() throws Exception {
		return cosMapper.CosIng();
	}
	//ȭ��ǰ��� - �귣����
	@Override
	public List<cosmeticDTO> CosBrand() throws Exception {
		return cosMapper.CosBrand();
	}
	//ȭ��ǰ���
	@Override
	public List<cosmeticDTO> getCosList() throws Exception {
		return cosMapper.getCosList();
	}
	//ȭ��ǰ�󼼺���
	@Override
	public cosmeticDTO getcosDetail(String cos_no) throws Exception {
		return cosMapper.getcosDetail(cos_no);
	}
	//���ƿ���
	@Override
	public likeDTO getLikeList(likeDTO lDTO) throws Exception {
		return cosMapper.getLikeList(lDTO);
	}
	//�귣������� �˻�
	@Override
	public List<cosmeticDTO> getBrandSearch(cosmeticDTO cDTO)  throws Exception{
		return cosMapper.getBrandSearch(cDTO);
	}
	//�귣��� �ڵ��ϼ�
	@Override
	public List<cosmeticDTO> getBrandAuto(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getBrandAuto(cDTO);
	}
	//�������� �˻�
	@Override
	public List<cosmeticDTO> getIngSearch(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getIngSearch(cDTO);
	}
	//������������ �˻�
	@Override
	public List<cosmeticDTO> getWithoutGood(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getWithoutGood(cDTO);
	}
	//���Ҽ������� �˻�
	@Override
	public List<cosmeticDTO> getWithoutBad(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getWithoutBad(cDTO);
	}
	//ȭ��ǰŸ������ �˻�
	@Override
	public List<cosmeticDTO> getWithoutCosType(cosmeticDTO cDTO) throws Exception {
		return cosMapper.getWithoutCosType(cDTO);
	}
	//�������и� �ڵ��ϼ�
	@Override
	public List<ingDTO> getIngGoodAuto(ingDTO iDTO) throws Exception {
		return cosMapper.getIngGoodAuto(iDTO);
	}
	//���ۼ��и� �ڵ��ϼ�
	@Override
	public List<ingDTO> getIngBadAuto(ingDTO iDTO) throws Exception {
		return cosMapper.getIngBadAuto(iDTO);
	}
	//�ӻ����õȭ��ǰ
	@Override
	public List<cosmeticDTO> getPregnantList() throws Exception {
		return cosMapper.getPregnantList();
	}
	//��������õȭ��ǰ
	@Override
	public List<cosmeticDTO> getBabyList() throws Exception {
		return cosMapper.getBabyList();
	}
	//�˷�������õȭ��ǰ
	@Override
	public List<cosmeticDTO> getAllergyList() throws Exception {
		return cosMapper.getAllergyList();
	}

}
