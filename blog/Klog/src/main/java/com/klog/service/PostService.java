package com.klog.service;

import java.util.List;

import com.klog.domain.PostVO;

public interface PostService {

	// 22.03.12
	// 글 작성
	public int PostCreate(PostVO post);
	// 글 목록
	public List<PostVO> postLoad(int m_idx);

	// 22.03.13
	// 글 수정
	public int PostEdit(PostVO post);
	// 글 삭제
	public int PostDel(int p_idx);
}
