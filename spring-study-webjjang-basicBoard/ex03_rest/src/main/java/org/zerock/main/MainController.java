package org.zerock.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.board.service.BoardServiceImpl;
import org.zerock.board.vo.BoardVO;
import org.zerock.image.service.ImageService;
import org.zerock.image.vo.ImageVO;
import org.zerock.notice.service.NoticeService;
import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@Log4j
public class MainController {

	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	@Qualifier("is")
	private ImageService imageService;
	
	@Autowired
	@Qualifier("ns")
	private NoticeService noticeService;
	
	
	private final String MODULE = "main";
	

	@GetMapping("/main.do")
	public String list(PageObject pageObject, Model model) {
		log.info("pageob : " + pageObject);
		
		pageObject.setPerPageNum(7);
		
		List<BoardVO> boardList = boardService.list(pageObject);
		List<NoticeVO> noticeList = noticeService.list(pageObject);
		pageObject.setPerPageNum(4);
		List<ImageVO> imageList = imageService.list(pageObject);
		
		log.info("boardList : " + boardList);
		log.info("noticeList : " + noticeList);
		log.info("imageList : " + imageList);
		
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("imageList", imageList);
		// /WEB-INF/views + board + / + list +.jsp
		return MODULE + "/" + "main";
	}
}
