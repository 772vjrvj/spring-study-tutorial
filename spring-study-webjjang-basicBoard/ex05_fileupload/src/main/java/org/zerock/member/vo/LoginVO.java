package org.zerock.member.vo;

import lombok.Data;

// 아이디, 비밀번호, 이름, 등급번호, 사진이름
@Data
public class LoginVO {
	
	private String id;
	private String pw;
	private String name;
	private int gradeNo;
	private String photo;
}
