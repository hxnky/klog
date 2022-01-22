package com.insta.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insta.domain.RegVO;
import com.insta.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public int register(RegVO vo) {

		System.out.println("회원가입 서비스");
		System.out.println(vo);

		log.info("회원가입 서비스 시작");
		log.info("회원가입 정보 : " + vo);
		int result = 0;

		// 회원정보 중복 확인
		// 이메일 중복과 아이디 중복을 구분해야함
		if (mapper.CheckEmail(vo.getEmail()) == 1) {

			System.out.println("이메일 중복");
			result = 1;
		} else if (mapper.CheckID(vo.getId()) == 1) {
			System.out.println("아이디 중복");
			result = 2;
		} else {
			mapper.register(vo);
		}

		log.info("실행 결과 : " + result);
		System.out.println("회원가입 서비스 마지막 ");
		System.out.println(result);

		return result;
	}

}
