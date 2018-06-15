package com.health.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.health.DTO.mainDTO;
import com.health.service.IMainService;
import com.health.util.CmmUtil;
import com.health.util.Paging;
import com.health.util.SHA256;
	
@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name = "MainService")
	private IMainService mainService;
	Paging pagemaker;
	@Autowired
	private JavaMailSender mailSender;		
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() throws Exception {

		System.out.println("-----------main----------");
		return "/main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "/login";
	}
	//아이디 중복
	@ResponseBody
	@RequestMapping(value="/idCheck", method= {RequestMethod.POST,RequestMethod.GET})
	public int idCheck(HttpServletRequest req)  throws Exception {
		String user_id = req.getParameter("user_id");
		log.info(this.getClass() + "user_id : " + user_id);
		mainDTO mDTO = new mainDTO();
		mDTO.setUser_id(user_id);
		int re = mainService.getIdCheck(mDTO);
		
		if(re!=0) {
			return 1;
		}else {
			return -1;
		}
	}
	//이메일 중복
	@ResponseBody
	@RequestMapping(value="/emailCheck", method= {RequestMethod.POST,RequestMethod.GET})
	public int emailCheck(HttpServletRequest req)  throws Exception {
		String email = req.getParameter("email");
		log.info(this.getClass() + "email : " + email);
		mainDTO mDTO = new mainDTO();
		mDTO.setEmail(email);
		int re = mainService.getEmailCheck(mDTO);
		
		if(re!=0) {
			return 1;
		}else {
			return -1;
		}
	}
	//로그인
	@RequestMapping(value="/login_proc", method= {RequestMethod.GET, RequestMethod.POST})
	public String login_proc(HttpServletRequest req, Model model, HttpSession session) throws Exception {
		
		log.info(this.getClass() + ".login_proc start");
		String user_id = req.getParameter("user_id");
		String password = SHA256.SHA256_encode(req.getParameter("password"));

		log.info(this.getClass() + "user_id : " + user_id);
		log.info(this.getClass() + "password : " + password);

		mainDTO mDTO = new mainDTO();
		mDTO.setUser_id(user_id);
		mDTO.setPassword(password);

		mDTO = mainService.getUserInfo(mDTO);

		String returnURL = "";
		if (mDTO != null) {
			if(mDTO.getEmail_confirm().equals("y")) {
				session.setAttribute("session_user_no", mDTO.getUser_no());
				session.setAttribute("session_user_id", mDTO.getUser_id());
				returnURL = "/main";
			}else {
				model.addAttribute("msg", "이메일 인증은 필수입니다.");
				model.addAttribute("url", "/login.do");
				returnURL = "/alert";
			}
		} else {
			model.addAttribute("msg", "존재 하지않는 아이디/비밀번호 입니다.");
			model.addAttribute("url", "/login.do");
			returnURL = "/alert";
		}
		user_id = null;
		password = null;
		mDTO = null;
		log.info(this.getClass() + ".login_proc end");
		return returnURL;
		
	}
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		
		return "/join";
	
	}
	//회원가입
	@RequestMapping(value="/join_proc", method= {RequestMethod.GET, RequestMethod.POST})
	public String join_proc(HttpServletRequest req, Model model, HttpSession session) throws Exception {
	log.info(this.getClass() + ".join_proc start");
	
	String user_id = CmmUtil.nvl(req.getParameter("user_id"));
	String password = CmmUtil.nvl(SHA256.SHA256_encode(req.getParameter("password")));
	String email = CmmUtil.nvl(req.getParameter("email"));
	String age = CmmUtil.nvl(req.getParameter("age"));
	String gender = CmmUtil.nvl(req.getParameter("gender"));
	String something = CmmUtil.nvl(req.getParameter("something"));
	String skin_type = CmmUtil.nvl(req.getParameter("skin_type"));
	

	log.info("user_id : " + user_id);
	log.info("password : " + password);
	log.info("email : " + email);
	log.info("age : " + age);
	log.info("gender : " + gender);
	log.info("something : " + something);
	log.info("skin_type : " + skin_type);

	mainDTO mDTO = new mainDTO();

	mDTO.setUser_id(user_id);
	mDTO.setPassword(password);
	mDTO.setEmail(email);
	mDTO.setAge(age);
	mDTO.setGender(gender);
	mDTO.setSomething(something);
	mDTO.setSkin_type(skin_type);
	int re = mainService.insertJoin(mDTO);

	//�̸��� ���� url �߼�
	mDTO = mainService.getUserInfo(mDTO);
	
	String key = mDTO.getUser_no();
	log.info(key);
	log.info(mDTO.getEmail());
	String setfrom = "seoyeon1798@gmail.com";					//�۽��� ���� �ּ�
	String tomail = mDTO.getEmail();					        //������ ���� �ּ�
	String title = "Safe Cosmetic 이메일 인증";		//���� ����
	StringBuffer contents = new StringBuffer();
	
	contents.append("SafeCosmetic 회원가입 <br/>")
			.append("<a href='http://192.168.175.44:8080/emailConfirm.do?key=")
			.append(key)
			.append("'><h2>이메일 인증하기</h2></a>");
	
	MimeMessage message = mailSender.createMimeMessage();
	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	
	messageHelper.setFrom(setfrom);						//�۽��ڸ� �����ϸ� �����۵��� ����
	messageHelper.setTo(tomail);						//������ ����
	messageHelper.setSubject(title);					//���� ������ ���� ����
	messageHelper.setText(contents.toString(),true);	//���� ����
	
	mailSender.send(message);
	
	
	if (re != 0) {
		model.addAttribute("msg", "이메일 인증 후 로그인해주세요!");
		model.addAttribute("url", "/login.do");
	} else {
		model.addAttribute("msg", "회원가입에 실패했습니다.");
		model.addAttribute("url", "/join.do");
	}
	log.info(this.getClass() + ".join_proc end");
	return "/alert";
	}
	
	//로그아웃
	@RequestMapping(value="/logOut")
	public String logOut(Model model, HttpSession session) {
		log.info(this.getClass() + ".logOut start");
		session.setAttribute("session_user_no", "");
		session.setAttribute("session_user_id", "");
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("url", "/main.do");
		log.info(this.getClass() + ".logOut end");
		return "/alert";
	}
	
	@RequestMapping(value="/idSearch", method=RequestMethod.GET)
	public String idSearch() {
		
		return "/idSearch";
	
	}
	
	//아이디 찾기
	@RequestMapping(value="/idSearch_proc", method= {RequestMethod.GET, RequestMethod.POST})
	public String idSearch_proc(Model model, HttpServletRequest req) throws Exception {
		
		log.info(this.getClass() + ".id_search_proc start");

		String email = req.getParameter("email");

		log.info(this.getClass() + "email : " + email);

		mainDTO mDTO = new mainDTO();

		mDTO.setEmail(email);

		mDTO = mainService.getUserId(mDTO);

		if (mDTO != null) {
			model.addAttribute("msg", "회원님의 아이디는 [ " + mDTO.getUser_id() + " 입니다.");
			model.addAttribute("url", "/login.do");
		} else {
			model.addAttribute("msg", "등록하신 이메일이 존재하지않습니다.");
			model.addAttribute("url", "/idSearch.do");
		}
		log.info(this.getClass() + ".id_search_proc end");
		mDTO = null;
		return "/alert";
	
	}
	
	//비밀번호 찾기 이메일 전송

		@RequestMapping(value="/pwSearch", method= {RequestMethod.GET,RequestMethod.POST})
		public String pwSearch(Model model, HttpServletRequest req) throws Exception {
			log.info(this.getClass() + ".pwSearch start");
			String user_id = req.getParameter("user_id");
			String email = req.getParameter("email");

			log.info(this.getClass() + "id : " + user_id);
			log.info(this.getClass() + "email : " + email);
			mainDTO mDTO = new mainDTO();
			mDTO.setUser_id(user_id);
			mDTO.setEmail(email);

			//이메일 인증 url 발송

			log.info(mDTO.getUser_no());
			log.info(mDTO.getEmail());
			String setfrom = "seoyeon1798@gmail.com";					//송신자 메일 주소
			String tomail = mDTO.getEmail();					        //수신자 메일 주소
			String title = "Safe Cosmetic 비밀번호변경";		        //메일 제목
			StringBuffer contents = new StringBuffer();
			try{
				mDTO = mainService.getUserPw(mDTO);
			}catch(Exception e) {
				e.printStackTrace();
			}
			String key = mDTO.getUser_no();
			log.info(key);
			contents.append("비밀번호변경해주시길 바랍니다. <br/>")
					.append("<a href='http://192.168.175.44:8080/pwChange.do?key=")
					.append(key)
					.append("'><h2>비밀번호 변경</h2></a>");

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);						//송신자를 생략하면 정상작동을 안함
			messageHelper.setTo(tomail);						//수신자 메일
			messageHelper.setSubject(title);					//메일 제목은 생략 가능
			messageHelper.setText(contents.toString(),true);	//메일 내용

			mailSender.send(message);
			if (mDTO != null) {
				model.addAttribute("msg", "이메일을 전송했습니다! 비밀번호를 변경해주세요.");
				model.addAttribute("url", "/login.do");
			} else {
				model.addAttribute("msg", "이메일 전송을 실패했습니다.");
				model.addAttribute("url", "/join.do");
			}
			log.info(this.getClass() + ".pwSearch end");
			mDTO = null;

			return "/alert";

		}
	
	//비밀번호 변경
	@RequestMapping(value="/pwChange", method=RequestMethod.GET)
	public String pwSearch_proc(String key, HttpSession session) {

		String user_no = key;
		log.info(this.getClass() + "user_no : " + user_no);
		
		mainDTO mDTO = new mainDTO();
		
		mDTO.setUser_no(user_no);
		
		session.setAttribute("session_user_no", mDTO.getUser_no());
		
		return "/pwChange";
	
	}
	
	//회원목록
	@RequestMapping(value="/userList")
	public String userList(Model model,HttpServletRequest req) throws Exception {
		log.info(this.getClass() + ".userList start");
		int currentPageNo = 1;
		int maxPost = 10;
		

		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost();
		
		List<mainDTO> page = mainService.getUserList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(mainService.writeGetCount());
		
		paging.makePaging();
		if (page == null) {
			page = new ArrayList<>();
		}
		model.addAttribute("mList", page);
		model.addAttribute("paging", paging);
		log.info(this.getClass() + ".userList end");
		return "/userList";
	
	}
	//회원상세
	@RequestMapping(value="/userDetail", method=RequestMethod.GET)
	public String userDetail(Model model, HttpServletRequest req, HttpSession session) throws Exception {
		
		log.info(this.getClass() + ".userDetail start");
		
		String user_no = CmmUtil.nvl(req.getParameter("user_no"));
		
		log.info("user_no =" + user_no);
		
		mainDTO mDTO = mainService.getUserDetail(user_no);
		
		if (mDTO == null) {
			mDTO = new mainDTO();
		}
		model.addAttribute("mDTO", mDTO);
		log.info(this.getClass() + ".userDetail end");

		return "/userDetail";
	}
	//회원수정
	@RequestMapping(value="/userUpdate", method= {RequestMethod.GET,RequestMethod.POST})
	public String userUpdate(Model model, HttpServletRequest req, HttpSession session) throws Exception {
		log.info(this.getClass() + ".userUpdate start");
		
		String user_no = CmmUtil.nvl(req.getParameter("user_no"));
		String age = CmmUtil.nvl(req.getParameter("age"));
		String gender = CmmUtil.nvl(req.getParameter("gender"));
		String skin_type = CmmUtil.nvl(req.getParameter("skin_type"));
		String something = CmmUtil.nvl(req.getParameter("something"));
		String chg_no = CmmUtil.nvl(req.getParameter("user_no"));
	
		log.info("age :" + age);
		log.info("gender : " + gender);
		log.info("skin_type : " + skin_type);
		log.info("something :" + something);
		log.info("chg_no : " + chg_no);

		mainDTO mDTO = new mainDTO();
		
		mDTO.setUser_no(user_no);
		mDTO.setAge(age);
		mDTO.setGender(gender);
		mDTO.setSkin_type(skin_type);
		mDTO.setSomething(something);
		mDTO.setChg_no(chg_no);

		int result = mainService.updateUserInfo(mDTO);

		if (result != 0) {
			model.addAttribute("msg", "수정되었습니다.");
			model.addAttribute("url", "/userDetail.do?user_no=" + user_no);
		} else {
			model.addAttribute("msg", "수정에 실패했습니다.");
			model.addAttribute("url", "/userDetail.do?user_no=" + user_no);
		}
		log.info(this.getClass() + ".user_update end");
		
		return "/alert";
	
	}
	@RequestMapping(value="/userCheck", method={RequestMethod.GET ,RequestMethod.POST})
	public String userCheck() {
		return "/userCheck";
	}
	//비밀번호 변경전 체크
	@RequestMapping(value="/userCheck_proc", method={RequestMethod.GET ,RequestMethod.POST})
	public String userCheck_proc(HttpServletRequest req,Model model,HttpSession session) throws Exception {
		
		log.info(this.getClass() + ".userCheck_proc start");

		String user_id = (String) session.getAttribute("session_user_id");
		String password = SHA256.SHA256_encode(req.getParameter("password"));
		log.info(this.getClass() + "user_id : " + user_id);
		log.info(this.getClass() + "password : " + password);

		mainDTO mDTO = new mainDTO();
		
		mDTO.setUser_id(user_id);
		mDTO.setPassword(password);

		mDTO = mainService.getUserInfo(mDTO);

		String returnURL = "";
		if (mDTO != null) {
			model.addAttribute("msg", "비밀번호를 변경해주세요.");
			model.addAttribute("url", "/userPwChange.do");
			returnURL = "/alert";
		} else {
			model.addAttribute("msg", "비밀번호가 맞지않습니다. 다시 입력해주세요.");
			model.addAttribute("url", "/userCheck.do");
			returnURL = "/alert";
		}
		user_id = null;
		password = null;
		mDTO = null;
		log.info(this.getClass() + ".userCheck_proc end");
		return returnURL;
	
	}
		@RequestMapping(value="/userPwChange", method={RequestMethod.GET ,RequestMethod.POST})
		public String userPwChange() {
			return "/userPwChange";
		}
	//비밀번호 변경
	@RequestMapping(value="/userPwChange_proc", method={RequestMethod.GET ,RequestMethod.POST})
	public String userPwChange_proc(HttpSession session, Model model,HttpServletRequest req) throws Exception {
		log.info(this.getClass() + ".userPwChange_proc start");
		
		String user_no = (String) session.getAttribute("session_user_no");
		String password = CmmUtil.nvl(SHA256.SHA256_encode(req.getParameter("password")));
		
		log.info(this.getClass() + "user_no : " + user_no);
		log.info(this.getClass() + "password : " + password);
		
		mainDTO mDTO = new mainDTO();
		
		mDTO.setUser_no(user_no);
		mDTO.setPassword(password);
		
		int result = mainService.updatePwEmailConfirm(mDTO);

		if (result != 0) {
			model.addAttribute("msg", "비밀번호가 변경되었습니다.");
			model.addAttribute("url", "/main.do");
		} else {
			model.addAttribute("msg", "비밀번호 변경에 실패했습니다.");
			model.addAttribute("url", "/userPwChange.do");
		}
		log.info(this.getClass() + ".userPwChange_proc end");
		return "/alert";
	}
	
	//회원삭제
	@RequestMapping(value="/userDelete", method=RequestMethod.GET)
	public String userDelete(HttpServletRequest req,HttpSession session,Model model) throws Exception {
		
		log.info(this.getClass() + ".userDelete start");
		
		String user_no = CmmUtil.nvl(req.getParameter("user_no"));
		
		mainDTO uDTO = new mainDTO();
		
		uDTO.setUser_no(user_no);

		int result = mainService.deleteUserInfo(uDTO);
		if (result != 0) {
			session.setAttribute("session_user_no", "");
			session.setAttribute("session_user_id", "");
			model.addAttribute("msg", "탈퇴했습니다.");
			model.addAttribute("url", "/main.do");
		} else {
			model.addAttribute("msg", "회원탈퇴에 실패했습니다.");
			model.addAttribute("url", "/userDetail.do?user_no=" + user_no);
		}
		log.info(this.getClass() + ".userDelete end");
		
		return "/alert";
	
	}
	//이메일 확인
	@RequestMapping(value="/emailConfirm", method=RequestMethod.GET)
    public String emailConfirm(String key, Model model, HttpServletRequest req) throws Exception{
		log.info(this.getClass() + ".emailConfirm start");
		
		String user_no = key;
		log.info(this.getClass() + "user_no : " + user_no);
		
		mainDTO mDTO = new mainDTO();
		
		mDTO.setUser_no(user_no);
		
		int result = mainService.updateEmailConfirm(mDTO);

		if (result != 0) {
			model.addAttribute("msg", "이메일 인증되었습니다.");
			model.addAttribute("url", "/login.do");
		} else {
			model.addAttribute("msg", "이메일 인증에 실패했습니다.");
			model.addAttribute("url", "/login.do");
		}
		log.info(this.getClass() + ".emailConfirm end");
		return "/alert";
	}
	
	//비밀번호 찾기
		@RequestMapping(value="/pwEmailConfirm", method= {RequestMethod.GET ,RequestMethod.POST})
	    public String pwEmailConfirm(Model model, HttpServletRequest req, HttpSession session) throws Exception{
			log.info(this.getClass() + ".pwEmailConfirm start");
			
			String user_no = (String) session.getAttribute("session_user_no");
			String password = CmmUtil.nvl(SHA256.SHA256_encode(req.getParameter("password")));
			
			log.info(this.getClass() + "user_no : " + user_no);
			log.info(this.getClass() + "password : " + password);
			
			mainDTO mDTO = new mainDTO();
			
			mDTO.setUser_no(user_no);
			mDTO.setPassword(password);
			
			int result = mainService.updatePwEmailConfirm(mDTO);

			if (result != 0) {
				model.addAttribute("msg", "비밀번호가 변경되었습니다.");
				model.addAttribute("url", "/login.do");
			} else {
				model.addAttribute("msg", "비밀번호 변경에 실패했습니다.");
				model.addAttribute("url", "/login.do");
			}
			log.info(this.getClass() + ".pwEmailConfirm end");
			return "/alert";
		}
	
}