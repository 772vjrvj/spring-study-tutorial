package org.zerock.notice.service;

import java.util.List;

import org.zerock.board.vo.BoardReplyVO;
import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.PageObject;

public interface NoticeService {
	
	// 공지사항 리스트
	public List<NoticeVO> list(PageObject pageObject);
	
	// 공지사항 쓰기
	public NoticeVO view(Long no);
	
	// 공지사항 쓰기
	public int write(NoticeVO vo);
	
	// 공지사항 수정
	public int update(NoticeVO vo);
	
	// 공지사항 삭제
	public int delete(Long rno);
}
