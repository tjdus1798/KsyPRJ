package com.health.persistence.mapper;

import java.util.List;

import org.springframework.aop.ThrowsAdvice;

import com.health.DTO.mainDTO;
import com.health.config.Mapper;


@Mapper("MainMapper")
public interface MainMapper {
	//로그인
	public mainDTO getUserInfo(mainDTO mDTO);
	//회원가입
	public int insertJoin(mainDTO mDTO) throws Exception;
	//아이디찾기
	public mainDTO getUserId(mainDTO mDTO) throws Exception;
	//이메일인증 수정
	public int updateEmailConfirm(mainDTO mDTO) throws Exception;
	//비밀번호 변경
	public int updatePwEmailConfirm(mainDTO mDTO) throws Exception;
	//비밀번호찾기
	public mainDTO getUserPw(mainDTO mDTO) throws Exception;
	//회원목록
	public List<mainDTO> getUserList() throws Exception;
	//회원상세
	public mainDTO getUserDetail(String user_no) throws Exception;
	//회원삭제
	public int deleteUserInfo(mainDTO mDTO) throws Exception;
	//회원수정
	public int updateUserInfo(mainDTO mDTO) throws Exception;
	//아이디중복체크
	public int getIdCheck(mainDTO mDTO) throws Exception;
	//이메일중복체크
	public int getEmailCheck(mainDTO mDTO) throws Exception;
	
	

}