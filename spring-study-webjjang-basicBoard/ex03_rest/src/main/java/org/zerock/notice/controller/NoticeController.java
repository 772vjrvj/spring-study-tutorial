package org.zerock.notice.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.board.vo.BoardVO;
import org.zerock.notice.service.NoticeService;
import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

//자동으로 생성되게 하는 어노테이션
//Controller - url 관련, @Service - 처리, @Repository - DAO , @Component - 구성, @RestController - url과 ajax 관련  순서데이터
@Controller
@RequestMapping("/notice")
@Log4j
public class NoticeController {

	@Autowired
	@Qualifier("ns")
	private NoticeService service;
	
	private final String MODULE = "notice";
	
	// url별 메서드 작성
	
	// 게시판 리스트
	// Model - 처리된 데이터를 저장해서 JSP까지 전달하는 객체
	// PageObject - 페이지 처리를 위한 객체
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) {
		log.info("--[공지사항 리스트]---------------------");
		log.info("pageob : " + pageObject);
		
		
		List<NoticeVO> list = service.list(pageObject);
		
		model.addAttribute("list", list);
		model.addAttribute("pageObject", pageObject);
		// /WEB-INF/views + board + / + list +.jsp
		return MODULE + "/" + "list";
	}
	
	@GetMapping("/view.do")
	public String view(long no, @RequestParam(defaultValue = "0") int inc, 
			@ModelAttribute PageObject pageObject, Model model) {
		log.info("--[공지사항 글보기]---------------------");

		
		NoticeVO vo = service.view(no);
		vo.setContent(vo.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("vo",vo);
		
		return MODULE + "/" + "view";
	}
	
	// 공지사항 글쓰기 폼
	@GetMapping("/write.do")
	public String writeForm() {
		log.info("--[공지사항 글쓰기 폼]---------------------");
		// /WEB-INF/views + board + / + write +.jsp
		return MODULE + "/" + "write";
	}
	
	// 공지사항 쓰기
	@PostMapping("/write.do")
	public String write(NoticeVO vo, RedirectAttributes rttr) {
		log.info("--[공시항 쓰기 처리]---------------------");
		
		service.write(vo);
		// 공지사항 리스트로 보낸다.
		rttr.addFlashAttribute("msg", "공지사항이 등록 되셨습니다.");
		return "redirect:list.do";
	}
	

	// 게시판 글수정 폼
	@GetMapping("/update.do")
	public String updateForm(Long no, Model model, @ModelAttribute PageObject pageObject) {
		log.info("--[게시판 글 수정 폼]---------------------");
		
		
		NoticeVO noticeVO =  service.view(no);
		noticeVO.setStartDate(noticeVO.getStartDate().replace(".", "-"));
		noticeVO.setEndDate(noticeVO.getEndDate().replace(".", "-"));
		
		model.addAttribute("vo", noticeVO);
		
		return MODULE + "/" + "update";
	}
	
	
	// 공지사항 수정
	@PostMapping("/update.do")
	public String update(NoticeVO vo, RedirectAttributes rttr, PageObject pageObject) {
		log.info("--[공지사항 수정 처리]---------------------");
		
		int result = service.update(vo);
		log.info("수정 결과 result : " + result);
		
		rttr.addFlashAttribute("msg", "공지사항이 수정이 되였습니다.");
		
		// 글보기로 자동으로 이동
		return "redirect:view.do?no=" + vo.getNo() 
			+ "&page=" + pageObject.getPage()
			+ "&perPageNum=" + pageObject.getPerPageNum();
	}
	
	@GetMapping("/delete.do")
	public String delete(Long no, RedirectAttributes rttr, PageObject pageObject) {
		log.info("--[공지사항 삭제]---------------------");
		int result = service.delete(no);
		log.info("삭제 결과 result : " + result);
		
		rttr.addFlashAttribute("msg", "공지사항이 삭제 되였습니다.");
		
		// 글보기로 자동으로 이동
		return "redirect:list.do";
	}
	
	
	
}
