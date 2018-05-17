package com.health.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.persistence.mapper.LikeMapper;
import com.health.service.ILikeService;


@Service("LikeService")
public class LikeService implements ILikeService{
	@Resource(name="LikeMapper")
	private LikeMapper likeMapper;
	
	
}
