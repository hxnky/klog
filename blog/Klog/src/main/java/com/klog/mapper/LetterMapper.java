package com.klog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.klog.domain.LetterReplyVO;
import com.klog.domain.LetterVO;

public interface LetterMapper {
	
	// 22.03.20
	// 안부글 리스트 가져오기
	public List<LetterVO> letterList(int o_idx);
	// 안부글 작성
	public void letterInsert(LetterVO letter);
	// 안부글 수정
	public int letterUpdate(@Param("l_idx") int l_idx, @Param("l_content") String l_content);
	// 안부글 삭제
	public int letterDel(int l_idx);
	
	// 답글 리스트
	public List<LetterReplyVO> replyList(int l_idx);
	// 답글 작성
	public void ReplyInsert(LetterReplyVO reply);
	// 답글 수정
	public int ReplyUpdate(@Param("lr_idx") int lr_idx, @Param("lr_content") String lr_content);
	// 답글 삭제
	public int ReplyDel(int lr_idx);

}
