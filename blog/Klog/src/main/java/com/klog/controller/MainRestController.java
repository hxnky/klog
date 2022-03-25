package com.klog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.klog.domain.AlarmVO;
import com.klog.domain.LetterReplyVO;
import com.klog.domain.LetterVO;
import com.klog.domain.MemberVO;
import com.klog.domain.NeighborVO;
import com.klog.domain.PostVO;
import com.klog.domain.SearchVO;
import com.klog.domain.SnsVO;
import com.klog.service.AlarmServiceImpl;
import com.klog.service.LetterServiceImpl;
import com.klog.service.MemberServiceImpl;
import com.klog.service.NeighborServiceImpl;
import com.klog.service.PostServiceImpl;
import com.klog.service.SearchServiceImpl;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class MainRestController {

	@Autowired
	private MemberServiceImpl service;

	@Autowired
	private PostServiceImpl postService;

	@Autowired
	private SearchServiceImpl searchService;

	@Autowired
	private NeighborServiceImpl followService;

	@Autowired
	private LetterServiceImpl letterService;

	@Autowired
	private AlarmServiceImpl AlarmService;

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

	

	

	@PostMapping("/user/SearchMyPost")
	public List<PostVO> SearchPost(String word, int m_idx) {

		System.out.println(word);
		System.out.println(m_idx);

		return searchService.SearchMyPost(word, m_idx);
	}

	@PostMapping("/user/SearchUser")
	public SearchVO SearchUser(String word) {

		return searchService.Searchuser(word);
	}

	@PostMapping("/user/FollowOk")
	public int FollowOk(int u_idx, int y_idx) {

		System.out.println("u_idx" + u_idx);
		System.out.println("y_idx" + y_idx);

		return followService.followChk(u_idx, y_idx);
	}

	@PostMapping("/user/FollowNo")
	public int FollowNo(int u_idx, int y_idx) {

		System.out.println("u_idx" + u_idx);
		System.out.println("y_idx" + y_idx);

		return followService.followEachDel(u_idx, y_idx);
	}

	@PostMapping("/user/FollowEach")
	public int FollowEach(int u_idx, int y_idx, String ment) {

		NeighborVO follow = new NeighborVO();

		follow.setU_idx(u_idx);
		follow.setY_idx(y_idx);
		follow.setMent(ment);

		System.out.println("follow" + follow);

		return followService.followChg(follow);
	}

	@PostMapping("/user/FollowDel")
	public int FollowDel(int u_idx, int y_idx) {

		System.out.println("u_idx" + u_idx);
		System.out.println("y_idx" + y_idx);

		return followService.followDel(u_idx, y_idx);
	}

	@PostMapping("/user/FollowChange")
	public int FollowChange(int u_idx, int y_idx) {

		System.out.println("u_idx" + u_idx);
		System.out.println("y_idx" + y_idx);

		return followService.followEachDel(u_idx, y_idx);
	}

	@PostMapping("/user/EachFollowDel")
	public int EachFollowDel(int u_idx, int y_idx) {

		System.out.println("u_idx" + u_idx);
		System.out.println("y_idx" + y_idx);

		return followService.followAllDel(u_idx, y_idx);
	}

	@PostMapping("/user/FollowStart")
	public int FollowStart(int u_idx, int y_idx) {

		System.out.println("u_idx" + u_idx);
		System.out.println("y_idx" + y_idx);

		return followService.follow(u_idx, y_idx);
	}

	@PostMapping("/user/EachFollowStart")
	public int EachFollowStart(int u_idx, int y_idx, String ment) {

		NeighborVO follow = new NeighborVO();

		follow.setU_idx(u_idx);
		follow.setY_idx(y_idx);
		follow.setMent(ment);

		return followService.followEach(follow);
	}

	@PostMapping("/user/LetterInsert")
	public int LetterInsert(int w_idx, int o_idx, String l_content) {

		LetterVO letter = new LetterVO();

		letter.setL_content(l_content);
		letter.setW_idx(w_idx);
		letter.setO_idx(o_idx);

		System.out.println(letter);

		return letterService.LetterInsert(letter);
	}

	@PostMapping("/user/LetterUpdate")
	public int LetterUpdate(int l_idx, String l_content) {

		System.out.println("l_idx" + l_idx);
		System.out.println("l_content" + l_content);

		return letterService.LetterUpdate(l_idx, l_content);
	}

	@PostMapping("/user/LetterDelete")
	public int LetterDelete(int l_idx) {

		return letterService.LetterDel(l_idx);
	}

	@PostMapping("/user/LetterReplyInsert")
	public int LetterReplyInsert(int l_idx, int rw_idx, int ro_idx, String lr_content) {

		LetterReplyVO reply = new LetterReplyVO();

		reply.setL_idx(l_idx);
		reply.setRo_idx(ro_idx);
		reply.setRw_idx(rw_idx);
		reply.setLr_content(lr_content);

		System.out.println("입력한 안부 답글 :::::" + reply);

		return letterService.LetterReplyInsert(reply);
	}

	@PostMapping("/user/LetterReplyUpdate")
	public int LetterReplyUpdate(int lr_idx, String lr_content) {

		return letterService.ReplyUpdate(lr_idx, lr_content);
	}

	@PostMapping("/user/LetterReplyDelete")
	public int LetterReplyDelete(int lr_idx) {

		return letterService.ReplyDel(lr_idx);
	}

	@PostMapping("/user/AlarmInsert")
	public int AlarmInsert(int ac_idx, int ar_idx, String type) {

		AlarmVO alarm = new AlarmVO();
		alarm.setAc_idx(ac_idx);
		alarm.setAr_idx(ar_idx);
		alarm.setType(type);

		System.out.println("알람 발생 :::::" + alarm);

		return AlarmService.AlarmInsert(alarm);
	}

	@PostMapping("/user/AlarmContentInsert")
	public int AlarmContentInsert(int ac_idx, int ar_idx, String type, String content) {

		AlarmVO alarm = new AlarmVO();
		alarm.setAc_idx(ac_idx);
		alarm.setAr_idx(ar_idx);
		alarm.setType(type);
		alarm.setContent(content);

		System.out.println("알람 발생 :::::" + alarm);

		return AlarmService.AlarmContentInsert(alarm);
	}

	@PostMapping("/user/AlarmList")
	public List<AlarmVO> AlarmList(int ar_idx) {

		return AlarmService.AlarmList(ar_idx);
	}

	@PostMapping("/user/PostScrap")
	public int PostScrap(int p_idx, int m_idx) {

		return postService.ScrapInsert(p_idx, m_idx);
	}

	@PostMapping("/user/ScrapDelete")
	public int ScrapDelete(int p_idx, int m_idx) {

		return postService.ScrapDel(p_idx, m_idx);
	}

}
