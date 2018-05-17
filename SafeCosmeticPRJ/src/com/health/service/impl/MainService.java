package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.mainDTO;
import com.health.persistence.mapper.MainMapper;
import com.health.service.IMainService;

@Service("MainService")
public class MainService implements IMainService {
		
	@Resource(name="MainMapper")
	private MainMapper mainMapper;
	//로그인
	@Override
	public mainDTO getUserInfo(mainDTO mDTO) throws Exception {
		return mainMapper.getUserInfo(mDTO);
	}
	//회원가입
	@Override
	public int insertJoin(mainDTO mDTO) throws Exception {
		return mainMapper.insertJoin(mDTO);
	}
	//아이디찾기
	@Override
	public mainDTO getUserId(mainDTO mDTO) throws Exception {
		return mainMapper.getUserId(mDTO);
	}
	//이메일인증 수정
	@Override
	public int updateEmailConfirm(mainDTO mDTO) throws Exception {
		return mainMapper.updateEmailConfirm(mDTO);
	}
	//비밀번호 변경
	@Override
	public int updatePwEmailConfirm(mainDTO mDTO) throws Exception {
		return mainMapper.updatePwEmailConfirm(mDTO);
	}
	//비밀번호찾기
	@Override
	public mainDTO getUserPw(mainDTO mDTO) throws Exception {
		return mainMapper.getUserPw(mDTO);
	}
	//회원목록
		@Override
		public List<mainDTO> getUserList() throws Exception {
			return mainMapper.getUserList();
	}
	//회원상세
	@Override
	public mainDTO getUserDetail(String user_no) throws Exception {
		return mainMapper.getUserDetail(user_no);
	}
	//회원삭제
	@Override
	public int deleteUserInfo(mainDTO mDTO) throws Exception {
		return mainMapper.deleteUserInfo(mDTO);
	}
	//회원수정
	@Override
	public int updateUserInfo(mainDTO mDTO) throws Exception {
		return mainMapper.updateUserInfo(mDTO);
	}
	//아이디중복체크
	@Override
	public int getIdCheck(mainDTO mDTO) throws Exception {
		return mainMapper.getIdCheck(mDTO);
	}
	@Override
	public int getEmailCheck(mainDTO mDTO) throws Exception {
		return mainMapper.getEmailCheck(mDTO);
	}
		
}