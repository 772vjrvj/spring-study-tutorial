package org.zerock.qna.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.zerock.member.vo.LoginVO;
import org.zerock.qna.service.QnaService;
import org.zerock.qna.vo.QnaVO;

import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

//자동으로 생성되게 하는 어노테이션
//Controller - url 관련, @Service - 처리, @Repository - DAO , @Component - 구성, @RestController - url과 ajax 관련  순서데이터
@Controller
@RequestMapping("/qna")
@Log4j
public class QnaController {

	@Autowired
	@Qualifier("qs")
	private QnaService service;
	
	private final String MODULE = "qna";
	
	// url별 메서드 작성
	
	// 게시판 리스트
	// Model - 처리된 데이터를 저장해서 JSP까지 전달하는 객체
	// PageObject - 페이지 처리를 위한 객체
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) {
		log.info("--[Q&A 리스트]---------------------");
		log.info("pageob : " + pageObject);
		
		
		List<QnaVO> list = service.list(pageObject);
		
		model.addAttribute("list", list);
		model.addAttribute("pageObject", pageObject);
		// /WEB-INF/views + board + / + list +.jsp
		return MODULE + "/" + "list";
	}
	
	@GetMapping("/view.do")
	public String view(long no, @RequestParam(defaultValue = "0") Long inc, 
			@ModelAttribute PageObject pageObject, Model model, HttpSession session) {
		log.info("--[Q&A 글보기]---------------------");

		LoginVO loginVO = (LoginVO)session.getAttribute("login");
		
		QnaVO vo = service.view(no, inc);
		vo.setContent(vo.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("login", loginVO);
		model.addAttribute("vo",vo);
		
		return MODULE + "/" + "view";
	}
	
	// Q&A 질문 폼
	@GetMapping("/question.do")
	public String question() {
		log.info("--[Q&A 질문 폼]---------------------");

		return MODULE + "/" + "question";
	}
	
	// Q&A 질문 폼
	@PostMapping("/question.do")
	public String question(QnaVO vo, RedirectAttributes rttr, HttpSession session) {
		log.info("--[Q&A 질문 폼]---------------------");
		
		String id = ((LoginVO) session.getAttribute("login")).getId();
		vo.setId(id);
		
		service.question(vo);
		rttr.addFlashAttribute("msg", "Q&A 질문이 등록 되셨습니다.");
		return "redirect:list.do";
	}
	
	// Q&A 답변
	@GetMapping("/answer.do")
	public String answer(Long no, Model model) {
		log.info("--[Q&A 답변 처리]---------------------");

		QnaVO vo = service.view(no, 0L);
//		vo.setContent(vo.getContent().replaceAll("\n", "<br>"));
		model.addAttribute("vo",vo);
		
		return MODULE + "/" + "answer";
	}
	
	// Q&A 답변
	@PostMapping("/answer.do")
	public String answer(QnaVO vo, RedirectAttributes rttr, HttpSession session) {
		log.info("--[Q&A 답변 처리]---------------------");
		
		String id = ((LoginVO) session.getAttribute("login")).getId();
		vo.setId(id);
		vo.setOrdNo(vo.getOrdNo() + 1);
		vo.setLevNo(vo.getLevNo() + 1);
		vo.setParentNo(vo.getNo());
		
		service.answer(vo);
		// Q&A 리스트로 보낸다.
		rttr.addFlashAttribute("msg", "Q&A 답변이 등록 되셨습니다.");
		return "redirect:list.do";
	}
	

	// 게시판 글수정 폼
	@GetMapping("/update.do")
	public String updateForm(Long no, Model model, @ModelAttribute PageObject pageObject) {
		log.info("--[Q&A 수정 폼]---------------------");
		
		QnaVO QnaVO =  service.view(no, 0L);

		model.addAttribute("vo", QnaVO);
		
		return MODULE + "/" + "update";
	}
	
	
	// Q&A 수정
	@PostMapping("/update.do")
	public String update(QnaVO vo, RedirectAttributes rttr, PageObject pageObject) {
		log.info("--[Q&A 수정 처리]---------------------");
		
		int result = service.update(vo);
		log.info("수정 결과 result : " + result);
		
		rttr.addFlashAttribute("msg", "Q&A 수정이 되였습니다.");
		
		// 글보기로 자동으로 이동
		return "redirect:view.do?no=" + vo.getNo() 
			+ "&page=" + pageObject.getPage()
			+ "&perPageNum=" + pageObject.getPerPageNum();
	}
	
	@GetMapping("/delete.do")
	public String delete(Long no, RedirectAttributes rttr, PageObject pageObject) {
		log.info("--[Q&A 삭제]---------------------");
		int result = service.delete(no);
		log.info("삭제 결과 result : " + result);
		
		rttr.addFlashAttribute("msg", "Q&A이 삭제 되였습니다.");
		
		// 글보기로 자동으로 이동
		return "redirect:list.do";
	}
	
	
	
}
