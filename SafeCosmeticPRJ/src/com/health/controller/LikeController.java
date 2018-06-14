package com.health.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.health.DTO.ageDTO;
import com.health.DTO.cosmeticDTO;
import com.health.DTO.likeDTO;
import com.health.DTO.mainDTO;
import com.health.DTO.skin_typeDTO;
import com.health.DTO.somethingDTO;
import com.health.service.ILikeService;
import com.health.util.CmmUtil;
import com.health.util.Paging;
import com.health.util.TextUtil;

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
		  	int currentPageNo = 1;
		  	int maxPost = 10;
			
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost();
		  List<likeDTO> page = likeService.getLikeSelect(user_no,offset, paging.getMaxPost());
		  paging.setNumberOfRecords(likeService.writeGetCount(user_no));
			
		  paging.makePaging();
		  if (page == null) {
				page = new ArrayList<>();
			}
		  log.info("page:" + page);
		  model.addAttribute("page",page);
		  model.addAttribute("paging", paging);
		  log.info(this.getClass().getName() + "likeList end");
		return "/cos/likeList";
	
	}	
	//좋아요 추가
	@RequestMapping(value="/like_insert", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody likeDTO like_insert(HttpServletRequest req, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "like_insert start!");
		  String user_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
		  String cos_no = CmmUtil.nvl((String) req.getParameter("cos_no"));
		  String reg_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
		  String cos_name = CmmUtil.nvl((String) req.getParameter("cos_name"));
		  String cos_names = TextUtil.exchangeEscapeNvl(cos_name);
		  String price = CmmUtil.nvl((String) req.getParameter("price"));
		  String brand = CmmUtil.nvl((String) req.getParameter("brand"));
		  String brands = TextUtil.exchangeEscapeNvl(brand);
		  String img_name = CmmUtil.nvl((String) req.getParameter("img_name"));
		  
		  log.info("user_no : " + user_no);
		  log.info("cos_no : " + cos_no);
		  log.info("reg_no : " + reg_no);
		  log.info("cos_name : " + cos_names);
		  log.info("price : " + price);
		  log.info("brand : " + brands);
		  log.info("img_name : " + img_name);
		  
		  likeDTO lDTO = new likeDTO();
		  
		  lDTO.setUser_no(user_no);
		  lDTO.setCos_no(cos_no);
		  lDTO.setReg_no(reg_no);
		  lDTO.setCos_name(cos_names);
		  lDTO.setPrice(price);
		  lDTO.setBrand(brands);
		  lDTO.setImg_name(img_name);
		  
		  likeService.insertLike(lDTO);
		
		log.info(this.getClass().getName() + "like_insert end!");
	return lDTO;
	}	
	//좋아요 취소
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
	//좋아요 검색
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
	  
	  
	  @RequestMapping(value="/analysis", method=RequestMethod.GET)
		public String analysis(@RequestParam(value = "cos_no") String cos_no) throws Exception{
		    
		  return "/cos/analysis";
		}
	  //좋아요 검색
	  @RequestMapping(value="/skin_search", method=RequestMethod.POST)
		public @ResponseBody List<skin_typeDTO> skin_search(@RequestParam(value = "cos_no") String cos_no) throws Exception{
		  log.info(getClass() + "skin_search start");
			
		  log.info("cos_no : " + cos_no);
		  skin_typeDTO stDTO = new skin_typeDTO();
		  
		  stDTO.setCos_no(cos_no);
		  
		  List<skin_typeDTO> stlist = likeService.getSkinType(cos_no);
		  
		  if (stlist == null) {
			  stlist = new ArrayList<>();
			}
		  log.info(stlist);
		  log.info(getClass() + "skin_search end");
		  return stlist;
		}
	  @RequestMapping(value="/something_search", method=RequestMethod.POST)
		public @ResponseBody List<somethingDTO> something_search(@RequestParam(value = "cos_no") String cos_no) throws Exception{
		  log.info(getClass() + "something_search start");
		  
		  somethingDTO stDTO = new somethingDTO();
		  stDTO.setCos_no(cos_no);
		  List<somethingDTO> slist = likeService.getSomething(cos_no);
		  if (slist == null) {
			  slist = new ArrayList<>();
			}
		  log.info(slist);
		  log.info(getClass() + "something_search end");
		  return slist;
		}
	  
	  @RequestMapping(value="/age_search", method=RequestMethod.POST)
		public @ResponseBody List<ageDTO> age_search(@RequestParam(value = "cos_no") String cos_no) throws Exception{
		  log.info(getClass() + "age_search start");
		  ageDTO aDTO = new ageDTO();
		  
		  aDTO.setCos_no(cos_no);
		  
		  List<ageDTO> alist = likeService.getAge(cos_no);
		  
		  if (alist == null) {
			  alist = new ArrayList<>();
			}
		  log.info(alist);
		  log.info(getClass() + "age_search end");
		  return alist;
		}
	  
		
}
