package com.klog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	//22.03.25
	// 글 정보 불러오기
	public PostVO PostLoadByPidx(int p_idx);
	// 스크랩 인서트
	public void ScrapInsert(PostVO post);
	// 스크랩 삭제
	public void ScrapDelete(@Param("p_idx") int p_idx,@Param("scrap_idx") int scrap_idx);
}