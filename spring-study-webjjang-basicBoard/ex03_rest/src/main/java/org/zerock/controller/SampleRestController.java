package org.zerock.controller;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.board.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rest")
@Log4j
public class SampleRestController {
	
	// value : URL 매핑, produces = 리턴되어 지는 결과에 대한 설명
	@GetMapping(value = "/getText",produces = "text/plain; charset=UTF-8")
	public String getText() {
		
		//MediaType : 전달죄는 타입을 static final 변수로 만들어 놓은 객체 ->
		log.info("MIME TYPE : " + MediaType.TEXT_PLAIN_VALUE);
		
		return "안녕하세요";
	}
	
	// MediaType.APPLICATION_JSON_UTF8_VALUE - > json 데이터 지원 /rest/getBoard.json
	// MediaType.APPLICATION_XML_VALUE - > xml 데이터 지원 /rest/getBoard.xml
	@GetMapping(value = "/getBoard", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public BoardVO getBoard() {
		BoardVO vo = new BoardVO();
		
		vo.setNo(10L);
		vo.setTitle("test");
		vo.setContent("test");
		vo.setWriter("고승현");
		vo.setWriteDate(new Date());
		vo.setHit(50L);
		
		return vo;
	}
	
	@GetMapping(value = "/getList")
	public List<BoardVO> getList() {
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		BoardVO vo = new BoardVO();
		
		vo.setNo(10L);
		vo.setTitle("test");
		vo.setContent("test");
		vo.setWriter("고승현");
		vo.setWriteDate(new Date());
		vo.setHit(50L);
		
		list.add(vo);
		
		BoardVO vo2 = new BoardVO();
		
		vo2.setNo(9L);
		vo2.setTitle("aaa");
		vo2.setContent("aaa");
		vo2.setWriter("고승현");
		vo2.setWriteDate(new Date());
		vo2.setHit(20L);
		
		list.add(vo2);
		
		return list;
	}
	
	//ReponseEntity return
	@GetMapping(value = "/check")
	public ResponseEntity<BoardVO> check(Double height){
		BoardVO vo = new BoardVO();
		
		vo.setNo(10L);
		vo.setTitle("test");
		vo.setContent("test");
		vo.setWriter("고승현");
		vo.setWriteDate(new Date());
		vo.setHit(50L);
		
		//놀이 동산에서 키가 130이상이여야 놀이 기구를 탈수 있다.
		// 결과 데이터
		ResponseEntity<BoardVO> result = null;
		
		if(height < 130) result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		else result = new ResponseEntity<BoardVO>(vo, HttpStatus.OK);
		
		return result;
		
	}
}
