package com.klog.mapper;

import org.apache.ibatis.annotations.Param;

import com.klog.domain.MemberVO;

public interface MemberMapper {

	// 2022.03.08
	// 회원가입
	public void register(MemberVO member);

	// 이메일 체크
	public int EmailCheck(String email);

	// 이름 체크
	public int NameCheck(String m_name);

	// 22.03.09
	// 로그인
	public int Login(@Param("email") String email, @Param("password") String password);
	// 회원 인증 변경
	public void userVerify(String email);
	// 회원 인증 확인
	public String CheckVerify(String email);
	// 비밀번호 변경
	public void userPassword(String email, String password);

}