package com.health.service;

import java.util.List;

import com.health.DTO.mainDTO;

public interface IMainService {

	//로그인
	mainDTO getUserInfo(mainDTO mDTO) throws Exception; 
	//회원가입
	int insertJoin(mainDTO mDTO) throws Exception;
	//아이디찾기
	mainDTO getUserId(mainDTO mDTO) throws Exception;
	//이메일인증 수정
	int updateEmailConfirm(mainDTO mDTO) throws Exception;
	//비밀번호 변경
	int updatePwEmailConfirm(mainDTO mDTO) throws Exception;
	//비밀번호찾기
	mainDTO getUserPw(mainDTO mDTO) throws Exception;
	//회원목록
	List<mainDTO> getUserList() throws Exception;
	//회원상세
	mainDTO getUserDetail(String user_no) throws Exception;
	//회원삭제
	int deleteUserInfo(mainDTO uDTO) throws Exception;
	//회원수정
	int updateUserInfo(mainDTO mDTO) throws Exception;
	//아이디 중복체크
	int getIdCheck(mainDTO mDTO) throws Exception;
	//이메일 중복체크
	int getEmailCheck(mainDTO mDTO) throws Exception;
	

}