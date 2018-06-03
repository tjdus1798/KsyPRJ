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
	//좋아요취소
	@Override
	public int deleteLike(likeDTO lDTO) throws Exception {
		return likeMapper.deleteLike(lDTO);
	}
	//좋아요추가
	@Override
	public void insertLike(likeDTO lDTO) throws Exception {
		likeMapper.insertLike(lDTO);
	}
	//좋아요목록
	@Override
	public likeDTO selectLike(likeDTO lDTO) throws Exception {
		return likeMapper.selectLike(lDTO);
	}
	//좋아요페이지
	@Override
	public List<likeDTO> getLikeSelect(likeDTO lDTO) throws Exception {
		return likeMapper.getLikeSelect(lDTO);
	}
	//피부타입별 차트
	@Override
	public List<skin_typeDTO> getSkinType(String cos_no) throws Exception {
		return likeMapper.getSkinType(cos_no);
	}
	//피부고민별 차트
	@Override
	public List<somethingDTO> getSomething(String cos_no) throws Exception {
		return likeMapper.getSomething(cos_no);
	}
	//얀령별 차트
	@Override
	public List<ageDTO> getAge(String cos_no) throws Exception {
		return likeMapper.getAge(cos_no);
	}
}
