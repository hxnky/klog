package com.klog.domain;

import lombok.Data;

@Data
public class MemberVO {
	
	private int m_idx;
	private String email;
	private String password;
	private String m_name;
	private String verify;
	private String m_pic;
	private String bio;
	private String loginType;
	private String title;
	private String bgcolor;
	
}
