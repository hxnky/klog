package com.klog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.klog.domain.AttachVO;
import com.klog.domain.PostVO;
import com.klog.mapper.PostMapper;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostMapper mapper;

	@Override
	public int PostCreate(PostVO post) {
		mapper.CreatePost(post);

		return mapper.ListPostIdx();
	}

	@Override
	public void AttachInsert(AttachVO attach) {
		mapper.CreateAttach(attach);

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
	public List<AttachVO> attachLists3(int p_idx) {

		return mapper.LoadAttach(p_idx);
	}

	@Override
	public void attachDelete(String attach) {

		mapper.DeleteAttach(attach);
	}

	@Override
	public void PostEdit(PostVO post, List<MultipartFile> article_file) {
		mapper.EditPost(post);

	}

	@Override
	public void PostDel(int p_idx) {
		mapper.DelPost(p_idx);

	}



	@Override
	public String FindnameByOrigin(String a_Origin) {
		
		return mapper.FindA_name(a_Origin);
	}

	@Override
	public int ScrapInsert(int p_idx, int m_idx) {

		int result = 0;

		System.out.println(p_idx);
		System.out.println(m_idx);

		PostVO post = mapper.PostLoadByPidx(p_idx);

		post.setScrap_idx(m_idx);
		System.out.println(post);
		mapper.ScrapInsert(post);

		return result;
	}

	@Override
	public int ScrapDel(int p_idx, int scrap_idx) {
		int result = 0;

		mapper.ScrapDelete(p_idx, scrap_idx);

		return result;
	}

}
