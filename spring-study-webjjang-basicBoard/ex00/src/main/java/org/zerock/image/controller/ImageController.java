package org.zerock.image.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

//자동으로 생성되게 하는 어노테이션
//Controller - url 관련, @Service - 처리, @Repository - DAO , @Component - 구성, @RestController - ul 관련 순서데이터
@Controller
@RequestMapping("/image")
@Log4j
public class ImageController {

	@GetMapping("/list")
	public void list() {
		log.info("--[이미지 게시판 리스트]----------------------------");
	}
	
	@GetMapping("/write")
	public void writeForm() {
		log.info("--[이미지 게시판 등록]----------------------------");
	}
	
	@PostMapping("/write")
	public String write() {
		log.info("--[이미지 게시판 리스트]----------------------------");
		return "redirect:list";
	}
	
}
