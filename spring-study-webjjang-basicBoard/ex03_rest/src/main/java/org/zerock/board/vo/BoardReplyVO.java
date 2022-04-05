package org.zerock.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardReplyVO {

	private Long rno; //댓글 번호
	private Long no; //글번호 -FK
	private String content; //내용
	private String writer;  //작성자
	private Date writeDate; //작성일
	
}
