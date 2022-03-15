package com.klog.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.klog.domain.AttachVO;
import com.klog.domain.PostVO;

public interface PostService {

	// 22.03.12
	// 글 작성
	public int PostCreate(PostVO post, List<MultipartFile> article_file);
	// 글 목록
	public List<PostVO> postLoad(int m_idx);

	// 22.03.13
	// 글 수정
	public int PostEdit(PostVO post, List<MultipartFile> article_file);
	// 글 삭제
	public int PostDel(int p_idx);
	
	// 22.03.14
	// 글 첨부파일
	public List<AttachVO> attachList(List<PostVO> post);
	
}