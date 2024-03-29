package org.zerock.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.board.service.BoardReplyService;
import org.zerock.board.vo.BoardReplyVO;

import lombok.extern.log4j.Log4j;

// Ajax를 위한 컨트롤러 -> RestController
@RestController
@RequestMapping("/reply")
@Log4j
public class BoardReplyController {

	@Autowired
	@Qualifier("brs")
	private BoardReplyService service;
	
	//url - /reply/list.do?no=2461
	@GetMapping(value = "/list.do")
	public ResponseEntity<List<BoardReplyVO>> list(Long no){
		
		return new ResponseEntity<>(service.list(no), HttpStatus.OK);
	}
	
	//댓글 등록
	@PostMapping(value = "/write.do", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE, produces = { MediaType.TEXT_PLAIN_VALUE})  // MediaType.TEXT_PLAIN_VALUE text/plain 글자 그대로 보내겠다.
	public ResponseEntity<String> write(@RequestBody BoardReplyVO vo){
		
		log.info("write().vo : "+ vo);
		
		int writeCount = service.write(vo);
		
		log.info(writeCount);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	//댓글 수정
	@PatchMapping(value = "/update.do", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE, produces = { MediaType.TEXT_PLAIN_VALUE})  // MediaType.TEXT_PLAIN_VALUE text/plain 글자 그대로 보내겠다.
	public ResponseEntity<String> update(@RequestBody BoardReplyVO vo){
		
		log.info("update().vo : "+ vo);
		
		int updateCount = service.update(vo);
		
		log.info(updateCount);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	//댓글 수정
	@DeleteMapping(value = "/delete.do", produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(Long rno){
		
		log.info("delete().rno : "+ rno);
		
		int deleteCount = service.delete(rno);
		
		log.info(deleteCount);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
}
