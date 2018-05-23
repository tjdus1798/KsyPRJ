package com.health.persistence.mapper;
import java.util.List;

import com.health.DTO.likeDTO;
import com.health.config.Mapper;

@Mapper("LikeMapper")
public interface LikeMapper {
	//���ƿ����
	int deleteLike(likeDTO lDTO) throws Exception;
	//���ƿ��߰�
	void insertLike(likeDTO lDTO) throws Exception;
	//���ƿ���
	likeDTO selectLike(likeDTO lDTO) throws Exception;
	//���ƿ�������
	List<likeDTO> getLikeSelect(likeDTO lDTO) throws Exception;

}
