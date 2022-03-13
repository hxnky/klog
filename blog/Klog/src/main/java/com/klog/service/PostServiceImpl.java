package com.klog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klog.domain.PostVO;
import com.klog.mapper.PostMapper;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostMapper mapper;
	
	@Override
	public int PostCreate(PostVO post) {
		
		int result = 0;
		
		mapper.CreatePost(post);
		
		return result;
	}

	@Override
	public List<PostVO> postLoad(int m_idx) {
		// 리스트로 받아야함
		
		return mapper.LoadPost(m_idx);
	}

	@Override
	public int PostEdit(PostVO post) {
		
		int result = 0;
		
		mapper.EditPost(post);
		
		return result;
	}

	@Override
	public int PostDel(int p_idx) {
		
		int result = 0;
		
		mapper.DelPost(p_idx);
		
		
		return result;
	}
	
	
	
	
}
