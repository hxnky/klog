package com.klog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.klog.domain.MemberVO;
import com.klog.domain.SnsVO;
import com.klog.service.MemberServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	
	@Autowired
	private MemberServiceImpl service;
	
	@GetMapping("/")
	public String loginPage() {
		
		log.info("블로그 로그인 화면");
		
		return "member/login";
	}
	
	@GetMapping("/user/verify")
	public String UserVerify() {
		
		return "member/verify";
	}
	
	@GetMapping("/user/password")
	public String UserPassword() {
		
		return "member/Repw";
	}
	
	@GetMapping("/mainPage/{email}")
	public String MainPage(@PathVariable(name = "email") String email, HttpSession session) {
		
		String UserEmail = email + ".com";
		MemberVO member = service.UserInfo(UserEmail);
		
		int m_idx = member.getM_idx();
		SnsVO social = service.UserSNS(m_idx);
		
		session.setAttribute("userInfo", member);
		session.setAttribute("social", social);

		
		return "member/main";
	}

}
