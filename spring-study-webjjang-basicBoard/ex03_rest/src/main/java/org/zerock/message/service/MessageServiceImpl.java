package org.zerock.message.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.message.mapper.MessageMapper;
import org.zerock.message.vo.MessageVO;

import com.webjjang.util.PageObject;

@Service
@Qualifier("mss")
public class MessageServiceImpl implements MessageService{

	// 자동 DI
	@Inject
	private MessageMapper mapper;

	@Override
	public List<MessageVO> list(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	@Override
	public int write(MessageVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public MessageVO view(Long no) {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	@Override
	public int viewRead(MessageVO vo) {
		// TODO Auto-generated method stub
		return mapper.viewRead(vo);
	}

	@Override
	public int delete(Long no) {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}
	
	
	
	

	
}
