package org.zerock.member.mapper;

import java.util.List;

import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.PageObject;

public interface MemberMapper {

	// 리스트 - 관리자
	public List<MemberVO> list(PageObject pageObject);
	
	//전체 회원수
	public Long getTotalRow(PageObject pageObject);
	
	// 회원 정보보기
	public MemberVO view(String id);
	
	// * 회원가입 처리
	public int write(MemberVO vo);
	
	// * 아이디 중복 체크
	public String idCheck(String vo);
	
	
	// 회원수정 처리
	
	// 회원 탈퇴
	
	// 회원 등급 수정 - 관리자(회원 등급 품 ~ 회원 리스트)
	public int gradeModify(MemberVO vo);
	
	// 회원 상태 변경 - 관리자(회원 등급 폼 ~ 회원 리스트)
	
	// * 로그인 처리 - session을 이용한다.
	public LoginVO login(LoginVO vo);
	// 아이디 찾기
	// 비밀번호 찾기
	
}
