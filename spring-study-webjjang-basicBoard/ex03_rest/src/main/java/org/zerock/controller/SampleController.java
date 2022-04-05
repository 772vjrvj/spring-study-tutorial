package org.zerock.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.board.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample")
@Log4j
public class SampleController {

	@GetMapping("/ex06")
	// @ResponseBody - return 정보가 forward 정보가 아니고 순수한 데이터 입니다. xml, json 데이터로 전달
	// /ex06, /ex06.xml -> xml 데이터가 만들어져서 전송. /ex.06.json -> json 데이터가 만들어져서 전송
	public @ResponseBody BoardVO ex06() {
		
		log.info("/ex06 ..........");
		
		BoardVO vo = new BoardVO();
		
		vo.setNo(10L);
		vo.setTitle("test");
		vo.setContent("test");
		vo.setWriter("lee");
		vo.setWriteDate(new Date());
		vo.setHit(50L);
		
		return vo;
	}
	
}
