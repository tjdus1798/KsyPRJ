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

import com.health.DTO.ingDTO;
import com.health.DTO.mainDTO;
import com.health.service.IIngService;
import com.health.service.impl.IngService;
import com.health.util.CmmUtil;

@Controller
public class IngController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "IngService")
	private IIngService ingService;

	@RequestMapping(value = "/ingReg", method = RequestMethod.GET)
	public String ingReg() throws Exception {

		return "/ing/ingReg";
	}

	// 성분등록
	@RequestMapping(value = "/ingReg_proc", method = RequestMethod.POST)
	public String ingReg_proc(HttpServletRequest req, Model model) throws Exception {

		log.info(this.getClass() + ".ingReg_proc start");

		String reg_no = CmmUtil.nvl(req.getParameter("user_no"));
		String ing_name = CmmUtil.nvl(req.getParameter("ing_name"));
		String ing_eng = CmmUtil.nvl(req.getParameter("ing_eng"));
		String mix = CmmUtil.nvl(req.getParameter("mix"));
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
			model.addAttribute("msg", "실패하였습니다.");
			model.addAttribute("url", "/ingReg.do");
		}
		log.info(this.getClass() + ".ingReg_proc end");
		return "/alert";
	}

	// 성분목록
	@RequestMapping(value = "/ingList", method = RequestMethod.GET)
	public String ingList(Model model) throws Exception {
		log.info(this.getClass() + ".ingList start");

		List<ingDTO> iList = ingService.getIngList();

		if (iList == null) {
			iList = new ArrayList<>();
		}
		model.addAttribute("iList", iList);
		log.info(this.getClass() + ".ingList end");
		return "/ing/ingList";

	}
	// 성분상세
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
}
