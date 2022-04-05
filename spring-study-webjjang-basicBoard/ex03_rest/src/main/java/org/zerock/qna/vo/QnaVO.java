package org.zerock.qna.vo;

import lombok.Data;

@Data
public class QnaVO {
	
	private Long no;
	private String title;
	private String content;
	private String id;
	private String name;
	private String writeDate;
	private Long hit;
	private Long refNo;
	private Long ordNo;
	private Long levNo;
	private Long parentNo;

}
