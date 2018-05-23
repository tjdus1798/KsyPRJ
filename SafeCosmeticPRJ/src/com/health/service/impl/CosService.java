package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.cos_imgDTO;
import com.health.DTO.cosmeticDTO;
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

}
