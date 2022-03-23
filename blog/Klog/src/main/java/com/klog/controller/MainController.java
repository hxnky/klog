package com.klog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.klog.domain.AlarmVO;
import com.klog.domain.AttachVO;
import com.klog.domain.LetterReplyVO;
import com.klog.domain.LetterVO;
import com.klog.domain.MemberVO;
import com.klog.domain.NeighborVO;
import com.klog.domain.PostVO;
import com.klog.domain.SnsVO;
import com.klog.service.AlarmServiceImpl;
import com.klog.service.LetterServiceImpl;
import com.klog.service.MemberServiceImpl;
import com.klog.service.NeighborServiceImpl;
import com.klog.service.PostServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@Configuration
public class MainController {

	@Autowired
	private MemberServiceImpl service;

	@Autowired
	private PostServiceImpl postService;

	@Autowired
	private NeighborServiceImpl followService;

	@Autowired
	private LetterServiceImpl letterService;

	@Autowired
	private AlarmServiceImpl alarmService;

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

	// 메인(본인)페이지
	@GetMapping("/mainPage/{email}")
	public String MainPage(@PathVariable(name = "email") String email, HttpSession session, Model model) {

		String UserEmail = email + ".com";
		MemberVO member = service.UserInfo(UserEmail);

		int m_idx = member.getM_idx();
		SnsVO social = service.UserSNS(m_idx);

		// 글 작성 목록 불러오기
		List<PostVO> post = postService.postLoad(m_idx);
		List<AttachVO> attach = postService.attachList(post);
		System.out.println(post);

		// 이웃 목록 불러오기
		List<NeighborVO> neighbor = followService.neighborList(m_idx);
		// 서로이웃 신청목록 불러오기
		List<NeighborVO> followList = followService.neighborChk(m_idx);

		// 안부글 불러오기
		List<LetterVO> letterList = letterService.LetterList(m_idx);
		// 답글 불러오기
		List<LetterReplyVO> letterReplyList = letterService.replyList(letterList);

		session.setAttribute("userInfo", member);
		session.setAttribute("social", social);
		model.addAttribute("pageInfo", member);
		model.addAttribute("post", post);
		model.addAttribute("attach", attach);
		model.addAttribute("neighbor", neighbor);
		model.addAttribute("followList", followList);
		model.addAttribute("letterList", letterList);
		model.addAttribute("letterReplyList", letterReplyList);

		return "member/main";
	}

	// 유저(다른사람) 페이지
	@GetMapping("/userPage/{email}")
	public String UserPage(@PathVariable(name = "email") String email, HttpSession session, Model model) {

		System.out.println("세션" + session.getAttribute("userInfo"));

		String UserEmail = email + ".com";
		MemberVO member = service.UserInfo(UserEmail);

		int m_idx = member.getM_idx();
		SnsVO social = service.UserSNS(m_idx);

		// 글 작성 목록 불러오기
		List<PostVO> post = postService.postLoad(m_idx);
		List<AttachVO> attach = postService.attachList(post);

		// 이웃 목록 불러오기
		List<NeighborVO> neighbor = followService.neighborList(m_idx);
		// 서로이웃 신청목록 불러오기
		List<NeighborVO> followList = followService.neighborChk(m_idx);

		// 안부글 불러오기
		List<LetterVO> letterList = letterService.LetterList(m_idx);
		// 답글 불러오기
		List<LetterReplyVO> letterReplyList = letterService.replyList(letterList);
		// 알람 불러오기
		List<AlarmVO> AlarmList = alarmService.AlarmList(m_idx);

		model.addAttribute("pageSocial", social);
		model.addAttribute("pageInfo", member);
		model.addAttribute("post", post);
		model.addAttribute("attach", attach);
		model.addAttribute("neighbor", neighbor);
		model.addAttribute("followList", followList);
		model.addAttribute("letterList", letterList);
		model.addAttribute("letterReplyList", letterReplyList);
		model.addAttribute("AlarmList", AlarmList);

		return "member/user";
	}

	@GetMapping("/user/logout")
	public String Logout(HttpServletRequest request) {

		// session 변수 및 초기와
		HttpSession session = request.getSession();

		// 세션 전체를 무효화
		session.invalidate();

		return "redirect:/";

	}

	
}
