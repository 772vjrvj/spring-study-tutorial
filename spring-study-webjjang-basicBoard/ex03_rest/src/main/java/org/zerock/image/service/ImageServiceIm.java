package org.zerock.image.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.image.mapper.ImageMapper;
import org.zerock.image.vo.ImageVO;

import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("is")
@Log4j
public class ImageServiceIm implements ImageService {

	@Inject
	private ImageMapper mapper;
	
	@Override
	public List<ImageVO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		// 전체 데이터의 갯수 구하기 PageObject에 세팅한다.
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info(pageObject);
		// 데이터를 가져와서 리턴한다.
		return mapper.list(pageObject);
	}

	@Override
	public ImageVO view(ImageVO vo) {
		// TODO Auto-generated method stub
		return mapper.view(vo);
	}

	@Override
	public int write(ImageVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(ImageVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}
	
	@Override
	public int changeImage(ImageVO vo) {
		// TODO Auto-generated method stub
		return mapper.changeImage(vo);
	}

	@Override
	public int delete(ImageVO vo) {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}

	@Override
	public int like(ImageVO vo) {
		// TODO Auto-generated method stub
		return mapper.like(vo);
	}

	@Override
	public int likeCancel(ImageVO vo) {
		// TODO Auto-generated method stub
		return mapper.likeCancel(vo);
	}

	
	
	

}
