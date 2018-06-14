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

import com.health.DTO.ingDTO;
import com.health.service.IIngService;
import com.health.util.CmmUtil;
import com.health.util.Paging;
import com.health.util.TextUtil;

@Controller
public class IngController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "IngService")
	private IIngService ingService;
	Paging pagemaker;
	@RequestMapping(value = "/ingReg", method = RequestMethod.GET)
	public String ingReg() throws Exception {

		return "/ing/ingReg";
	}

	//성분 등록
	@RequestMapping(value = "/ingReg_proc", method = RequestMethod.POST)
	public String ingReg_proc(HttpServletRequest req, Model model) throws Exception {

		log.info(this.getClass() + ".ingReg_proc start");

		String reg_no = CmmUtil.nvl(req.getParameter("user_no"));
		String ing_names = CmmUtil.nvl(req.getParameter("ing_name"));
		String ing_name = TextUtil.exchangeEscapeNvl(ing_names);
		String ing_eng = CmmUtil.nvl(req.getParameter("ing_eng"));
		String mixs = CmmUtil.nvl(req.getParameter("mix"));
		String mix = TextUtil.exchangeEscapeNvl(mixs);
		String ewg_level = CmmUtil.nvl(req.getParameter("ewg_level"));
		String ing_type = CmmUtil.nvl(req.getParameter("ing_type"));
		String danger_check = CmmUtil.nvl(req.getParameter("danger_check"));

		log.info("reg_no : " + reg_no);
		log.info("ing_name : " + ing_name);
		log.info("ing_eng : " + ing_eng);
		log.info("mix" + mix);
		log.info("ewg_level : " + ewg_level);
		log.info("ing_type : " + ing_type);
		log.info("danger_check : " + danger_check);

		ingDTO iDTO = new ingDTO();

		iDTO.setReg_no(reg_no);
		iDTO.setIng_name(ing_name);
		iDTO.setIng_eng(ing_eng);
		iDTO.setMix(mix);
		iDTO.setEwg_level(ewg_level);
		iDTO.setIng_type(ing_type);
		iDTO.setDanger_check(danger_check);

		int re = ingService.insertIng(iDTO);
		if (re != 0) {
			model.addAttribute("msg", "등록되었습니다.");
			model.addAttribute("url", "/ingList.do");
		} else {
			model.addAttribute("msg", "등록에 실패했습니다.");
			model.addAttribute("url", "/ingReg.do");
		}
		log.info(this.getClass() + ".ingReg_proc end");
		return "/alert";
	}

	//성분 목록
	@RequestMapping(value = "/ingList", method = RequestMethod.GET)
	public String ingList(Model model, HttpServletRequest req) throws Exception {
		log.info(this.getClass() + ".ingList start");
		
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost();

		List<ingDTO> page = ingService.getIngList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(ingService.writeGetCount());
		
		paging.makePaging();
		if (page == null) {
			page = new ArrayList<>();
		}
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		log.info(this.getClass() + ".ingList end");
		return "/ing/ingList";

	}
	//성분 상세
	@RequestMapping(value = "/ingDetail", method = RequestMethod.GET)
	public String ingDetail(Model model, HttpServletRequest req) throws Exception {
		log.info(this.getClass() + ".ingDetail start");
		String ing_no = CmmUtil.nvl(req.getParameter("ing_no"));
		log.info("ing_no =" + ing_no);
		ingDTO iDTO = ingService.getingDetail(ing_no);
		if (iDTO == null) {
			iDTO = new ingDTO();
		}
		model.addAttribute("iDTO", iDTO);
		log.info(this.getClass() + ".ingDetail end");
		return "/ing/ingDetail";
	}
	@RequestMapping(value = "/ingEdit", method = RequestMethod.GET)
	public String ingEdit(Model model, HttpServletRequest req) throws Exception {
		log.info(this.getClass() + ".ingEdit start");
		String ing_no = CmmUtil.nvl(req.getParameter("ing_no"));
		log.info("ing_no =" + ing_no);
		ingDTO iDTO = ingService.getingDetail(ing_no);
		if (iDTO == null) {
			iDTO = new ingDTO();
		}
		model.addAttribute("iDTO", iDTO);
		log.info(this.getClass() + ".ingEdit end");
		return "/ing/ingEdit";
	}
	//성분 수정
	@RequestMapping(value = "/ingEdit_proc", method = RequestMethod.POST)
	public String ingEdit_proc(HttpServletRequest req,HttpSession session,Model model) throws Exception {
		log.info(this.getClass() + ".ingEdit_proc start");
		
		String ing_names = CmmUtil.nvl(req.getParameter("ing_name"));
		String ing_name = TextUtil.exchangeEscapeNvl(ing_names);
		String ing_eng = CmmUtil.nvl(req.getParameter("ing_eng"));
		String mixs = CmmUtil.nvl(req.getParameter("mix"));
		String mix = TextUtil.exchangeEscapeNvl(mixs);
		String ewg_level = CmmUtil.nvl(req.getParameter("ewg_level"));
		String ing_type = CmmUtil.nvl(req.getParameter("ing_type"));
		String danger_check = CmmUtil.nvl(req.getParameter("danger_check"));
		String chg_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
		String ing_no = CmmUtil.nvl(req.getParameter("ing_no"));
		
		log.info("ing_name : " + ing_name);
		log.info("ing_eng : " + ing_eng);
		log.info("mix" + mix);
		log.info("ewg_level : " + ewg_level);
		log.info("ing_type : " + ing_type);
		log.info("danger_check : " + danger_check);
		log.info("chg_no : " + chg_no);
		log.info("ing_no : " + ing_no);
		
		ingDTO iDTO = new ingDTO();
		
		iDTO.setIng_name(ing_name);
		iDTO.setIng_eng(ing_eng);
		iDTO.setMix(mix);
		iDTO.setEwg_level(ewg_level);
		iDTO.setIng_type(ing_type);
		iDTO.setDanger_check(danger_check);
		iDTO.setChg_no(chg_no);
		iDTO.setIng_no(ing_no);
		
		int result = ingService.updateIng(iDTO);
		
		if (result != 0) {
			model.addAttribute("msg", "수정하였습니다.");
			model.addAttribute("url", "/ingDetail.do?ing_no=" + ing_no);
		} else {
			model.addAttribute("msg", "수정에 실패했습니다.");
			model.addAttribute("url", "/ingDetail.do?ing_no=" + ing_no);
		}
		log.info(this.getClass() + ".ingEdit_proc end");
		return "/alert";
	}
	
	@RequestMapping(value = "/ingDelete", method = RequestMethod.GET)
	public String ingDelete(HttpServletRequest req,HttpSession session,Model model) throws Exception {

		log.info(this.getClass() + ".ingDelete start");
		
		String ing_no = CmmUtil.nvl(req.getParameter("ing_no"));
		
		ingDTO iDTO = new ingDTO();
		
		iDTO.setIng_no(ing_no);
		int result = ingService.deleteIng(iDTO);
		
		if (result != 0) {
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("url", "/ingList.do");
		} else {
			model.addAttribute("msg", "삭제에 실패했습니다.");
			model.addAttribute("url", "/ingDetail.do?ing_no=" + ing_no);
		}
		log.info(this.getClass() + ".ingDelete end");
		
		return "/alert";
	}
	
	//����������ȸ(ȭ��ǰ��)
	@RequestMapping(value = "/ingInfo_select", method = RequestMethod.POST)
	public @ResponseBody ingDTO ingInfo_select(HttpServletRequest req) throws Exception {
		
		 log.info(this.getClass().getName() + "ingInfo_select start");
		  
		  String ing_name = CmmUtil.nvl(req.getParameter("ing_name"));
		  String[] ing_value = ing_name.split("\\$");
		  
		  for(int i = 0; i<ing_value.length; i++) {
			  log.info(ing_value[i]);
		  }
		  
		  List<ingDTO> iList = new ArrayList<ingDTO>();
		  
		  ingDTO iDTO = new ingDTO();
		  for(int i = 0; i<ing_value.length; i++) {
			  
		  iDTO.setIng_name(ing_value[i]);
		  iList.add(iDTO);
		  }
		  
		  ingDTO ing = ingService.selectIngInfo(iList);

		  log.info("iList:" + ing);
		  
		  log.info(this.getClass().getName() + "ingInfo_select end");
		  return ing;
		
	}
	
	//화장품 등록시 성분명 자동완성
		@RequestMapping(value = "/ing_check", method = RequestMethod.POST)
		public @ResponseBody List<ingDTO> ing_check() throws Exception {
			log.info(this.getClass() + ".ing_check start");
			ingDTO iDTO = new ingDTO();
		    
		    List<ingDTO> autolist = ingService.getIngNamesAuto();
		    
		    log.info("자동완성 :"+autolist);
		    
			log.info(this.getClass() + ".ing_check end");
			return autolist;
		}
	
	
}
