package com.klog.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.klog.domain.AttachVO;
import com.klog.domain.MemberVO;
import com.klog.domain.PostVO;
import com.klog.domain.SnsVO;
import com.klog.service.MemberService;
import com.klog.service.PostService;
import com.klog.service.S3Util;
import com.klog.service.UploadFileUtils;

@RestController
public class S3Controller {

	private String bucketName = "klogpicture"; // 버킷 이름

	S3Util s3 = new S3Util();

	@Autowired
	private MemberService service;
	@Autowired
	private PostService postService;

	@PostMapping(value = "/user/InfoChange", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int uploadAjaxPots(MultipartFile uploadFile, MemberVO member, SnsVO sns) throws IOException, Exception {

		System.out.println("컨트롤러에서 받은 내용 ::::" + sns);
		System.out.println(member);
		System.out.println(uploadFile);

		// 프로필 이미지의 추가경로
		String uploadpath = "UserImage";
		String fileName = member.getM_picOrigin();

		System.out.println("원래 사진 이름 : " + fileName);
		int result = 0;

		if (uploadFile.isEmpty()) {
			System.out.println("정보만 변경");
			String user_imgPath = fileName;
			member.setM_pic(user_imgPath);
			result = service.UserInfoChange(member);

		} else {

			ResponseEntity<String> img_path = new ResponseEntity<>(
					UploadFileUtils.uploadFile(uploadpath, uploadFile.getOriginalFilename(), uploadFile.getBytes()),
					HttpStatus.CREATED);

			String user_imgPath = (String) img_path.getBody();

			System.out.println(user_imgPath);
			member.setM_pic(user_imgPath);
			result = service.UserInfoChange(member);
			System.out.println("사진 변경");
			System.out.println("원래 사진 이름 : " + fileName);
			// S3에 있는 원래 사진 삭제
			if (fileName.equals("/profile.png")) {
				System.out.println("프로필사진임");
			} else {
				try {
					s3.fileDelete(bucketName, uploadpath + fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}

				new File(uploadpath + fileName.replace('/', File.separatorChar)).delete();

				System.out.println("원래 사진 삭제");
			}
		}
		System.out.println(result);
		return result;
	}

	@PostMapping("/user/postCreate")
	public int CreatePost(PostVO post, List<MultipartFile> article_file) throws IOException, Exception {

		int result = 0;
		int p_idx = postService.PostCreate(post);

		AttachVO attach = new AttachVO();
		String uploadpath = "PostImage/" + p_idx;

		if (article_file.isEmpty()) {
			System.out.println("첨부없는 글");

			result = postService.PostCreate(post);

		} else {
			System.out.println("첨부파일 있음");

			for (int i = 0; i < article_file.size(); i++) {
				ResponseEntity<String> img_path = new ResponseEntity<>(UploadFileUtils.uploadFile(uploadpath,
						article_file.get(i).getOriginalFilename(), article_file.get(i).getBytes()), HttpStatus.CREATED);

				String user_imgPath = (String) img_path.getBody();

				System.out.println(user_imgPath);

				attach.setA_name(user_imgPath);
				attach.setA_size(article_file.get(i).getSize());
				attach.setA_Origin(article_file.get(i).getOriginalFilename());
				attach.setP_idx(p_idx);

				postService.AttachInsert(attach);
			}

		}

		return result;
	}

	@PostMapping("/user/postEdit")
	public int EditPost(PostVO post, List<MultipartFile> article_file) throws IOException, Exception {

		int result = 0;
		int p_idx = post.getP_idx();
		String uploadpath = "PostImage/" + p_idx;

		AttachVO attach = new AttachVO();
		List<AttachVO> Postattach = postService.attachLists3(p_idx);
		List<String> attachOrigin = post.getAttachOrigin(); // 수정 후
		List<String> attachFile = new ArrayList<>(); // 수정 전

		for (int j = 0; j < Postattach.size(); j++) {
			attachFile.add(Postattach.get(j).getA_Origin());
		}

		// 원래 첨부파일 비교
		for (int i = 0; i < attachFile.size(); i++) {
			for (int j = 0; j < attachOrigin.size(); j++) {
				if (attachFile.get(i).equals(attachOrigin.get(j))) {
					attachFile.remove(i);
				}
			}
		}

		for (int i = 0; i < attachFile.size(); i++) {
			String a_name = postService.FindnameByOrigin(attachFile.get(i));
			try {
				s3.fileDelete(bucketName, uploadpath + a_name);
			} catch (Exception e) {
				e.printStackTrace();
			}

			new File(uploadpath + a_name.replace('/', File.separatorChar)).delete();
			System.out.println(uploadpath + a_name.replace('/', File.separatorChar));
			System.out.println("원래 사진 삭제");
			postService.attachDelete(attachFile.get(i));
		}
		
		for (int i = 0; i < article_file.size(); i++) {
			ResponseEntity<String> img_path = new ResponseEntity<>(UploadFileUtils.uploadFile(uploadpath,
					article_file.get(i).getOriginalFilename(), article_file.get(i).getBytes()), HttpStatus.CREATED);

			String user_imgPath = (String) img_path.getBody();

			System.out.println(user_imgPath);

			attach.setA_name(user_imgPath);
			attach.setA_size(article_file.get(i).getSize());
			attach.setA_Origin(article_file.get(i).getOriginalFilename());
			attach.setP_idx(p_idx);

			postService.AttachInsert(attach);
		}

		return result;

	}

	@PostMapping("/user/postDel")
	public int DelPost(int p_idx) {

		int result = 0;
		String uploadpath = "PostImage/" + p_idx;

		List<AttachVO> Postattach = postService.attachLists3(p_idx);
		List<String> attachFile = new ArrayList<>(); // 수정 전

		for (int j = 0; j < Postattach.size(); j++) {
			attachFile.add(Postattach.get(j).getA_name());
		}

		for (int i = 0; i < attachFile.size(); i++) {
			try {
				s3.fileDelete(bucketName, uploadpath + attachFile.get(i));
			} catch (Exception e) {
				e.printStackTrace();
			}

			new File(uploadpath + attachFile.get(i).replace('/', File.separatorChar)).delete();
			System.out.println("원래 사진 삭제");
			postService.attachDelete(attachFile.get(i));
		}

		postService.PostDel(p_idx);

		return result;
	}

}
