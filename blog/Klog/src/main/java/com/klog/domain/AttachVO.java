package com.klog.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AttachVO {
	
	private int a_idx;
	private int p_idx;
	private String a_name;
	private Date a_regDate;
	private long a_size;
	private String a_Origin;

}
