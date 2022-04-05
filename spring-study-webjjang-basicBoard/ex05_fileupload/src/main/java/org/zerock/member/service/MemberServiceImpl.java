package org.zerock.member.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.member.mapper.MemberMapper;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService{

	// 자동 DI
	@Inject
	private MemberMapper mapper;
	
	@Override
	public LoginVO login(LoginVO vo) {
		// TODO Auto-generated method stub
		return mapper.login(vo);
	}

	@Override
	public int write(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	
}
