package org.zerock.image.service;

import java.util.List;

import org.zerock.image.vo.ImageVO;

import com.webjjang.util.PageObject;

public interface ImageService {

	// 리스트
	public List<ImageVO> list(PageObject pageObject);
	
	// 보기
	public ImageVO view(Long no);

	// 등록
	public int write(ImageVO vo);
	
	// 수정
	public int update(ImageVO vo);
	
	// 사진 수정
	public int changeImage(ImageVO vo);
	
	// 삭제
	public int delete(ImageVO vo);
}
