package com.klog.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class PostVO {
	
	private int p_idx;
	private String post_title;
	private String post_content;
	private Date post_Regtime;
	private Date post_updatetime;
	private String post_writer;
	private int m_idx;
	private List<String> AttachOrigin;
	
	private List<AttachVO> attach;

}
