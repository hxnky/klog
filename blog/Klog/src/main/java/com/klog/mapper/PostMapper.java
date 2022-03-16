package com.klog.mapper;

import java.util.List;

import com.klog.domain.AttachVO;
import com.klog.domain.PostVO;

public interface PostMapper {
	// 22.03.12
	// 글 작성
	public void CreatePost(PostVO post);

	// 글 목록 불러오기
	public List<PostVO> LoadPost(int m_idx);
	
	// 22.03.13
	// 글 수정
	public void EditPost(PostVO post);
	// 글 삭제
	public boolean DelPost(int p_idx);
	
	// 22.03.14
	// 글 첨부파일
	public void CreateAttach(AttachVO attach);
	// p_idx 가져오기
	public int ListPostIdx();
	// 첨부파일 리스트
	public List<AttachVO> LoadAttach(int p_idx);
	// 첨부파일 삭제
	public void DeleteAttach(String a_Origin);
	// 글 삭제 시 첨부파일 삭제
	public void DeletePostAttach(int p_idx);
}