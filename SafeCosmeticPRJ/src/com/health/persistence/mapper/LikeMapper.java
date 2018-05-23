package com.health.persistence.mapper;
import java.util.List;

import com.health.DTO.likeDTO;
import com.health.config.Mapper;

@Mapper("LikeMapper")
public interface LikeMapper {
	//좋아요취소
	int deleteLike(likeDTO lDTO) throws Exception;
	//좋아요추가
	void insertLike(likeDTO lDTO) throws Exception;
	//좋아요목록
	likeDTO selectLike(likeDTO lDTO) throws Exception;
	//좋아요페이지
	List<likeDTO> getLikeSelect(likeDTO lDTO) throws Exception;

}
