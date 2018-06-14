package com.health.controller;

import java.awt.Image;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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

import com.health.DTO.boardDTO;
import com.health.DTO.cosmeticDTO;
import com.health.DTO.ingDTO;
import com.health.DTO.shopDTO;
import com.health.DTO.likeDTO;
import com.health.service.ICosService;
import com.health.util.CmmUtil;
import com.health.util.Paging;
import com.health.util.TextUtil;
import com.sun.jimi.core.Jimi;
import com.sun.jimi.core.JimiUtils;

import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;



@Controller
public class CosController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "CosService")
	private ICosService cosService;
	Paging pagemaker;
	@RequestMapping(value="/cosReg", method=RequestMethod.GET)
	public String cosReg(Model model) throws Exception{
		
		log.info(this.getClass() + ".cosReg start");
		
		List<ingDTO> ingList = cosService.CosIng();
		List<cosmeticDTO> brandList = cosService.CosBrand();

		if (ingList == null) {
			ingList = new ArrayList<>();
		}
		if (brandList == null) {
			brandList = new ArrayList<>();
		}
		model.addAttribute("ingList", ingList);
		model.addAttribute("brandList", brandList);
		
		log.info(this.getClass() + ".cosReg end");
		
		return "/cos/cosReg";
	}
	//화장품 등록
	@RequestMapping(value="/cosReg_proc", method=RequestMethod.POST)
	public String cosReg_proc(HttpServletRequest req, Model model, HttpSession session, cosmeticDTO cdto) throws Exception{
		log.info(this.getClass() + ".cosReg_proc start");
		
		String root = req.getSession().getServletContext().getRealPath("/");
		String savePath = root +"cosmetic";
		String saveThumbPath = root+"thumbnail";
		UUID uuid = UUID.randomUUID();
		String img_name =  uuid + "_" +cdto.getUpfile().getOriginalFilename();
		String img_path = savePath + "\\" + img_name;
		String thumb_name = cdto.getUpfile().getOriginalFilename();
		String thumb_path = saveThumbPath+"\\"+thumb_name;
		String cos_names = CmmUtil.nvl(req.getParameter("cos_names"));
		String brands = CmmUtil.nvl(req.getParameter("brands"));
		String cos_name = TextUtil.exchangeEscapeNvl(cos_names);
		String brand = TextUtil.exchangeEscapeNvl(brands);
		String reg_no = (String) session.getAttribute("session_user_no");
		String[] ing_name = req.getParameterValues("ing_names");
		
		//int thumbWidth = 500;
		//int thumbHeight = 300;
		
		//Image thumbnail=JimiUtils.getThumbnail(img_path, thumbWidth, thumbHeight, Jimi.IN_MEMORY);
		//Jimi.putImage(thumbnail,thumb_path);
		//String ing_namee = "";
		//String ing_name = "";
		log.info("cos_type : " + cdto.getCos_type());
		log.info("cos_name : " + cos_name);
		log.info("price :" + cdto.getPrice());
		log.info("brand : " + brand);
		log.info("reg_no : " + reg_no);
		log.info("img_name : " + img_name);
		log.info("ing_path : " + img_path);
		log.info("thumbName : " + thumb_name);
		log.info("thumbPath : " + thumb_path);
		log.info("savePath : " + savePath);
		log.info("ing_name : " + ing_name);
		
		cdto.setCos_name(cos_name);
		cdto.setBrand(brand);
		cdto.setReg_no(brand);
		cdto.setReg_no(reg_no);
		if(cdto.getUpfile().isEmpty() == false) {
			cdto.setImg_name(img_name);
			cdto.setImg_path(img_path);
			
			File normal = new File(img_path);
			cdto.getUpfile().transferTo(normal);
		}
		
		int re = cosService.insertCos(cdto);
		
		for(int i =0; i<ing_name.length; i++){
			log.info("ing_name : " + ing_name[i]);
			cosService.codeInsert(ing_name[i], cos_name);
		}
		
		if (re != 0) {
			model.addAttribute("msg", "등록되었습니다.");
			model.addAttribute("url", "/cosList.do");
		} else {
			model.addAttribute("msg", "등록에 실패했습니다.");
			model.addAttribute("url", "/cosReg.do");
		}
		
		log.info(this.getClass() + ".cosReg_proc end");
		return "/alert";
	}
	//화장품 목록
	@RequestMapping(value="/cosList", method=RequestMethod.GET)
	public String cosList(Model model,HttpServletRequest req) throws Exception{
		log.info(this.getClass() + ".cosList start");
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost();
		
		List<cosmeticDTO> page = cosService.getCosList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(cosService.writeGetCount());
		
		paging.makePaging();
		if (page == null) {
			page = new ArrayList<>();
		}
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		log.info(this.getClass() + ".cosList end");
		return "/cos/cosList";
	}
	
	//화장품 상세
	@RequestMapping(value="/cosDetail", method=RequestMethod.GET)
	public String cosDetail(Model model, HttpServletRequest req,HttpSession session) throws Exception{

	log.info(this.getClass() + ".cosDetail start");
	String cos_no = CmmUtil.nvl(req.getParameter("cos_no"));
	String user_no =  CmmUtil.nvl((String) session.getAttribute("session_user_no"));
	
	log.info("cos_no =" + cos_no);
	cosmeticDTO cDTO = cosService.getcosDetail(cos_no);
	List<ingDTO> iList = cosService.getcosDetailIng(cos_no);
	likeDTO lDTO = new likeDTO();

	lDTO.setCos_no(cos_no);
	lDTO.setUser_no(user_no);
	
	lDTO = cosService.getLikeList(lDTO);
	
	if (cDTO == null) {
		cDTO = new cosmeticDTO();}
	if (iList == null) {
		iList = new ArrayList<>();
	}
	if (lDTO == null) {
		lDTO = new likeDTO();}
	
	model.addAttribute("cDTO", cDTO);
	model.addAttribute("lDTO", lDTO);
	model.addAttribute("iList", iList);
	
	log.info(this.getClass() + ".cosDetail end");
	return "/cos/cosDetail";
	}
	@RequestMapping(value="/cosEdit", method=RequestMethod.GET)
	public String cosEdit(Model model,HttpServletRequest req) throws Exception{
		log.info(this.getClass() + ".cosEdit start");
		String cos_no = CmmUtil.nvl(req.getParameter("cos_no"));
		log.info("cos_no =" + cos_no);
		
		cosmeticDTO cDTO = cosService.getcosDetail(cos_no);
		List<ingDTO> iList = cosService.getcosDetailIng(cos_no);
		if (cDTO == null) {
			cDTO = new cosmeticDTO();}
		if (iList == null) {
			iList = new ArrayList<>();
		}
		model.addAttribute("cDTO", cDTO);
		model.addAttribute("iList", iList);
		log.info(this.getClass() + ".cosEdit end");
		return "/cos/cosEdit";
	}
	//화장품 수정
	@RequestMapping(value="/cosEdit_proc", method=RequestMethod.POST)
	public String cosEdit_proc(Model model,HttpServletRequest req, HttpSession session, cosmeticDTO cdto) throws Exception{
		log.info(this.getClass() + ".cosEdit_proc start");
		String msg = "";
		String url = "";
		String cos_no = CmmUtil.nvl(req.getParameter("cos_no"));
		try {
			UUID uuid = UUID.randomUUID();
			String cos_names = CmmUtil.nvl(req.getParameter("cos_names"));
			String brands = CmmUtil.nvl(req.getParameter("brands"));
			String cos_name = TextUtil.exchangeEscapeNvl(cos_names);
			String brand = TextUtil.exchangeEscapeNvl(brands);
			String root = req.getSession().getServletContext().getRealPath("/");
			String savePath = root +"cosmetic";
			String[] ing_name = req.getParameterValues("ing_names");
			String img_name = uuid+"_"+cdto.getUpfile().getOriginalFilename();
			String img_path = savePath + "\\" + img_name;
			String ori_img_name = cdto.getUpfile().getOriginalFilename();
			
			//int thumbWidth = 500;
			//int thumbHeight = 300;
			
			//Image thumbnail=JimiUtils.getThumbnail(img_path, thumbWidth, thumbHeight, Jimi.IN_MEMORY);
			//Jimi.putImage(thumbnail,thumb_path);
			
			log.info("cos_type : " + cdto.getCos_type());
			log.info("cos_name : " + cos_name);
			log.info("price :" + cdto.getPrice());
			log.info("brand : " + brand);
			log.info("img_name : " + img_name);
			log.info("ing_path : " + img_path);
			log.info("savePath : " + savePath);
			log.info("ori_img_name : " + ori_img_name);
			
			cdto.setCos_name(cos_name);
			cdto.setBrand(brand);
			
			for(int i =0; i<ing_name.length; i++){
				log.info("ing_name : " + ing_name[i]);
				cosService.codeInsert(ing_name[i], cos_name);
			}
			
			if(cdto.getUpfile().isEmpty() == false){
				cdto.setImg_name(img_name);
				cdto.setImg_path(img_path);
				cdto.setOri_img_name(ori_img_name);
				
				File normal = new File(img_path);
				cdto.getUpfile().transferTo(normal);
			}
			if(cdto.getUpfile().isEmpty() == true) {
				File file = new File(img_path);
    			file.delete();
			}
			cosService.updateCos(cdto);
			
			msg="수정되었습니다.";
			url="/cosDetail.do?cos_no="+cos_no;
			
			cdto = null;
			
		}catch(Exception e) {
			msg = "수정에 실패했습니다";
    		url="/cosEdit.do?cos_no=" + cos_no;
    		
    		log.info(e.toString());
    		e.printStackTrace();
		}finally {
			log.info(this.getClass() + ".cosEdit_proc end");
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
		}
		return "/alert";
	}
	//화장품 삭제
	@RequestMapping(value="/cosDelete", method=RequestMethod.GET)
	public String cosDelete(Model model,HttpServletRequest req,cosmeticDTO cdto) throws Exception{
		log.info(this.getClass() + ".cosDelete start");
		String cos_no = CmmUtil.nvl(req.getParameter("cos_no"));
		log.info("cos_no =" + cos_no);
		cosmeticDTO cDTO = new cosmeticDTO();
		
		String img_name = CmmUtil.nvl(req.getParameter("img_name"));
		String root = req.getSession().getServletContext().getRealPath("/");
		String savePath = root +"cosmetic";
		String img_path = savePath + "\\" + img_name;
		
		log.info("img_name : "+img_name);
		if(cdto.getImg_name() != null) {
			File file = new File(img_path);
			file.delete();
		}
		
		cosService.codeDelete(cos_no);
		
		cDTO.setCos_no(cos_no);
		
		int result=  cosService.DeleteCos(cos_no);
		if (result != 0) {
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("url", "/cosList.do");
		} else {
			model.addAttribute("msg", "삭제에 실패했습니다.");
			model.addAttribute("url", "/cosDetail.do?cos_no=" + cos_no);
		}
			
		log.info(this.getClass() + ".cosDelete end");
		return "/alert";
	}
	//성분명으로 검색
	@RequestMapping(value="/ingredient_search", method=RequestMethod.GET)
	public String ingredient_search(HttpServletRequest req,Model model, HttpSession session) throws Exception{

		  log.info(getClass() + "ingredient_search start");
		  String good = "";
		  String cos_type = "";
		  
		  if(req.getParameter("good") != null) {
		    	String goods = CmmUtil.nvl(req.getParameter("good"));
		    	good = TextUtil.exchangeEscapeNvl(goods);
		    }else {
		    	good = (String) session.getAttribute("good");
		    }
		  if(req.getParameter("cos_type") != null) {
		    	cos_type = CmmUtil.nvl(req.getParameter("cos_type"));
		    }else {
		    	cos_type = (String) session.getAttribute("cos_type");
		    }
		  log.info("good : " + good);
		    log.info("cos_type : " + cos_type);
		  
		    int currentPageNo = 1;
			int maxPost = 10;
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost();
			List<cosmeticDTO> page= cosService.getWithoutBad(good,cos_type,offset, paging.getMaxPost());
			 paging.setNumberOfRecords(cosService.writeIngGetCount(good,cos_type));
			    paging.makePaging();
			    if (page == null) {
					page = new ArrayList<>();
				}			    
			    session.setAttribute("cos_type",cos_type);
			    session.setAttribute("good",good);
			    model.addAttribute("page", page);
			    model.addAttribute("paging", paging);
			    model.addAttribute("good", good);
		    log.info(getClass() + "ingredient_search end");
		 return "/cos/ingResult";
	}
	//성분명으로 자동완성
	@RequestMapping(value="/ingredient_auto", method= RequestMethod.POST)
	public @ResponseBody List<ingDTO> ingredient_auto(@RequestParam(value = "good") String good) throws Exception{

		  log.info(getClass() + "ingredient_auto start");
		  
		  ingDTO iDTO = new ingDTO();
		 
			iDTO.setGood("%"+good+"%");
			log.info("잘들어오나? goods : " + good);
			List<ingDTO> inglist = cosService.getIngGoodAuto(iDTO);	

		 log.info(inglist);
		 log.info(getClass() + "ingredient_auto end");
		 return inglist;
	}
	
	@RequestMapping(value="/ingredientList", method=RequestMethod.GET)
	public String ingredientList() throws Exception{

		return "/cos/ingredientList";
	}
	
	//브랜드명으로 검색
	@RequestMapping(value="/brand_search", method=RequestMethod.GET)
	public String brand_search(HttpServletRequest req,Model model, HttpSession session) throws Exception{
			
		    log.info(getClass() + "brand_search start");
		    String search="";
		    if(req.getParameter("search") != null) {
		    	String searchs = CmmUtil.nvl(req.getParameter("search"));
		    	search = TextUtil.exchangeEscapeNvl(searchs);
		    }else {
		    	search = (String) session.getAttribute("search");
		    }
		    log.info(search);
		    int currentPageNo = 1;
			int maxPost = 10;
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost();
		    List<cosmeticDTO> page = cosService.getBrandSearch(search,offset, paging.getMaxPost());		    
		    paging.setNumberOfRecords(cosService.writeBrandGetCount(search));
		    paging.makePaging();
		    if (page == null) {
				page = new ArrayList<>();
			}
		    log.info("search : "+search);
		    log.info("page : "+page);
		    log.info("paging : "+paging);
		    session.setAttribute("search",search);
		    model.addAttribute("page", page);
		    model.addAttribute("paging", paging);
		    model.addAttribute("search", search);
		    log.info(getClass() + "brand_search end");
		    
		    return "/cos/brandResult";
	}
	//브랜드명으로 자동완성
		@RequestMapping(value="/brand_auto", method=RequestMethod.POST)
		public @ResponseBody List<cosmeticDTO> brand_auto(@RequestParam(value = "search") String search) throws Exception{
			
			    log.info(getClass() + "brand_auto start");
			    cosmeticDTO cDTO = new cosmeticDTO();
			    
			    cDTO.setSearch("%"+search+"%");
			    log.info("search : " + search);
			    
			    List<cosmeticDTO> autolist = cosService.getBrandAuto(cDTO);
			    
			    log.info("자동완성 :"+autolist);
			    
			    log.info(getClass() + "brand_auto end");

			    return autolist;
		}
	   
	@RequestMapping(value="/brandList", method=RequestMethod.GET)
	public String brandList() throws Exception{

		return "/cos/brandList";
	}
	
	//임산부 추천 화장품
	@RequestMapping(value="/pregnantList", method=RequestMethod.GET)
	public String pregnantList(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "pregnantList start");
		int currentPageNo = 1;
		int maxPost = 10;
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost();
		
		List<cosmeticDTO> page = cosService.getPregnantList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(cosService.writePregGetCount());
		
		paging.makePaging();
		if (page == null) {
			page = new ArrayList<>();
		}
		  model.addAttribute("cList",page);
		  model.addAttribute("paging", paging);
		  log.info(this.getClass().getName() + "pregnantList end");
		return "/cos/pregnantList";
	}
	//영유아 추천 화장품
	@RequestMapping(value="/babyList", method=RequestMethod.GET)
	public String babyList(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "babyList start");
		int currentPageNo = 1;
		int maxPost = 10;
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost();
		
			List<cosmeticDTO> page = cosService.getBabyList(offset, paging.getMaxPost());
			paging.setNumberOfRecords(cosService.writeBabyGetCount());
			
			paging.makePaging();
			if (page == null) {
				page = new ArrayList<>();
			}
			  model.addAttribute("cList",page);
			  model.addAttribute("paging", paging);
		  log.info(this.getClass().getName() + "babyList end");
		return "/cos/babyList";
	}
	//알레르기 성분 추천 화장품
	@RequestMapping(value="/allergyList", method=RequestMethod.GET)
	public String allergyList(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "allergyList start");
		int currentPageNo = 1;
		int maxPost = 10;
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost();
		List<cosmeticDTO> page = cosService.getAllergyList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(cosService.writeAllergyGetCount());
		
		paging.makePaging();
		
			if (page == null) {
				page = new ArrayList<>();
			}
		  model.addAttribute("cList",page);
		  model.addAttribute("paging", paging);
		  log.info(this.getClass().getName() + "allergyList end");
		return "/cos/allergyList";
	}
		@RequestMapping(value="/shopping", method=RequestMethod.GET)
		public String shopping() throws Exception{
			return "/cos/shopping";
		}
/*		//naver API 쇼핑하기
				@RequestMapping(value="/shopping_proc", method=RequestMethod.GET)
				public String shopping_proc(@RequestParam(required=false)String keyword,Model 

		model) throws Exception{
					log.info(this.getClass().getName() + "shopping start");
					log.info("shopping name:"+keyword);
					if(keyword !=null) {
					List<shopDTO> slist = null;
					String clientID = "ViwwjjxGofca4qXXjWME";
				    String clientSecret = "NZd4qqXxP_";
				    int display = 0;
				    int start = 0;
				    
				    URL url;
			        url = new URL("https://openapi.naver.com/v1/search/"
			                + "shop.xml?query="
			                + URLEncoder.encode(keyword, "UTF-8")
			                + (display !=0 ? "&display=" +display :"")
			                + (start !=0 ? "&start=" +start :""));

			        URLConnection urlConn = url.openConnection();
			        urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			        urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			        XmlPullParser parser = factory.newPullParser();
			        parser.setInput(
			                new InputStreamReader(urlConn.getInputStream()));

			        int eventType = parser.getEventType();
			        shopDTO shop = null;
			        while (eventType != XmlPullParser.END_DOCUMENT) {
			            switch (eventType) {
			            case XmlPullParser.END_DOCUMENT:
			                break;
			            case XmlPullParser.START_DOCUMENT:
			                slist = new ArrayList<shopDTO>();
			                break;
			            case XmlPullParser.END_TAG: {
			                String tag = parser.getName();
			                if(tag.equals("item"))
			                {
			                    slist.add(shop);
			                    shop = null;
			                }
			            }
			            case XmlPullParser.START_TAG: {
			                String tag = parser.getName();
			                switch (tag) {
			                case "item":
			                	shop = new shopDTO();
			                    break;
			                case "title":
			                    if(shop != null)
			                    	shop.setTitle(parser.nextText());
			                    break;
			                case "link":
			                    if(shop != null)
			                    	shop.setLink(parser.nextText());
			                    break;
			                case "image":
			                    if(shop != null)
			                    	shop.setImage(parser.nextText());
			                    break;
			                case "lprice":
			                    if(shop != null)
			                    	shop.setLprice(parser.nextText());
			                    break;
			                case "hprice":
			                    if(shop != null)
			                    	shop.setHprice(parser.nextText());
			                    break;
			                case "mallName":
			                    if(shop != null)
			                    	shop.setMallName(parser.nextText());
			                    break;
			                case "productId":
			                    if(shop != null)
			                    	shop.setProductId(parser.nextText());
			                    break;
			                }
			            	}
			            }
			            eventType = parser.next();
			        }
			        
			        model.addAttribute("slist", slist);
					}
					
					log.info(this.getClass().getName() + "shopping end");
					return "/cos/shopping_proc";
				
				
				}*/
		//naver API 쇼핑하기
		@RequestMapping(value="/shopping_proc", method=RequestMethod.POST)
		public @ResponseBody List<shopDTO> shopping_proc(@RequestParam(required=false)String keyword) throws Exception{
			log.info(this.getClass().getName() + "shopping start");
			log.info(keyword);
			
			List<shopDTO> slist = null;
			String clientID = "ViwwjjxGofca4qXXjWME";
		    String clientSecret = "NZd4qqXxP_";
		    int display = 1;
		    int start = 0;
		    
		    URL url;
		    String text = URLEncoder.encode(keyword,"UTF-8");
	        url = new URL("https://openapi.naver.com/v1/search/"
	                + "shop.xml?query="
	                + text
	                + (display !=0 ? "&display=" +display :"")
	                + (start !=0 ? "&start=" +start :""));

	        URLConnection urlConn = url.openConnection();
	        urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
	        urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

	        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	        XmlPullParser parser = factory.newPullParser();
	        parser.setInput(
	                new InputStreamReader(urlConn.getInputStream()));

	        int eventType = parser.getEventType();
	        shopDTO shop = null;
	        while (eventType != XmlPullParser.END_DOCUMENT) {
	            switch (eventType) {
	            case XmlPullParser.END_DOCUMENT: // 占쏙옙占쏙옙占쏙옙 占쏙옙
	                break;
	            case XmlPullParser.START_DOCUMENT:
	                slist = new ArrayList<shopDTO>();
	                break;
	            case XmlPullParser.END_TAG: {
	                String tag = parser.getName();
	                if(tag.equals("item"))
	                {
	                    slist.add(shop);
	                    shop = null;
	                }
	            }
	            case XmlPullParser.START_TAG: {
	                String tag = parser.getName();
	                switch (tag) {
	                case "item":
	                	shop = new shopDTO();
	                    break;
	                case "title":
	                    if(shop != null)
	                    	shop.setTitle(parser.nextText());
	                    break;
	                case "link":
	                    if(shop != null)
	                    	shop.setLink(parser.nextText());
	                    break;
	                case "image":
	                    if(shop != null)
	                    	shop.setImage(parser.nextText());
	                    break;
	                case "lprice":
	                    if(shop != null)
	                    	shop.setLprice(parser.nextText());
	                    break;
	                case "hprice":
	                    if(shop != null)
	                    	shop.setHprice(parser.nextText());
	                    break;
	                case "mallName":
	                    if(shop != null)
	                    	shop.setMallName(parser.nextText());
	                    break;
	                case "productId":
	                    if(shop != null)
	                    	shop.setProductId(parser.nextText());
	                    break;
	                }
	            	}
	            }
	            eventType = parser.next();
	        }
			log.info(this.getClass().getName() + "shopping end");
			return slist;
		}

}
