package com.health.service;

import java.util.List;

import com.health.DTO.likeDTO;

public interface ILikeService {
	//���ƿ����
	int deleteLike(likeDTO lDTO) throws Exception;
	//���ƿ��߰�
	void insertLike(likeDTO lDTO) throws Exception;
	//���ƿ�˻�
	likeDTO selectLike(likeDTO lDTO) throws Exception;
	//���ƿ�������
	List<likeDTO> getLikeSelect(likeDTO lDTO) throws Exception;

	
	
}
