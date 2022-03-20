package com.klog.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LetterReplyVO {
	
	private int lr_idx;
	private int rw_idx;
	private int ro_idx;
	private String lr_content;
	private Date lr_time;
	private int l_idx;
	private MemberVO memberInfo;

}
