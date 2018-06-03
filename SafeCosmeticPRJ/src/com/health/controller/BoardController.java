package com.health.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.health.DTO.boardDTO;
import com.health.DTO.mainDTO;
import com.health.service.IBoardService;
import com.health.util.CmmUtil;
import com.health.util.TextUtil;

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
	public String boardReg_proc(Model model, HttpServletRequest req, boardDTO bdto) throws Exception{
		log.info(this.getClass() + ".boardReg_proc start");
		
		String root = req.getSession().getServletContext().getRealPath("/");
		String savePath = root +"upload";
		String saveThumbPath = root+"thumbnail";
		int thumbWidth = 500;
		int thumbHeight = 300;
		
		log.info("11111111111");
		
		String titles = CmmUtil.nvl(req.getParameter("titles"));
		String title = TextUtil.exchangeEscapeNvl(titles);
		
		String contents = CmmUtil.nvl(req.getParameter("contents"));
		String content = TextUtil.exchangeEscapeNvl(contents);
		content = content.replace("\r\n", "<br>");
		
		String img_name = bdto.getUpfile().getOriginalFilename();
		String img_path = savePath + "\\" + img_name;
		String ori_img_name = bdto.getUpfile().getOriginalFilename();
		//String thumb_name = bdto.getUpfile().getOriginalFilename();
        //String thumb_path = saveThumbPath+"\\"+thumb_name;
       
       // Image thumbnail=JimiUtils.getThumbnail(img_path, thumbWidth, thumbHeight, Jimi.IN_MEMORY);
        //Jimi.putImage(thumbnail,thumb_path);
        
		log.info("title : " + bdto.getTitle());
		log.info("content : " + bdto.getContent());
		log.info("img_name : " + img_name);
		log.info("img_path : " + img_path);
		log.info("orgFileName : " + ori_img_name);
		//log.info("thumbName : " + thumb_name);
		//log.info("thumbPath : " + thumb_path);
		log.info("savePath : " + savePath);
		
		bdto.setTitle(title);
		bdto.setContent(content);
		bdto.setImg_name(img_name);
		bdto.setImg_path(img_path);
		bdto.setOri_img_name(ori_img_name);
		//bdto.setThumb_name(thumb_name);
		//bdto.setThumb_path(thumb_path);
		
		
		File normal = new File(img_path);
		//File thumnail = new File(thumb_path);
		bdto.getUpfile().transferTo(normal);
		//bdto.getUpfile().transferTo(thumnail);
		int re = boardService.insertBoard(bdto);
		
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
		boardDTO bDTO = boardService.getBoardDetail(bo_no);
		if (bDTO == null) {
			bDTO = new boardDTO();
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
	//게시판 삭제
	@RequestMapping(value="/boardDelete", method=RequestMethod.GET)
	public String boardDelete(Model model, HttpServletRequest req, HttpSession session) throws Exception{
		
		log.info(this.getClass() + ".boardDelete start");
		
		String bo_no = CmmUtil.nvl(req.getParameter("bo_no"));
		
		boardDTO bDTO = new boardDTO();
		
		bDTO.setBo_no(bo_no);

		int result = boardService.DeleteBoard(bo_no);
		if (result != 0) {
			model.addAttribute("msg", "게시판이 삭제되었습니다.");
			model.addAttribute("url", "/boardList.do");
		} else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/boardDetail.do?bo_no=" + bo_no);
		}
		log.info(this.getClass() + ".boardDelete end");
		
		
		return "/alert";
	}
}
