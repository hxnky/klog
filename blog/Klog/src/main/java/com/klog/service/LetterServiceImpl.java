package com.klog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klog.domain.LetterReplyVO;
import com.klog.domain.LetterVO;
import com.klog.mapper.LetterMapper;
import com.klog.mapper.MemberMapper;

@Service
public class LetterServiceImpl implements LetterService {

	@Autowired
	private LetterMapper mapper;

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public int LetterInsert(LetterVO letter) {
		int result = 0;

		mapper.letterInsert(letter);

		return result;
	}

	@Override
	public List<LetterVO> LetterList(int o_idx) {

		List<LetterVO> letter = mapper.letterList(o_idx);

		for (int i = 0; i < letter.size(); i++) {

			int m_idx = letter.get(i).getW_idx();

			letter.get(i).setMember(memberMapper.userInfoByIdx(m_idx));
		}

		System.out.println("안부글 리스트 ::::" + letter);

		return letter;
	}

	@Override
	public int LetterUpdate(int l_idx, String l_content) {

		int result = 0;

		if (mapper.letterUpdate(l_idx, l_content) == 1) {
			result = 1;
		}

		return result;
	}

	@Override
	public int LetterDel(int l_idx) {

		int result = 0;

		if (mapper.letterDel(l_idx) == 1) {
			result = 1;
		}

		return result;
	}

	@Override
	public int LetterReplyInsert(LetterReplyVO reply) {

		int result = 0;

		mapper.ReplyInsert(reply);

		return result;
	}

	@Override
	public List<LetterReplyVO> replyList(List<LetterVO> letterList) {

		List<LetterReplyVO> letterReplyList = new ArrayList<>();

		for (int i = 0; i < letterList.size(); i++) {
			int l_idx = letterList.get(i).getL_idx();
			System.out.println(mapper.replyList(l_idx));
			if (mapper.replyList(l_idx) != null) {
				letterReplyList.addAll(mapper.replyList(l_idx));
				for (int j = 0; j < letterReplyList.size(); j++) {
					int rw_idx = letterReplyList.get(j).getRw_idx();

					letterReplyList.get(j).setMemberInfo(memberMapper.userInfoByIdx(rw_idx));
				}

			}

		}
		System.out.println("답글 리스트 ::::" + letterReplyList);

		return letterReplyList;
	}

	@Override
	public int ReplyUpdate(int lr_idx, String lr_content) {

		int result = 0;

		if (mapper.ReplyUpdate(lr_idx, lr_content) == 1) {
			result = 1;
		}

		return result;
	}

	@Override
	public int ReplyDel(int lr_idx) {

		int result = 0;

		if (mapper.ReplyDel(lr_idx) == 1) {
			result = 1;
		}

		return result;
	}

}
