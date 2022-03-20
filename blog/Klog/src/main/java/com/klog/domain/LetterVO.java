package com.klog.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LetterVO {
	
	private int l_idx;
	private int w_idx;
	private int o_idx;
	private Date l_time;
	private String l_content;
	private MemberVO member;	// w_idx의 정보를 가져와야한다.
}
