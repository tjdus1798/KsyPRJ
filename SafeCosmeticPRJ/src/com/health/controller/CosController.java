package com.health.controller;

import java.awt.Image;
import java.io.File;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
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

import com.health.DTO.cosmeticDTO;
import com.health.DTO.ingDTO;
import com.health.DTO.shopDTO;
import com.health.DTO.likeDTO;
import com.health.service.ICosService;
import com.health.util.CmmUtil;
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
	//화장품등록
	@RequestMapping(value="/cosReg_proc", method=RequestMethod.POST)
	public String cosReg_proc(HttpServletRequest req, Model model, HttpSession session, cosmeticDTO cdto) throws Exception{
		log.info(this.getClass() + ".cosReg_proc start");
		
		String root = req.getSession().getServletContext().getRealPath("/");
		String savePath = root +"cosmetic";
		String saveThumbPath = root+"thumbnail";
		
		String img_name = cdto.getUpfile().getOriginalFilename();
		String img_path = savePath + "\\" + img_name;
		String thumb_name = cdto.getUpfile().getOriginalFilename();
		String thumb_path = saveThumbPath+"\\"+thumb_name;
		String[] ing_namex = req.getParameterValues("ing_names");
		String cos_names = CmmUtil.nvl(req.getParameter("cos_names"));
		String brands = CmmUtil.nvl(req.getParameter("brands"));
		
		String cos_name = TextUtil.exchangeEscapeNvl(cos_names);
		String brand = TextUtil.exchangeEscapeNvl(brands);
		
		String reg_no = (String) session.getAttribute("session_user_no");
		String ing_namee = "";
		String ing_name = "";
		
		for(int i =0; i<ing_namex.length; i++){
			log.info("ing_namex : " + ing_namex[i]);
			ing_namee = TextUtil.exchangeEscapeNvl(ing_namex[i]);
			log.info("ing_namee : " + ing_namee);
		}
		for(int i =0; i<ing_namex.length; i++){
			log.info("ing_namex : " + ing_namex[i]);
			ing_name += ing_namex[i]+"$";
		}
		
		int thumbWidth = 500;
		int thumbHeight = 300;
		
		Image thumbnail=JimiUtils.getThumbnail(img_path, thumbWidth, thumbHeight, Jimi.IN_MEMORY);
		Jimi.putImage(thumbnail,thumb_path);
		
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
		
		cdto.setCos_name(cos_name);
		cdto.setBrand(brand);
		cdto.setReg_no(brand);
		cdto.setReg_no(reg_no);
		cdto.setIng_name(ing_name);
		cdto.setImg_name(img_name);
		cdto.setImg_path(img_path);
		cdto.setThumb_name(thumb_name);
		cdto.setThumb_path(thumb_path);
		
		File normal = new File(img_path);
		cdto.getUpfile().transferTo(normal);
		
		File thumnail = new File(thumb_path);
		cdto.getUpfile().transferTo(thumnail);
		
		int re = cosService.insertCos(cdto);
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

	//성분으로 검색
	@RequestMapping(value="/ingredient_search", method=RequestMethod.POST)
	public @ResponseBody List<cosmeticDTO> ingredient_search(@RequestParam(value = "good") String goods, @RequestParam(value = "bad") String bads, @RequestParam(value = "cos_type") String cos_type) throws Exception{

		  log.info(getClass() + "ingredient_search start");
		  
		  List<cosmeticDTO> clist= null;
		   cosmeticDTO cDTO = new cosmeticDTO();
		   String good = TextUtil.exchangeEscapeNvl(goods);
		   String bad = TextUtil.exchangeEscapeNvl(bads);
		    
		    if(goods=="") {
		    	log.info("bad : " + bad);
			    log.info("cos_type : " + cos_type);
			    log.info("좋은성분 제외");
		    	
		    	cDTO.setBad("%"+bad+"%");
				cDTO.setCos_type("%"+cos_type+"%");
				//좋은성분제외 검색
				clist = cosService.getWithoutGood(cDTO);
			    
		    }else if(bads=="") {
		    	log.info("good : " + good);
			    log.info("cos_type : " + cos_type);
			    log.info("나쁜성분 제외");
			    
		    	cDTO.setGood("%"+good+"%");
			    cDTO.setCos_type("%"+cos_type+"%");
			    //피할성분제외 검색
			    clist = cosService.getWithoutBad(cDTO);
		    	
		    }else if(cos_type=="카테고리") {
		    	log.info("good : " + good);
			    log.info("bad : " + bad);
			    log.info("화장품종류 제외");
			    
		    	cDTO.setGood("%"+good+"%");
			    cDTO.setBad("%"+bad+"%");
			    //화장품타입제외 검색
			    clist = cosService.getWithoutCosType(cDTO);
			    
		    }else {
		    	log.info("good : " + good);
			    log.info("bad : " + bad);
			    log.info("cos_type : " + cos_type);
			    log.info("완전체임");
			    
		    	cDTO.setGood("%"+good+"%");
			    cDTO.setBad("%"+bad+"%");
			    cDTO.setCos_type("%"+cos_type+"%");
			  //완전체 성분으로 검색
			    clist = cosService.getIngSearch(cDTO);
		    }
	   
		    log.info(getClass() + "ingredient_search end");
		    log.info(clist);
		 return clist;
	}
	//성분으로 자동완성
	@RequestMapping(value="/ingredient_auto", method= RequestMethod.POST)
	public @ResponseBody List<ingDTO> ingredient_auto(@RequestParam(value = "good") String good, @RequestParam(value = "bad") String bad) throws Exception{

		  log.info(getClass() + "ingredient_auto start");
		  
		  List<ingDTO> inglist= null;
		  ingDTO iDTO = new ingDTO();
		
		  if(good=="") { 
			  iDTO.setGood("%"+good+"%");
			  log.info("goods : " + good);
			  inglist = cosService.getIngGoodAuto(iDTO);	
		  }else {
			  iDTO.setBad("%"+bad+"%");
			  log.info("bads : " + bad);
			  inglist = cosService.getIngBadAuto(iDTO);	
		  }
		 log.info(inglist);
		 log.info(getClass() + "ingredient_auto end");
		 return inglist;
	}
	
	//성분별 화장품목록
	@RequestMapping(value="/ingredientList", method=RequestMethod.GET)
	public String ingredientList() throws Exception{

		return "/cos/ingredientList";
	}
	
	//브랜드명으로 검색
	@RequestMapping(value="/brand_search", method=RequestMethod.POST)
	public @ResponseBody List<cosmeticDTO> brand_search(@RequestParam(value = "search") String search) throws Exception{
		
		    log.info(getClass() + "brand_search start");
		    cosmeticDTO cDTO = new cosmeticDTO();
		    String searchs = TextUtil.exchangeEscapeNvl(search);
		    cDTO.setSearch("%"+searchs+"%");
		    log.info("search : " + searchs);
		    
		    List<cosmeticDTO> clist = cosService.getBrandSearch(cDTO);		    
		    log.info(clist);
		    log.info(getClass() + "brand_search end");

		    return clist;
	}
	//브랜드명 자동완성
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
	
	//브랜드별 화장품목록
	@RequestMapping(value="/brandList", method=RequestMethod.GET)
	public String brandList() throws Exception{

		return "/cos/brandList";
	}
	
	//임산부추천 화장품목록
	@RequestMapping(value="/pregnantList", method=RequestMethod.GET)
	public String pregnantList(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "pregnantList start");
		  
		List<cosmeticDTO> cList = cosService.getPregnantList();

		if (cList == null) {
			cList = new ArrayList<>();
		}
		  model.addAttribute("cList",cList);
		 
		  log.info(this.getClass().getName() + "pregnantList end");
		return "/cos/pregnantList";
	}
	//영유아추천 화장품목록
	@RequestMapping(value="/babyList", method=RequestMethod.GET)
	public String babyList(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "babyList start");
		  
			List<cosmeticDTO> cList = cosService.getBabyList();

			if (cList == null) {
				cList = new ArrayList<>();
			}
			  model.addAttribute("cList",cList);
		  log.info(this.getClass().getName() + "babyList end");
		return "/cos/babyList";
	}
	//알레르기추천 화장품목록
	@RequestMapping(value="/allergyList", method=RequestMethod.GET)
	public String allergyList(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "allergyList start");
			List<cosmeticDTO> cList = cosService.getAllergyList();

			if (cList == null) {
				cList = new ArrayList<>();
			}
		  model.addAttribute("cList",cList);
		 
		  log.info(this.getClass().getName() + "allergyList end");
		return "/cos/allergyList";
	}
	//쇼핑하기
	@RequestMapping(value="/shopping", method=RequestMethod.GET)
	public String shopping(@RequestParam(required=false)String keyword,Model model) throws Exception{
		log.info(this.getClass().getName() + "shopping start");
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
            case XmlPullParser.END_DOCUMENT: // 문서의 끝
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
		return "/cos/shopping";
	}

}
