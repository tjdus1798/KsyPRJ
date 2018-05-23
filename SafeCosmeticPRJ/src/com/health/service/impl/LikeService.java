package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.likeDTO;
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
	public List<likeDTO> getLikeSelect(likeDTO lDTO) throws Exception {
		return likeMapper.getLikeSelect(lDTO);
	}
	
	
}
