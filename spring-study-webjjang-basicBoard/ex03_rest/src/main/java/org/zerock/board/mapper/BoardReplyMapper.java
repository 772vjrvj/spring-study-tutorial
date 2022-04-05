package org.zerock.board.mapper;

import java.util.List;

import org.zerock.board.vo.BoardReplyVO;

public interface BoardReplyMapper {
	
	// 댓글 리스트
	public List<BoardReplyVO> list(Long no);
	
	// 댓글 쓰기
	public int write(BoardReplyVO vo);
	
	// 댓글 수정
	public int update(BoardReplyVO vo);
	
	// 댓글 삭제
	public int delete(Long rno);
}
