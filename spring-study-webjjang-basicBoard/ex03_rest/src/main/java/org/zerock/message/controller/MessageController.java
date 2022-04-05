package org.zerock.message.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.board.vo.BoardVO;
import org.zerock.image.vo.ImageVO;
import org.zerock.member.service.MemberService;
import org.zerock.member.vo.LoginVO;
import org.zerock.message.service.MessageService;
import org.zerock.message.vo.MessageVO;

import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/message")
@Log4j
public class MessageController {

	private final String MODULE = "message";
	
	
	@Autowired
	@Qualifier("mss")
	private MessageService service;
	
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model, HttpSession session) {
		log.info("--[메시지 리스트]---------------------");
				
		
		pageObject.setAccepter(((LoginVO) session.getAttribute("login")).getId());
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return MODULE + "/" + "list";
	}
	
	
	// 메시지쓰기 폼
	@GetMapping("/write.do")
	public String writeForm() {
		log.info("--[메시지 쓰기 폼]---------------------");
		return MODULE + "/" + "write";
	}
	
	// 메시지쓰기 처리
	@PostMapping("/write.do")
	public String write(MessageVO vo, HttpSession session, RedirectAttributes rttr) {

		vo.setSender((((LoginVO) session.getAttribute("login")).getId()));
		service.write(vo);
		
		
		// 게시판 리스트로 보낸다.
		rttr.addFlashAttribute("msg", "메시지를 보냈습니다.");
		return "redirect:list.do";
	}
	
	// 보기
	// 받은 사람이 로그인한 사람과 같아야 하고 (받은 메시지) 번호가 같고 받은 날자가 null인 메시지를(읽지 않은) 읽음 표시를 한다.(acceptDate를 현재 날짜로 넣어준다. - update)
	@GetMapping("/view.do")
	public String view(MessageVO vo, HttpSession session, @ModelAttribute PageObject pageObject, Model model ) {
		
		
		
		LoginVO login = (LoginVO) session.getAttribute("login");
		
		vo.setAccepter((login.getId()));
		
		service.viewRead(vo);
		
		MessageVO vvo = service.view(vo.getNo());

		//글 내용의 엔터를 <br>로 바꾸어야 보기를 할 떄 줄 바꿈이 된다.
		vvo.setContent(vvo.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("vo", vvo);
		model.addAttribute("login", login);
		return MODULE + "/view";
	}
	
	
	//detete 원래 운영때는 주는쪽 받는쪽 둘다 데이터 만들어야함 지금은 아님
	@GetMapping("/delete.do")
	public String delete(Long no, RedirectAttributes rttr) {
		log.info("--[게시판 글삭제]---------------------");
		
		service.delete(no);
		
		rttr.addFlashAttribute("msg", "메시지가 삭제 되였습니다.");
		
		// 글 리스트로 자동이동
		return "redirect:list.do";
	}
	
	
}
