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
	//�α���
	@Override
	public mainDTO getUserInfo(mainDTO mDTO) throws Exception {
		return mainMapper.getUserInfo(mDTO);
	}
	//ȸ������
	@Override
	public int insertJoin(mainDTO mDTO) throws Exception {
		return mainMapper.insertJoin(mDTO);
	}
	//���̵�ã��
	@Override
	public mainDTO getUserId(mainDTO mDTO) throws Exception {
		return mainMapper.getUserId(mDTO);
	}
	//�̸������� ����
	@Override
	public int updateEmailConfirm(mainDTO mDTO) throws Exception {
		return mainMapper.updateEmailConfirm(mDTO);
	}
	//��й�ȣ ����
	@Override
	public int updatePwEmailConfirm(mainDTO mDTO) throws Exception {
		return mainMapper.updatePwEmailConfirm(mDTO);
	}
	//��й�ȣã��
	@Override
	public mainDTO getUserPw(mainDTO mDTO) throws Exception {
		return mainMapper.getUserPw(mDTO);
	}
	//ȸ�����
		@Override
		public List<mainDTO> getUserList(int offset, int noOfRecords) throws Exception {
			return mainMapper.getUserList(offset,noOfRecords);
	}
	//ȸ����
	@Override
	public mainDTO getUserDetail(String user_no) throws Exception {
		return mainMapper.getUserDetail(user_no);
	}
	//ȸ������
	@Override
	public int deleteUserInfo(mainDTO mDTO) throws Exception {
		return mainMapper.deleteUserInfo(mDTO);
	}
	//ȸ������
	@Override
	public int updateUserInfo(mainDTO mDTO) throws Exception {
		return mainMapper.updateUserInfo(mDTO);
	}
	//���̵��ߺ�üũ
	@Override
	public int getIdCheck(mainDTO mDTO) throws Exception {
		return mainMapper.getIdCheck(mDTO);
	}
	//�̸����ߺ�üũ
	@Override
	public int getEmailCheck(mainDTO mDTO) throws Exception {
		return mainMapper.getEmailCheck(mDTO);
	}
	@Override
	public int writeGetCount() throws Exception {
		return  mainMapper.writeGetCount();
	}
		
}