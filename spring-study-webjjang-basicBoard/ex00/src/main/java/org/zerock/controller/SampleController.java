package org.zerock.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

//자동으로 생성이 되게 하는 어노테이션
//Controller - url 관련, @Service - 처리, @Repository - DAO , @Component - 구성, @RestController - url과 ajax 관련  순서데이터
@Controller
@Log4j
public class SampleController {

	// 업로드 폼 -> /WEB-INF/views/exUpload.jsp로 forward 된다.
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUpload.............");
	}
	
	
	@PostMapping("/exUploadPost")
	//업로드 처리 - 파일 여러개를 전달 받으려면 배열 구조의 객체를 파라메터로 선언한다.
	public void exUploadPost(ArrayList<MultipartFile> files) {
		
		// 넘어온 파일의 정보를 출력
		// forEach(람다식) : files의 데이터를 한 개씩 꺼내서 file에 저장해서 실행 처리하는 함수
		// 정보만 출력을 하고 저장하지 않는다. 저장을 하려면 저장하려는 File 객체를 만들고 file.transferTo(file객체)
		files.forEach(file -> {
			log.info("-----------------------------------");
			log.info("name :" + file.getOriginalFilename());
			log.info("size :" + file.getSize()); 
		});
	}
}
