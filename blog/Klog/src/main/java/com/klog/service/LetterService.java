package com.klog.service;

import java.util.List;

import com.klog.domain.LetterReplyVO;
import com.klog.domain.LetterVO;

public interface LetterService {
	
	// 22.03.20
	// 안부글 작성
	public int LetterInsert(LetterVO letter);
	// 안부글 리스트
	public List<LetterVO> LetterList(int o_idx);
	// 안부글 수정
	public int LetterUpdate(int l_idx, String l_content);
	// 안부글 삭제
	public int LetterDel(int l_idx);
	
	// 답글 작성
	public int LetterReplyInsert(LetterReplyVO reply);
	// 답글 리스트
	public List<LetterReplyVO> replyList(List<LetterVO> letterList);
	// 답글 수정
	public int ReplyUpdate(int lr_idx, String lr_content);
	// 답글 삭제
	public int ReplyDel(int lr_idx);

}
