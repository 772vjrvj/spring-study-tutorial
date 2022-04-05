package org.zerock.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.member.service.MemberService;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

// 자동 생성
// @Controller, @Service, @Repository, @Component, @RestController
@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	private final String MODULE = "member";
	
	//자동 DI
	@Autowired
	@Qualifier("ms")
	private MemberService service;
	// 리스트 - 관리자
	// 회원 정보보기
	// * 회원가입 폼
	@GetMapping("/write.do")
	public String writeForm() {
		return MODULE + "/write";
	}
	// * 회원가입 처리
	@PostMapping("/write.do")
	public String write(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		log.info("write().vo : " + vo);
		
		//파일 서버에 올리기
		vo.setPhoto(FileUtil.upload("/upload/" + MODULE, vo.getImageFile(), request));
		
		//DB에 데이터 쓰기
		service.write(vo);
		
		//메시지 처리 - 한번 만
		rttr.addFlashAttribute("msg", "축하드립니다. 회원가입이  되셨습니다.");
		
		return "redirect:/image/list.do";
	}
	
	// * 아이디 중복 체크 -> ajax 처리를 해서 /ajax URL 밑으로 만드는 것이 좋다. -> AjaxController

	// 회원수정 폼
	// 회원수정 처리
	// 회원 탈퇴
	// 회원 등급 수정 - 관리자(회원 등급 품 ~ 회원 리스트)
	// 회원 상태 변경 - 관리자(회원 등급 폼 ~ 회원 리스트)
	// * 로그인 폼 - 아이디, 비밀번호
	@GetMapping("/login.do")
	public String loginForm() {
		return MODULE + "/login";
	}
	// * 로그인 처리
	@PostMapping("/login.do")
	public String login(LoginVO vo, HttpSession session) throws Exception {
		log.info("login().vo : " + vo);
		
		// DB에서 입력한 정보에 맞는 데이터를 가져온다.
		LoginVO loginVO = service.login(vo);
		
		log.info("login().loginVO : " + loginVO);
		
		// loginVO가  null : 아이디와 비밀번호가 틀려서 데이터를 가져 올 수 없었다.
		if(loginVO == null) throw new Exception("아이디나 비밀번호를 확인해 주세요");
		
		session.setAttribute("login", loginVO);
		
		return "redirect:/image/list.do";
	}
	
	// * 로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		//로그아웃 처리
		session.removeAttribute("login");
		
		//메시지 처리 -한번 만
		rttr.addFlashAttribute("msg", "로그 아웃이 되셨습니다.");
		
		return "redirect:/image/list.do";
	}
	
	// 아이디 찾기
	// 비밀번호 찾기

}
