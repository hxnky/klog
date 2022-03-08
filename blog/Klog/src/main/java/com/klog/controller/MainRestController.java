package com.klog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.klog.domain.MemberVO;
import com.klog.service.MemberServiceImpl;

@Controller
public class MainRestController {
	
	@Autowired
	private MemberServiceImpl service;
	
	@PostMapping("/user/reg")
	@ResponseBody
	public int memberReg(MemberVO member) {
		
		return service.memberReg(member);
	}

}
