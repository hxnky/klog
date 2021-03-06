package com.klog.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.klog.domain.MemberVO;
import com.klog.domain.SnsVO;
import com.klog.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private MailSenderService mailService;

	@Override
	public int memberReg(MemberVO member) {

		int result = 0;
		System.out.println(member);

		log.info("회원가입 서비스");
		mapper.register(member);

		// 인증 메일
		mailService.memberVerify(member);

		// sns 정보 삽입
		String email = member.getEmail();
		member = mapper.userInfo(email);
		mapper.regSns(member.getM_idx());

		return result;
	}

	@Override
	public int EmailCheckSev(String email) {

		int result = mapper.EmailCheck(email);

		return result;
	}

	@Override
	public int NameChekSev(String m_name) {

		int result = mapper.NameCheck(m_name);

		return result;
	}

	@Override
	public int memberlogin(String email, String password) {

		System.out.println(email + password);
		int result = mapper.Login(email, password);

		return result;
	}

	@Override
	public int UserVerify(String email) {

		System.out.println(email);

		int result = 0;

		String verify = mapper.CheckVerify(email);
		System.out.println(verify);

		if (verify.equals("N")) {
			mapper.userVerify(email);
			result = 1;
		}

		return result;
	}

	@Override
	public int PasswordMail(String email) {

		return mailService.PwSend(email);
	}

	@Override
	public int UserPassword(String email, String password) {

		int result = 0;

		mapper.userPassword(email, password);

		return result;
	}

	@Override
	public MemberVO UserInfo(String email) {

		MemberVO member = new MemberVO();

		member = mapper.userInfo(email);
		System.out.println("서비스 멤버" + member);

		return member;
	}

	@Override
	public SnsVO UserSNS(int m_idx) {
		System.out.println(m_idx);
		SnsVO sns = new SnsVO();

		sns = mapper.userSNS(m_idx);
		System.out.println(sns);

		return sns;
	}

	@Override
	public String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}


	@Override
	public int UserInfoChange(MemberVO member) {

		System.out.println("멤버 내용 확인 :::" + member);

		mapper.UserInfoChange(member);

		return 0;
	}

	@Override
	public int UserSocialChange(SnsVO sns) {

		System.out.println(sns);

		mapper.UserSocialChange(sns);

		return 0;
	}

	@Override
	public MemberVO memberInfoByIdx(int m_idx) {

		return mapper.userInfoByIdx(m_idx);
	}

}
