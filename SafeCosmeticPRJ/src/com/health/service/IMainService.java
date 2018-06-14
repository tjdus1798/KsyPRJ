package com.health.service;

import java.util.List;

import com.health.DTO.mainDTO;

public interface IMainService {

	//�α���
	mainDTO getUserInfo(mainDTO mDTO) throws Exception; 
	//ȸ������
	int insertJoin(mainDTO mDTO) throws Exception;
	//���̵�ã��
	mainDTO getUserId(mainDTO mDTO) throws Exception;
	//�̸������� ����
	int updateEmailConfirm(mainDTO mDTO) throws Exception;
	//��й�ȣ ����
	int updatePwEmailConfirm(mainDTO mDTO) throws Exception;
	//��й�ȣã��
	mainDTO getUserPw(mainDTO mDTO) throws Exception;
	//ȸ�����
	List<mainDTO> getUserList(int offset, int noOfRecords) throws Exception;
	//ȸ����
	mainDTO getUserDetail(String user_no) throws Exception;
	//ȸ������
	int deleteUserInfo(mainDTO uDTO) throws Exception;
	//ȸ������
	int updateUserInfo(mainDTO mDTO) throws Exception;
	//���̵� �ߺ�üũ
	int getIdCheck(mainDTO mDTO) throws Exception;
	//�̸��� �ߺ�üũ
	int getEmailCheck(mainDTO mDTO) throws Exception;
	
	int writeGetCount() throws Exception;
	

}