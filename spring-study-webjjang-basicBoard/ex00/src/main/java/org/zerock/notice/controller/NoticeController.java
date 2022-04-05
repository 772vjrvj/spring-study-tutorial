package org.zerock.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.board.vo.BoardVO;

import lombok.extern.log4j.Log4j;

//자동으로 생성되게 하는 어노테이션
//Controller - url 관련, @Service - 처리, @Repository - DAO , @Component - 구성, @RestController - ul 관련 순서데이터
@Controller
@RequestMapping("/notice")
@Log4j
public class NoticeController {

	private final String MODULE = "notice";
	
	// url별 메서드 작성
	
	// 게시판 리스트
	@GetMapping("/list.do")
	public String list() {
		log.info("--[공지 리스트]---------------------");
		// /WEB-INF/views + board + / + list +.jsp
		return MODULE + "/" + "list";
	}
	
	// 공지 글보기
	//글번호가 필요하다. request에서 꺼내는 방식(예전), 지금은 spring의 DispatcherServlet이 자동으로 매칭되는 것을 꺼내서 전달해 준다.
	@GetMapping("/view.do")
	public String view(Long no) {
		log.info("--[공지 글보기]---------------------");
		log.info(no);
		// /WEB-INF/views + board + / + view +.jsp
		return MODULE + "/" + "view";
	}
	
	// 공지 글쓰기 폼
	@GetMapping("/write.do")
	public String writeForm() {
		log.info("--[공지 글쓰기 폼]---------------------");
		// /WEB-INF/views + board + / + write +.jsp
		return MODULE + "/" + "write";
	}
	
	// 공지 글쓰기 처리
	@PostMapping("/write.do")
	public String write(BoardVO vo) {
		log.info("--[공지 글쓰기 처리]---------------------");
		log.info(vo);
		// 게시판 리스트로 보낸다.
		return "redirect:list.do";
	}
	
	// 공지 글수정 폼
	@GetMapping("/update.do")
	public String updateForm() {
		log.info("--[공지  수정 폼]---------------------");
		// /WEB-INF/views + board + / + update +.jsp
		return MODULE + "/" + "update";
	}
	
	// 공지 글수정 처리
	@PostMapping("/update.do")
	public String update() {
		log.info("--[공지 글 수정 처리]---------------------");
		// 공지 글 보기로 자동으로 이동
		return "redirect:view.do";
	}
	
	// 공지 게시판 글 삭제 - get방식이야 하는데 post넘기면 405번 오류가 난다.
	@GetMapping("/delete.do")
	public String delete() {
		log.info("--[공지 리스트]---------------------");
		// 공지 글 리스트로 자동이동
		return "redirect:list.do";
	}
}
