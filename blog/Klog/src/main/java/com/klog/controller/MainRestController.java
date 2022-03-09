package com.klog.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.klog.domain.MemberVO;
import com.klog.service.MemberServiceImpl;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class MainRestController {
	
	@Autowired
	private MemberServiceImpl service;
	
	@PostMapping("/user/reg")
	public int memberReg(MemberVO member) {
		
		return service.memberReg(member);
	}
	
	@PostMapping("/user/EmailCheck")
	public int EmailCheck(@RequestParam("email") String email) {
		log.info("이메일 확인" + email);
		
		return service.EmailCheckSev(email);
	}
	
	@PostMapping("/user/NameCheck")
	public int NameCheck(@RequestParam("m_name") String m_name) {
		log.info("이름 확인: "+ m_name);
		
		return service.NameChekSev(m_name);
	}
	
	@PostMapping("/user/login")
	public int memberLogin(String email,String password) {
		
		return service.memberlogin(email, password);
	}
	
	@PostMapping("/user/verifyes")
	public int ChangeVeridy(String email) {
		
		return service.UserVerify(email);
	}
	
	@PostMapping("/user/ChangePwMail")
	public int ChangePasswordMail(String email) {
		
		return service.PasswordMail(email);
	}
	
	@PostMapping("/user/ChangePw")
	public int ChangePassword(String email, String password) {
		
		return service.UserPassword(email, password);
	}

}