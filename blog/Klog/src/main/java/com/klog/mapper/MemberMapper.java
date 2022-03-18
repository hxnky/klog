package com.klog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.klog.domain.MemberVO;
import com.klog.domain.NeighborVO;
import com.klog.domain.SnsVO;

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
	public void userPassword(@Param("email") String email, @Param("password") String password);
	
	//22.03.10
	// 멤버 정보 출력
	public MemberVO userInfo(String email);
	// 멤버 정보 출력(idx)
	public MemberVO userInfoByIdx(int m_idx);
	// 유저 sns 정보 출력
	public SnsVO userSNS(int m_idx);
	// 회원가입 시 sns 정보도 같이 인서트
	public void regSns(int m_idx);
	
	// 22.03.11
	// 유저 정보 변경
	public void UserInfoChange(MemberVO member);
	
	//22.03.12
	// 유저 소셜 정보 변경
	public void UserSocialChange(SnsVO sns);
	
	
	
	
}
