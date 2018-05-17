package com.health.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.health.service.ILikeService;

@Controller
public class LikeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "LikeService")
	private ILikeService likeService;
	
	@RequestMapping(value="/likeList", method=RequestMethod.GET)
	public String likeList() throws Exception{

		return "/cos/likeList";
	
	}	

}
