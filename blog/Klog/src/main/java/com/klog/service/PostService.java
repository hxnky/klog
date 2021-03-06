package com.klog.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.klog.domain.AttachVO;
import com.klog.domain.PostVO;

public interface PostService {

	// 22.03.12
	// 글 작성
	public int PostCreate(PostVO post);
	// 글 목록
	public List<PostVO> postLoad(int m_idx);

	// 22.03.13
	// 글 수정
	public void PostEdit(PostVO post, List<MultipartFile> article_file);
	// 글 삭제
	public void PostDel(int p_idx);
	
	// 22.03.14
	// 글 첨부파일
	public List<AttachVO> attachList(List<PostVO> post);
	
	// 22.03.25
	// 스크랩
	public int ScrapInsert(int p_idx, int m_idx);
	// 스크랩 삭제
	public int ScrapDel(int p_idx, int scrap_idx);
	
	// 첨부파일 저장
	public void AttachInsert(AttachVO attach);
	// 첨부파일 목록
	public List<AttachVO> attachLists3(int p_idx);
	// 첨부파일 삭제
	public void attachDelete(String attach);
	// 첨부파일 이름
	public String FindnameByOrigin(String a_Origin);
	
}