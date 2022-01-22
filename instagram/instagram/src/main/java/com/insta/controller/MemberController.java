package com.insta.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insta.domain.RegVO;
import com.insta.member.service.MemberServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

	@Autowired
	private MemberServiceImpl service;

	@GetMapping("/")
	public String MemberLogin() {

		log.info("로그인 화면 진입");

		return "insta/login";
	}

	@GetMapping("/reg")
	public String regPage() {

		return "insta/reg";
	}

	@PostMapping("/user/reg")
	@ResponseBody
	public int reg(RegVO vo) {
		
		log.info("회원가입 진행");
		log.info("입력된 정보 : " + vo);

		

		return service.register(vo);

	}

}
