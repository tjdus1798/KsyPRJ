package com.health.persistence.mapper;

import java.util.List;

import org.springframework.aop.ThrowsAdvice;

import com.health.DTO.mainDTO;
import com.health.config.Mapper;


@Mapper("MainMapper")
public interface MainMapper {
	//�α���
	public mainDTO getUserInfo(mainDTO mDTO);
	//ȸ������
	public int insertJoin(mainDTO mDTO) throws Exception;
	//���̵�ã��
	public mainDTO getUserId(mainDTO mDTO) throws Exception;
	//�̸������� ����
	public int updateEmailConfirm(mainDTO mDTO) throws Exception;
	//��й�ȣ ����
	public int updatePwEmailConfirm(mainDTO mDTO) throws Exception;
	//��й�ȣã��
	public mainDTO getUserPw(mainDTO mDTO) throws Exception;
	//ȸ�����
	public List<mainDTO> getUserList(int offset, int noOfRecords) throws Exception;
	//ȸ����
	public mainDTO getUserDetail(String user_no) throws Exception;
	//ȸ������
	public int deleteUserInfo(mainDTO mDTO) throws Exception;
	//ȸ������
	public int updateUserInfo(mainDTO mDTO) throws Exception;
	//���̵��ߺ�üũ
	public int getIdCheck(mainDTO mDTO) throws Exception;
	//�̸����ߺ�üũ
	public int getEmailCheck(mainDTO mDTO) throws Exception;
	
	public int writeGetCount() throws Exception;
	

}