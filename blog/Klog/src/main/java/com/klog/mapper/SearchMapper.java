package com.klog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.klog.domain.MemberVO;
import com.klog.domain.PostVO;

public interface SearchMapper {
	
	// 22.03.17
	// 내 글 검색
	public List<PostVO> Searchmypost(@Param("word") String word, @Param("m_idx") int m_idx);
	// 유저 검색
	public List<MemberVO> SearchMember(String word);
	// 유저 글 검색
	public List<PostVO> SearchPost(String word);
}
