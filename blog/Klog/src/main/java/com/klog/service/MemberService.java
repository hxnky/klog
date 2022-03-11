package com.klog.service;

import org.springframework.web.multipart.MultipartFile;

import com.klog.domain.MemberVO;
import com.klog.domain.SnsVO;

public interface MemberService {

	// 22.03.08 
	//회원가입 서비스
	public int memberReg(MemberVO member);
	// 이메일 체크
	public int EmailCheckSev(String email);
	// 이름 체크
	public int NameChekSev(String m_name);
	//22.03.09
	// 로그인
	public int memberlogin(String email, String password);
	// 회원 인증
	public int UserVerify(String email);
	// 비밀번호 변경 메일
	public int PasswordMail(String email);
	// 비밀번호 변경
	public int UserPassword(String email, String password);
	//22.03.10
	// 유저 전체 정보 불러오기
	public MemberVO UserInfo(String email);
	// 유저 소셜 정보 불러오기
	public SnsVO UserSNS(int m_idx);
	//22.03.11
	// 오늘 날짜 경로 문자열로 생성
	public String getFolder();
	// 사진 DB에 업로드
	public String uploadImage(MultipartFile uploadFile);
	// 유저 정보 변경
	public int UserInfoChange(MemberVO member);
}
