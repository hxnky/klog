package com.klog.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AlarmVO {

	private int a_idx;
	private Date a_date;
	private String type;
	private int ac_idx;
	private int ar_idx;
	private String content;
	
	private MemberVO member;
}
