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
import com.health.util.SHA256;
	
@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name = "MainService")
	private IMainService mainService;
	
	@Autowired
	private JavaMailSender mailSender;		
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() throws Exception {

		System.out.println("main start");
		return "/main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "/login";
	}
	//���̵��ߺ�üũ
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
	//�̸����ߺ�üũ
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
	//�α���
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
				model.addAttribute("msg", "�̸��������� ���ּ���");
				model.addAttribute("url", "/login.do");
				returnURL = "/alert";
			}
		} else {
			model.addAttribute("msg", "��ġ�ϴ� ȸ���� �����ϴ�. �ٽ� Ȯ�����ּ���");
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
	//ȸ������
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
	String title = "Safe Cosmetic ȸ�� ���� �̸��� ����";		//���� ����
	StringBuffer contents = new StringBuffer();
	
	contents.append("�̸��� ������ Ŭ���Ͻø� ȸ�� ������ �Ϸ�˴ϴ�. <br/>")
			.append("<a href='http://192.168.170.141:9000/emailConfirm.do?key=")
			.append(key)
			.append("'><h2>�̸��� ����</h2></a>");
	
	MimeMessage message = mailSender.createMimeMessage();
	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	
	messageHelper.setFrom(setfrom);						//�۽��ڸ� �����ϸ� �����۵��� ����
	messageHelper.setTo(tomail);						//������ ����
	messageHelper.setSubject(title);					//���� ������ ���� ����
	messageHelper.setText(contents.toString(),true);	//���� ����
	
	mailSender.send(message);
	
	
	if (re != 0) {
		model.addAttribute("msg", "�̸��� ������ �Ϸ����ֽñ� �ٶ��ϴ�.");
		model.addAttribute("url", "/login.do");
	} else {
		model.addAttribute("msg", "ȸ�����Կ� �����Ͽ����ϴ�.");
		model.addAttribute("url", "/join.do");
	}
	log.info(this.getClass() + ".join_proc end");
	return "/alert";
	}
	
	//�α׾ƿ�
	@RequestMapping(value="/logOut")
	public String logOut(Model model, HttpSession session) {
		log.info(this.getClass() + ".logOut start");
		session.setAttribute("session_user_no", "");
		session.setAttribute("session_user_id", "");
		model.addAttribute("msg", "�α׾ƿ��Ǿ����ϴ�.");
		model.addAttribute("url", "/main.do");
		log.info(this.getClass() + ".logOut end");
		return "/alert";
	}
	
	@RequestMapping(value="/idSearch", method=RequestMethod.GET)
	public String idSearch() {
		
		return "/idSearch";
	
	}
	
	//���̵� ã��
	@RequestMapping(value="/idSearch_proc", method= {RequestMethod.GET, RequestMethod.POST})
	public String idSearch_proc(Model model, HttpServletRequest req) throws Exception {
		
		log.info(this.getClass() + ".id_search_proc start");

		String email = req.getParameter("email");

		log.info(this.getClass() + "email : " + email);

		mainDTO mDTO = new mainDTO();

		mDTO.setEmail(email);

		mDTO = mainService.getUserId(mDTO);

		if (mDTO != null) {
			model.addAttribute("msg", "ȸ������ ���̵�� [ " + mDTO.getUser_id() + " ]�Դϴ�.");
			model.addAttribute("url", "/login.do");
		} else {
			model.addAttribute("msg", "��ġ�ϴ� ȸ���� �����ϴ�. �ٽ� Ȯ�����ּ���");
			model.addAttribute("url", "/idSearch.do");
		}
		log.info(this.getClass() + ".id_search_proc end");
		mDTO = null;
		return "/alert";
	
	}
	
	//��й�ȣ ã�� �̸��� ����
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
		
		
		//�̸��� ���� url �߼�
		log.info(mDTO.getUser_no());
		
		
		log.info(mDTO.getEmail());
		String setfrom = "seoyeon1798@gmail.com";					//�۽��� ���� �ּ�
		String tomail = mDTO.getEmail();					        //������ ���� �ּ�
		String title = "Safe Cosmetic ��й�ȣ����";		        //���� ����
		StringBuffer contents = new StringBuffer();
		try{
			mDTO = mainService.getUserPw(mDTO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		String key = mDTO.getUser_no();
		log.info(key);
		
		contents.append("��й�ȣ�������ֽñ� �ٶ��ϴ�. <br/>")
				.append("<a href='http://192.168.170.141:9000/pwChange.do?key=")
				.append(key)
				.append("'><h2>��й�ȣ ����</h2></a>");
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		messageHelper.setFrom(setfrom);						//�۽��ڸ� �����ϸ� �����۵��� ����
		messageHelper.setTo(tomail);						//������ ����
		messageHelper.setSubject(title);					//���� ������ ���� ����
		messageHelper.setText(contents.toString(),true);	//���� ����
		
		mailSender.send(message);
		
		if (mDTO != null) {
			model.addAttribute("msg", "�̸����� �����߽��ϴ�! ��й�ȣ�� �������ּ���.");
			model.addAttribute("url", "/login.do");
		} else {
			model.addAttribute("msg", "�̸��� ������ �����߽��ϴ�.");
			model.addAttribute("url", "/join.do");
		}
		log.info(this.getClass() + ".pwSearch end");
		
		mDTO = null;
		
		return "/alert";
	}
	
	//��й�ȣ ã��
	@RequestMapping(value="/pwChange", method=RequestMethod.GET)
	public String pwSearch_proc(String key, HttpSession session) {

		String user_no = key;
		log.info(this.getClass() + "user_no : " + user_no);
		
		mainDTO mDTO = new mainDTO();
		
		mDTO.setUser_no(user_no);
		
		session.setAttribute("session_user_no", mDTO.getUser_no());
		
		return "/pwChange";
	
	}
	
	//ȸ�����
	@RequestMapping(value="/userList")
	public String userList(Model model) throws Exception {
		log.info(this.getClass() + ".userList start");
		
		List<mainDTO> mList = mainService.getUserList();
		
		if (mList == null) {
			mList = new ArrayList<>();
		}
		model.addAttribute("mList", mList);
		log.info(this.getClass() + ".userList end");
		return "/userList";
	
	}
	//ȸ����������
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
	//ȸ������
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
			model.addAttribute("msg", "ȸ�� ������ �����Ǿ����ϴ�.");
			model.addAttribute("url", "/userDetail.do?user_no=" + user_no);
		} else {
			model.addAttribute("msg", "ȸ������ ������ �����Ͽ����ϴ�.");
			model.addAttribute("url", "/userDetail.do?user_no=" + user_no);
		}
		log.info(this.getClass() + ".user_update end");
		
		return "/alert";
	
	}
	//ȸ����й�ȣ����
	@RequestMapping(value="/userCheck", method={RequestMethod.GET ,RequestMethod.POST})
	public String userCheck() {
		return "/userCheck";
	}
	//ȸ����й�ȣ����
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
			model.addAttribute("msg", "��й�ȣ�� �������ּ���.");
			model.addAttribute("url", "/userPwChange.do");
			returnURL = "/alert";
		} else {
			model.addAttribute("msg", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ�����ּ���");
			model.addAttribute("url", "/userCheck.do");
			returnURL = "/alert";
		}
		user_id = null;
		password = null;
		mDTO = null;
		log.info(this.getClass() + ".userCheck_proc end");
		return returnURL;
	
	}
	//ȸ����й�ȣ����
		@RequestMapping(value="/userPwChange", method={RequestMethod.GET ,RequestMethod.POST})
		public String userPwChange() {
			return "/userPwChange";
		}
	//ȸ����й�ȣ����
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
			model.addAttribute("msg", "����Ǿ����ϴ�.");
			model.addAttribute("url", "/main.do");
		} else {
			model.addAttribute("msg", "�ٽýõ����ּ���.");
			model.addAttribute("url", "/userPwChange.do");
		}
		log.info(this.getClass() + ".userPwChange_proc end");
		return "/alert";
	}
	
	//ȸ������
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
			model.addAttribute("msg", "ȸ���� Ż��Ǿ����ϴ�.");
			model.addAttribute("url", "/main.do");
		} else {
			model.addAttribute("msg", "ȸ��Ż�� �����Ͽ����ϴ�.");
			model.addAttribute("url", "/userDetail.do?user_no=" + user_no);
		}
		log.info(this.getClass() + ".userDelete end");
		
		return "/alert";
	
	}
	//�̸��� ����
	@RequestMapping(value="/emailConfirm", method=RequestMethod.GET)
    public String emailConfirm(String key, Model model, HttpServletRequest req) throws Exception{
		log.info(this.getClass() + ".emailConfirm start");
		
		String user_no = key;
		log.info(this.getClass() + "user_no : " + user_no);
		
		mainDTO mDTO = new mainDTO();
		
		mDTO.setUser_no(user_no);
		
		int result = mainService.updateEmailConfirm(mDTO);

		if (result != 0) {
			model.addAttribute("msg", "�����Ǿ����ϴ�.");
			model.addAttribute("url", "/login.do");
		} else {
			model.addAttribute("msg", "������ �����߽��ϴ�.");
			model.addAttribute("url", "/login.do");
		}
		log.info(this.getClass() + ".emailConfirm end");
		return "/alert";
	}
	
	//��й�ȣ����
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
				model.addAttribute("msg", "����Ǿ����ϴ�.");
				model.addAttribute("url", "/login.do");
			} else {
				model.addAttribute("msg", "�ٽýõ����ּ���.");
				model.addAttribute("url", "/login.do");
			}
			log.info(this.getClass() + ".pwEmailConfirm end");
			return "/alert";
		}
	
}