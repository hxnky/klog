package com.klog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klog.domain.MemberVO;
import com.klog.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public int memberReg(MemberVO member) {
		
		int result = 0;
		System.out.println(member);

		log.info("회원가입 서비스");
		mapper.register(member);

		return result;
	}

}
