package com.health.controller;

import java.io.BufferedOutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.health.DTO.cos_imgDTO;
import com.health.DTO.cosmeticDTO;
import com.health.DTO.likeDTO;
import com.health.service.ICosService;
import com.health.util.CmmUtil;
import com.health.util.SHA256;
import com.health.util.TextUtil;

@Controller
public class CosController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "CosService")
	private ICosService cosService;

	
	@RequestMapping(value="/cosReg", method=RequestMethod.GET)
	public String cosReg() throws Exception{

		return "/cos/cosReg";
	}
	//화장품등록
	@RequestMapping(value="/cosReg_proc", method=RequestMethod.POST)
	public String cosReg_proc(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass() + ".cosReg_proc start");
		
		String cos_type = CmmUtil.nvl(req.getParameter("cos_type"));
		String cos_name = CmmUtil.nvl(req.getParameter("cos_name"));
		String price = CmmUtil.nvl(req.getParameter("price"));
		String brand = CmmUtil.nvl(req.getParameter("brand"));
		String ing_name = CmmUtil.nvl(req.getParameter("ing_name"));
		//String[] ing_namex = req.getParameterValues("ing_name");
		
		//String ing_name = join(ing_namex,",");
		
		//for(int i =0; i<ing_namex.length; i++){
			//log.info("ing_namex : " + ing_namex[i]);
		//}
		log.info("ing_name : " + ing_name);
		log.info("cos_type : " + cos_type);
		log.info("cos_name : " + cos_name);
		log.info("price :" + price);
		log.info("brand : " + brand);
		
		cosmeticDTO cDTO = new cosmeticDTO();
			
		cDTO.setCos_name(cos_name);
		cDTO.setCos_type(cos_type);
		cDTO.setPrice(price);
		cDTO.setBrand(brand);
		cDTO.setIng_name(ing_name);
			
		int re = cosService.insertCos(cDTO);
		if (re != 0) {
			model.addAttribute("msg", "등록되었습니다.");
			model.addAttribute("url", "/cosList.do");
		} else {
			model.addAttribute("msg", "실패하였습니다.");
			model.addAttribute("url", "/cosReg.do");
		}
		
		log.info(this.getClass() + ".cosReg_proc end");
		return "/alert";
	}

	//화장품목록
	@RequestMapping(value="/cosList", method=RequestMethod.GET)
	public String cosList(Model model) throws Exception{
		log.info(this.getClass() + ".cosList start");
		List<cosmeticDTO> cList = cosService.getCosList();

		if (cList == null) {
			cList = new ArrayList<>();
		}
		model.addAttribute("cList", cList);
		
		log.info(this.getClass() + ".cosList end");
		return "/cos/cosList";
	}
	
	//화장품상세
	@RequestMapping(value="/cosDetail", method=RequestMethod.GET)
	public String cosDetail(Model model, HttpServletRequest req,HttpSession session) throws Exception{

	log.info(this.getClass() + ".cosDetail start");
	String cos_no = CmmUtil.nvl(req.getParameter("cos_no"));
	String user_no =  CmmUtil.nvl((String) session.getAttribute("session_user_no"));
	
	log.info("cos_no =" + cos_no);
	cosmeticDTO cDTO = cosService.getcosDetail(cos_no);

	likeDTO lDTO = new likeDTO();

	lDTO.setCos_no(cos_no);
	lDTO.setUser_no(user_no);
	
	lDTO = cosService.getLikeList(lDTO);
	
	if (cDTO == null) {
		cDTO = new cosmeticDTO();}
	if (lDTO == null) {
		lDTO = new likeDTO();}
	
	model.addAttribute("cDTO", cDTO);
	model.addAttribute("lDTO", lDTO);
	
	log.info(this.getClass() + ".cosDetail end");
	return "/cos/cosDetail";
	}

	//성분별 화장품목록
	@RequestMapping(value="/ingredientList", method=RequestMethod.GET)
	public String ingredientList() throws Exception{

		return "/cos/ingredientList";
	}
	//브랜드별 화장품목록
	@RequestMapping(value="/brandList", method=RequestMethod.GET)
	public String brandList() throws Exception{

		return "/cos/brandList";
	}
	//임산부추천 화장품목록
	@RequestMapping(value="/pregnantList", method=RequestMethod.GET)
	public String pregnantList() throws Exception{

		return "/cos/pregnantList";
	}
	//영유아추천 화장품목록
	@RequestMapping(value="/childList", method=RequestMethod.GET)
	public String childList() throws Exception{

		return "/cos/childList";
	}
	//알레르기추천 화장품목록
	@RequestMapping(value="/allergyList", method=RequestMethod.GET)
	public String allergyList() throws Exception{

		return "/cos/allergyList";
	}

}
