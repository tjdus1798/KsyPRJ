package com.health.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.health.DTO.likeDTO;
import com.health.service.ILikeService;
import com.health.util.CmmUtil;

@Controller
public class LikeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "LikeService")
	private ILikeService likeService;
	
	@RequestMapping(value="/likeList", method=RequestMethod.GET)
	public String likeList(HttpServletRequest req, Model model, HttpSession session) throws Exception{

		log.info(this.getClass().getName() + "likeList start");
		  
		  String user_no =  CmmUtil.nvl((String) session.getAttribute("session_user_no"));
		  log.info("user_no : " + user_no);
		  
		  likeDTO lDTO = new likeDTO();
		  
		  lDTO.setUser_no(user_no);
		  
		  List<likeDTO> lList = likeService.getLikeSelect(lDTO);
		  log.info("List:" + lList);
		  
		  model.addAttribute("lList",lList);
		 
		  log.info(this.getClass().getName() + "likeList end");
		return "/cos/likeList";
	
	}	
	//좋아요추가
	@RequestMapping(value="/like_insert", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody likeDTO like_insert(HttpServletRequest req, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "like_insert start!");
		  String user_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
		  String cos_no = CmmUtil.nvl((String) req.getParameter("cos_no"));
		  String reg_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
		  String cos_name = CmmUtil.nvl((String) req.getParameter("cos_name"));
		  String price = CmmUtil.nvl((String) req.getParameter("price"));
		  String brand = CmmUtil.nvl((String) req.getParameter("brand"));
		  
		  log.info("user_no : " + user_no);
		  log.info("cos_no : " + cos_no);
		  log.info("reg_no : " + reg_no);
		  log.info("cos_name : " + cos_name);
		  log.info("price : " + price);
		  log.info("brand : " + brand);
		  
		  likeDTO lDTO = new likeDTO();
		  
		  lDTO.setUser_no(user_no);
		  lDTO.setCos_no(cos_no);
		  lDTO.setReg_no(reg_no);
		  lDTO.setCos_name(cos_name);
		  lDTO.setPrice(price);
		  lDTO.setBrand(brand);
		  
		  likeService.insertLike(lDTO);
		
		log.info(this.getClass().getName() + "like_insert end!");
	return lDTO;
	}	
	//좋아요취소
	@RequestMapping(value="/like_delete", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int like_delete(HttpSession session,HttpServletRequest req) throws Exception{
	log.info(this.getClass().getName() + "like_delete start!");
	   
	   String user_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
	   String cos_no = CmmUtil.nvl(req.getParameter("cos_no"));
	   
	   log.info("user_no : "+user_no);
	   log.info("cos_no :" + cos_no);
	   
	   likeDTO lDTO = new likeDTO();
	   
	   lDTO.setCos_no(cos_no);
	   lDTO.setUser_no(user_no);
	   
	   log.info(this.getClass().getName() + "like_delete end!");
	   return likeService.deleteLike(lDTO);

	}
	//좋아요검색
	  @RequestMapping(value = "like_select")
	  public @ResponseBody likeDTO like_select(HttpServletRequest req, HttpSession session)
	    throws Exception {
	  log.info(this.getClass().getName() + "like_select start");
	  
	  String cos_no = CmmUtil.nvl(req.getParameter("cos_no"));
	  String user_no =  CmmUtil.nvl((String) session.getAttribute("session_user_no"));
	  
	  likeDTO lDTO = new likeDTO();
	  
	  lDTO.setCos_no(cos_no);
	  lDTO.setUser_no(user_no);
	  
	  log.info("cos_no : " + cos_no);
	  log.info("user_no : " + user_no);
	  
	  likeDTO like = likeService.selectLike(lDTO);

	  log.info("List:" + like);
	  
	  log.info(this.getClass().getName() + "like_select end");
	  return like;
	  }
}
