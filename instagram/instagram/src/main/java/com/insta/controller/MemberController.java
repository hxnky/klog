package com.insta.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insta.domain.MemberVO;
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
		
		return service.register(vo);

	}
	
	@PostMapping("/user/login")
	@ResponseBody
	public int login(MemberVO vo) {
		
		return service.login(vo);
	}
	
	@GetMapping("/TimeLine")
	public String TimeLine(@RequestParam String id, Model model) {
		
		System.out.println(id);
		model.addAttribute("user", service.loginById(id));
		System.out.println(service.loginById(id));
		
		return "insta/TimeLine";
	}
	
	@GetMapping("/findPw")
	public String findPw() {
		
		return "insta/findPw";
	}

	@PostMapping("/user/find")
	@ResponseBody
	public int findPwResult(String id) {
		
		return service.findPw(id);
	}
	
	@GetMapping("/user/RePw")
	public String RePassword() {
		
		return "insta/RePw";
	}
	
	@PostMapping("/user/RePw")
	@ResponseBody
	public int RecoveryPw(String pw, String id) {
		
		return service.RecoveryPw(pw, id);
	}
}
