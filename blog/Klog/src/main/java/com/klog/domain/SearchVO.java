package com.klog.domain;

import java.util.List;

import lombok.Data;

@Data
public class SearchVO {
	
	private List<PostVO> post;
	private List<MemberVO> member;

}
