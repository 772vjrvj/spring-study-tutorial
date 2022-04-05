package org.zerock.notice.mapper;

import java.util.List;

import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.PageObject;

public interface NoticeMapper {
	
	// 공지사항 리스트
	public List<NoticeVO> list(PageObject pageObject);
	
	// 공지사항 전체 갯수
	public Long getTotalRow(PageObject pageObject);
	
	// 공지사항 글쓰기
	public int write(NoticeVO vo);
	
	// 공지사항 글수정
	public int update(NoticeVO vo);
	
	// 공지사항 글삭제
	public int delete(Long no);
	
	// 공지사항 글삭제
	public NoticeVO view(Long no);
}
