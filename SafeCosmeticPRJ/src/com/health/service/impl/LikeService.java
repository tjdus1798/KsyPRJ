package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.ageDTO;
import com.health.DTO.cosmeticDTO;
import com.health.DTO.likeDTO;
import com.health.DTO.skin_typeDTO;
import com.health.DTO.somethingDTO;
import com.health.persistence.mapper.LikeMapper;
import com.health.service.ILikeService;

@Service("LikeService")
public class LikeService implements ILikeService{
	@Resource(name="LikeMapper")
	private LikeMapper likeMapper;
	//���ƿ����
	@Override
	public int deleteLike(likeDTO lDTO) throws Exception {
		return likeMapper.deleteLike(lDTO);
	}
	//���ƿ��߰�
	@Override
	public void insertLike(likeDTO lDTO) throws Exception {
		likeMapper.insertLike(lDTO);
	}
	//���ƿ���
	@Override
	public likeDTO selectLike(likeDTO lDTO) throws Exception {
		return likeMapper.selectLike(lDTO);
	}
	//���ƿ�������
	@Override
	public List<likeDTO> getLikeSelect(String user_no, int offset, int noOfRecords) throws Exception {
		return likeMapper.getLikeSelect(user_no,offset,noOfRecords);
	}
	//�Ǻ�Ÿ�Ժ� ��Ʈ
	@Override
	public List<skin_typeDTO> getSkinType(String cos_no) throws Exception {
		return likeMapper.getSkinType(cos_no);
	}
	//�Ǻΰ�κ� ��Ʈ
	@Override
	public List<somethingDTO> getSomething(String cos_no) throws Exception {
		return likeMapper.getSomething(cos_no);
	}
	//��ɺ� ��Ʈ
	@Override
	public List<ageDTO> getAge(String cos_no) throws Exception {
		return likeMapper.getAge(cos_no);
	}
	@Override
	public int writeGetCount(String user_no) throws Exception {
		return likeMapper.writeGetCount(user_no);
	}
}
