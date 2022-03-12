package com.klog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.klog.domain.MemberVO;
import com.klog.domain.PostVO;
import com.klog.domain.SnsVO;
import com.klog.service.MemberServiceImpl;
import com.klog.service.PostServiceImpl;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class MainRestController {

	@Autowired
	private MemberServiceImpl service;
	
	@Autowired
	private PostServiceImpl postService;

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
		log.info("이름 확인: " + m_name);

		return service.NameChekSev(m_name);
	}

	@PostMapping("/user/login")
	public int memberLogin(String email, String password) {

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


	@PostMapping(value = "/user/InfoChange", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int uploadAjaxPots(MultipartFile uploadFile, MemberVO member, SnsVO sns) {
		
		System.out.println("컨트롤러에서 받은 내용 ::::" + sns);
		
		// 사진 저장
		if(uploadFile != null) {
			String m_pic =  service.uploadImage(uploadFile, member.getM_picOrigin());
			member.setM_pic(m_pic);	
		}
		
		service.UserSocialChange(sns);

		return service.UserInfoChange(member);
	}
	
	@PostMapping("/user/postCreate")
	public int CreatePost(PostVO post) {
		
		System.out.println("글 내용 ::::" + post);
		
		return postService.PostCreate(post);
	}

}
