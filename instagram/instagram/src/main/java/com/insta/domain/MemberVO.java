package com.insta.domain;

import lombok.Data;

@Data
public class MemberVO {
	
	private int m_idx;
	private String id;
	private String pw;
	private String profile_pic;
	private String email;
	private String loginType;
	private String name;
	private String bio;

}
