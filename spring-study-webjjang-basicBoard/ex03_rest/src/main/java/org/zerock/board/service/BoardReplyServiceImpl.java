package org.zerock.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.board.mapper.BoardReplyMapper;
import org.zerock.board.vo.BoardReplyVO;

@Service
@Qualifier("brs")
public class BoardReplyServiceImpl implements BoardReplyService {
	
	@Inject
	private BoardReplyMapper mapper;

	@Override
	public List<BoardReplyVO> list(Long no) {
		// TODO Auto-generated method stub
		return mapper.list(no);
	}

	@Override
	public int write(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(Long rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}
	

}
