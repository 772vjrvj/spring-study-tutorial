package org.zerock.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.member.mapper.MemberMapper;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.PageObject;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService{

	// 자동 DI
	@Inject
	private MemberMapper mapper;
	
	@Override
	public List<MemberVO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	@Override
	public LoginVO login(LoginVO vo) {
		// TODO Auto-generated method stub
		return mapper.login(vo);
	}

	@Override
	public String idCheck(String id){
		return mapper.idCheck(id);
	}
	
	
	@Override
	public int write(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int gradeModify(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.gradeModify(vo);
	}

	@Override
	public MemberVO view(String id) {
		// TODO Auto-generated method stub
		return mapper.view(id);
	}
	
	
	

	
}
