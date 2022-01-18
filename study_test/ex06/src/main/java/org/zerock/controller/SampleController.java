package org.zerock.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/sample/*")
public class SampleController {

	@GetMapping("/all")
	public void doAll() {
		log.info("모든 사람 허용");
	}
	
	@GetMapping("/member")
	public void doMember() {
		
		log.info("멤버들만 허용");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("관리자만 허용");
	}
	
}
