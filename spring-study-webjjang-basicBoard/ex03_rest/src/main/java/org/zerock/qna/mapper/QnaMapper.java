package org.zerock.qna.mapper;

import java.util.List;

import org.zerock.qna.vo.QnaVO;

import com.webjjang.util.PageObject;

public interface QnaMapper {
	
	// Q&A 리스트
	public List<QnaVO> list(PageObject pageObject);
	
	// Q&A 전체 갯수
	public Long getTotalRow(PageObject pageObject);
	
	// Q&A 질문
	public int question(QnaVO vo);
	
	// Q&A 답변
	public int answer(QnaVO vo);
	
	// Q&A 글수정
	public int update(QnaVO vo);
	
	// Q&A 글수정
	public int ordUpdate(QnaVO vo);
	
	// Q&A 글삭제
	public int delete(Long no);
	
	// Q&A 보기
	public QnaVO view(Long no);
	
	public int increase(Long no);
	
}
