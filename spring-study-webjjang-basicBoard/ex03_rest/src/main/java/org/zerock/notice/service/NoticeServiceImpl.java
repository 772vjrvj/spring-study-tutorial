package org.zerock.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.notice.mapper.NoticeMapper;
import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.PageObject;

@Service
@Qualifier("ns")
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeMapper mapper;

	@Override
	public List<NoticeVO> list(PageObject pageObject) {
		
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	@Override
	public int write(NoticeVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(NoticeVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(Long no) {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}

	@Override
	public NoticeVO view(Long no) {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}
	
	
	
}
