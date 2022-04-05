package org.zerock.message.vo;

import lombok.Data;

@Data
public class MessageVO {
	private long no;
	private String content;
	private String sender;
	private String senderName;
	private String sendDate;
	private String accepter;
	private String accepterName;
	private String acceptDate;
	
}
