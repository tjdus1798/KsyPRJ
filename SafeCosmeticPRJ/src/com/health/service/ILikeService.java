package com.health.service;

import java.util.List;

import com.health.DTO.likeDTO;

public interface ILikeService {
	//좋아요취소
	int deleteLike(likeDTO lDTO) throws Exception;
	//좋아요추가
	void insertLike(likeDTO lDTO) throws Exception;
	//좋아요검색
	likeDTO selectLike(likeDTO lDTO) throws Exception;
	//좋아요페이지
	List<likeDTO> getLikeSelect(likeDTO lDTO) throws Exception;

	
	
}
