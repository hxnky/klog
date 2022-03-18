package com.klog.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NeighborVO {
	
	private int n_idx;
	private int u_idx;
	private int y_idx;
	private String eachother;
	private String ment;
	private String n_check;
	private Date n_date;
	
	private MemberVO member;
}
