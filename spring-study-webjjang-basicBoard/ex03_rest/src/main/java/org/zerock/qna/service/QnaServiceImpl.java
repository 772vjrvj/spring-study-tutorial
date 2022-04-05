package org.zerock.qna.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.qna.mapper.QnaMapper;
import org.zerock.qna.vo.QnaVO;

import com.webjjang.util.PageObject;

@Service
@Qualifier("qs")
public class QnaServiceImpl implements QnaService {
	
	@Inject
	private QnaMapper mapper;

	@Override
	public List<QnaVO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	@Override
	public Long getTotalRow(PageObject pageObject) {
		// TODO Auto-generated method stub
		return mapper.getTotalRow(pageObject);
	}

	@Override
	public int question(QnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.question(vo);
	}

	@Override
	public int answer(QnaVO vo) {
		// TODO Auto-generated method stub
		mapper.ordUpdate(vo);
		return mapper.answer(vo);
	}

	@Override
	public int update(QnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(Long no) {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}

	@Override
	public QnaVO view(Long no, Long inc) {
		if(inc == 1) mapper.increase(no);
		
		return mapper.view(no);
	}


	
	
}
