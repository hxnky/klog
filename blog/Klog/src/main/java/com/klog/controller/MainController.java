package com.klog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	
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

}
