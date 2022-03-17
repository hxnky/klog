package com.klog.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.klog.domain.AttachVO;
import com.klog.domain.PostVO;
import com.klog.mapper.PostMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PostServiceImpl implements PostService {

	@Autowired
	private PostMapper mapper;

	@Override
	public int PostCreate(PostVO post, List<MultipartFile> article_file) {

		int result = 0;

		mapper.CreatePost(post);
		System.out.println(mapper.ListPostIdx());
		uploadImage(article_file, mapper.ListPostIdx());

		return result;
	}

	@Override
	public List<PostVO> postLoad(int m_idx) {
		// 리스트로 받아야함
		List<PostVO> post = mapper.LoadPost(m_idx);

		return post;
	}

	@Override
	public List<AttachVO> attachList(List<PostVO> post) {

		List<AttachVO> attach = new ArrayList<AttachVO>();

		for (int i = 0; i < post.size(); i++) {

			attach.addAll(mapper.LoadAttach(post.get(i).getP_idx()));
		}

		System.out.println("오류확인1 ::::" + attach);

		return attach;
	}

	@Override
	public int PostEdit(PostVO post, List<MultipartFile> article_file) {

		int result = 0;

		List<AttachVO> attach = mapper.LoadAttach(post.getP_idx());
		List<String> attachOrigin = post.getAttachOrigin(); // 수정 후
		List<String> attachFile = new ArrayList<>(); // 수정 전

		for (int j = 0; j < attach.size(); j++) {
			attachFile.add(attach.get(j).getA_Origin());
		}

		System.out.println("DB에 있는 파일 :::: " + attachFile);
		System.out.println("수정 후 파일 ::::" + attachOrigin);

		// 원래 첨부파일 비교
		for (int i = 0; i < attachFile.size(); i++) {

			for (int j = 0; j < attachOrigin.size(); j++) {

				if (attachFile.get(i).equals(attachOrigin.get(j))) {
					attachFile.remove(i);
				}

			}
		}
		System.out.println("삭제해야하는 파일 :::::" + attachFile);

		for (int i = 0; i < attachFile.size(); i++) {
			mapper.DeleteAttach(attachFile.get(i));
		}

		// 새로 추가한 이미지 저장
		uploadImage(article_file, post.getP_idx());
		mapper.EditPost(post);

		return result;
	}

	@Override
	public int PostDel(int p_idx) {

		int result = 0;

		mapper.DelPost(p_idx);

		return result;
	}

	public String uploadImage(List<MultipartFile> attach_file, int p_idx) {

		System.out.println(attach_file);

		AttachVO attach = new AttachVO();

		log.info("update ajax post ............ ");
		String uploadFolder = "C:\\PostImage";
		String uploadFileName = "";

		// String uploadFolderPath = getFolder();
		// make Filder
		File uploadPath = new File(uploadFolder);
		log.info("uploadPath : " + uploadPath);

		// 해당 경로가 있는지 확인하고 없으면 생성
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		// AttachFileDTO attachDTO = new AttachFileDTO();
		// MemberVO member = new MemberVO();

		for (int i = 0; i < attach_file.size(); i++) {
			log.info("==========================");
			log.info("Upload File Name : " + attach_file.get(i).getOriginalFilename());
			log.info("Upload FIle Size : " + attach_file.get(i).getSize());

			uploadFileName = attach_file.get(i).getOriginalFilename();

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name : " + uploadFileName);
			// attachDTO.setFileName(uploadFileName);

			// 중복 방지를 위한 UUID 적용
			UUID uuid = UUID.randomUUID();
			log.info("uuid : " + uuid);

			// 생성된 UUID_원래 이름
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			log.info("UUID 추가된 이름" + uploadFileName);

			attach.setA_name(uploadFileName);
			attach.setA_size(attach_file.get(i).getSize());
			attach.setA_Origin(attach_file.get(i).getOriginalFilename());
			attach.setP_idx(p_idx);

			// File saveFile = new File(uploadFolder, uploadFileName);

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				attach_file.get(i).transferTo(saveFile);

				mapper.CreateAttach(attach);

				// attachDTO.setUuid(uuid.toString());
				// attachDTO.setUploadPath(uploadFolderPath);

				// log.info("member 사진 이름 : " + member.getM_pic());

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return uploadFileName;
	}

	public void DeleteImage(String a_name) {

		String uploadFolder = "C:\\PostImage";
		File uploadPath = new File(uploadFolder);

		mapper.DeleteAttach(a_name);

		File deletefile = new File(uploadPath, a_name);

		deletefile.delete();

	}

}
