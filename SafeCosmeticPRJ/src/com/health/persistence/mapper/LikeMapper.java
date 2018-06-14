package com.health.persistence.mapper;
import java.util.List;

import com.health.DTO.ageDTO;
import com.health.DTO.likeDTO;
import com.health.DTO.skin_typeDTO;
import com.health.DTO.somethingDTO;
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
	List<likeDTO> getLikeSelect(String user_no, int offset, int noOfRecords) throws Exception;
	//�Ǻ�Ÿ�Ժ� ��Ʈ
	List<skin_typeDTO> getSkinType(String cos_no) throws Exception;
	//�Ǻΰ�κ� ��Ʈ
	List<somethingDTO> getSomething(String cos_no) throws Exception;
	//��ɺ� ��Ʈ
	List<ageDTO> getAge(String cos_no) throws Exception;
	
	int writeGetCount(String user_no) throws Exception;
}
