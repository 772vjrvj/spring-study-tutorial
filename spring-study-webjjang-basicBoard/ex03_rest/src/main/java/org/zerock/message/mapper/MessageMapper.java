package org.zerock.message.mapper;

import java.util.List;

import org.zerock.message.vo.MessageVO;

import com.webjjang.util.PageObject;

public interface MessageMapper {

	public List<MessageVO> list(PageObject pageObject);
	
	public Long getTotalRow(PageObject pageObject);
	
	public int write(MessageVO vo);
	
	public MessageVO view(Long no);
	
	public int viewRead(MessageVO vo);
	
	// 삭제
	public int delete(Long no);
}
