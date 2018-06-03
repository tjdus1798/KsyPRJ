package com.health.service;

import java.util.List;

import com.health.DTO.ageDTO;
import com.health.DTO.likeDTO;
import com.health.DTO.skin_typeDTO;
import com.health.DTO.somethingDTO;

public interface ILikeService {
	//좋아요취소
	int deleteLike(likeDTO lDTO) throws Exception;
	//좋아요추가
	void insertLike(likeDTO lDTO) throws Exception;
	//좋아요검색
	likeDTO selectLike(likeDTO lDTO) throws Exception;
	//좋아요페이지
	List<likeDTO> getLikeSelect(likeDTO lDTO) throws Exception;
	//피부타입별 차트
	List<skin_typeDTO> getSkinType(String cos_no) throws Exception;
	//피부고민별 차트
	List<somethingDTO> getSomething(String cos_no) throws Exception;
	//얀령별 차트
	List<ageDTO> getAge(String cos_no) throws Exception;
	
}
