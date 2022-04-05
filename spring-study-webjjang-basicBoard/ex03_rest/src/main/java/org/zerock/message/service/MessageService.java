package org.zerock.message.service;

import java.util.List;

import org.zerock.image.vo.ImageVO;
import org.zerock.message.vo.MessageVO;

import com.webjjang.util.PageObject;

public interface MessageService {

	public List<MessageVO> list(PageObject pageObject);
	
	public int write(MessageVO vo);
	
	public MessageVO view(Long no);
	
	public int viewRead(MessageVO vo);
	
	// 삭제
	public int delete(Long no);
}
