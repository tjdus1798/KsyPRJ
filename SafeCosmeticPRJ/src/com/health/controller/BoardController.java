package com.health.controller;

import java.awt.Image;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.health.DTO.bo_imgDTO;
import com.health.DTO.boardDTO;
import com.health.DTO.ingDTO;
import com.health.service.IBoardService;
import com.health.util.CmmUtil;
import com.health.util.SHA256;
import com.sun.jimi.core.Jimi;
import com.sun.jimi.core.JimiException;
import com.sun.jimi.core.JimiUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
public class BoardController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "BoardService")
	private IBoardService boardService;
	//게시판 목록
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList(Model model) throws Exception {
			log.info(this.getClass() + ".boardList start");

			List<boardDTO> bList = boardService.getBoardList();

			if (bList == null) {
				bList = new ArrayList<>();
			}
			model.addAttribute("bList", bList);
			log.info(this.getClass() + ".boardList end");
		return "/board/boardList";
	}
	@RequestMapping(value="/boardReg", method=RequestMethod.GET)
	public String boardReg() throws Exception{

		log.info(this.getClass() + ".boardReg start");
		log.info(this.getClass() + ".boardReg start");
		
		return "/board/boardReg";
	}
	//게시판 등록
	@RequestMapping(value="/boardReg_proc", method=RequestMethod.POST)
	public String boardReg_proc(@RequestParam("imgFile") MultipartFile imgFile,Model model, HttpServletRequest req) throws Exception{
		log.info(this.getClass() + ".boardReg_proc start");
		//MultipartRequest multi=new MultipartRequest(req,save_path,sizeLimit,"UTF-8", new DefaultFileRenamePolicy());
		String title = CmmUtil.nvl(req.getParameter("title"));
		String content = CmmUtil.nvl(req.getParameter("content"));
		//String file_name = multi.getFilesystemName(imgFile);
		
		log.info("title : " + title);
		log.info("content : " + content);
		
		boardDTO bDTO = new boardDTO();
		bDTO.setTitle(title);
		bDTO.setContent(content);
		
		int re = boardService.insertBoard(bDTO);
		if (re != 0) {
			model.addAttribute("msg", "등록되었습니다.");
			model.addAttribute("url", "/boardList.do");
		} else {
			model.addAttribute("msg", "실패하였습니다.");
			model.addAttribute("url", "/boardReg.do");
		}
		
		log.info(this.getClass() + ".boardReg_proc end");
		return "/alert";
	}
	
	
	//게시판 상세
	@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
	public String boardDetail(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse res, @RequestParam HashMap<String, String> map) throws Exception{
		log.info(this.getClass() + ".boardDetail start");
		String bo_no = CmmUtil.nvl(req.getParameter("bo_no"));
		log.info("bo_no =" + bo_no);
		bo_imgDTO biDTO = boardService.getBo_img(bo_no);
		boardDTO bDTO = boardService.getBoardDetail(bo_no);
		if (bDTO == null) {
			bDTO = new boardDTO();
		}
		if (biDTO == null) {
			biDTO = new bo_imgDTO();
		}
		model.addAttribute("bDTO", bDTO);
		log.info(this.getClass() + ".boardDetail end");
		return "/board/boardDetail";
	}
	//게시판 수정
	@RequestMapping(value="/boardEdit", method=RequestMethod.GET)
	public String boardEdit() throws Exception{

		return "/board/boardEdit";
	}
}
