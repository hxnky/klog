package com.klog.service;

import java.util.List;

import com.klog.domain.PostVO;
import com.klog.domain.SearchVO;

public interface SearchService {
	
	//22.03.17
	// 내 글 검색
	public List<PostVO> SearchMyPost(String word, int m_idx);
	// 유저 및 유저 글 검색
	public SearchVO Searchuser(String word);

}
