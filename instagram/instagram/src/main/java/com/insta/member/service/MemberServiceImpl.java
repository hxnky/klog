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
		mapper.register(vo);
		int result = mapper.CheckUser(vo.getEmail());
		System.out.println(mapper.CheckUser(vo.getEmail()));

		// 회원정보 중복 확인
		if (result == 1) {

			log.info("이미 있는 회원입니다.");
			result = 1;
		} else {
			mapper.register(vo);
			result = 0;
		}

		log.info("실행 결과 : " + result);
		System.out.println("회원가입 서비스 마지막 ");

		return result;
	}

}
