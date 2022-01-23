package com.insta.member.service;

import com.insta.domain.MemberVO;
import com.insta.domain.RegVO;

public interface MemberService {

	// 22.01.20
	public int register(RegVO vo);
	// 22.01.23
	public int login(MemberVO vo);
	public int findPw(String id);
	public int RecoveryPw(String pw, String id);
	public MemberVO loginById(String id);
}
