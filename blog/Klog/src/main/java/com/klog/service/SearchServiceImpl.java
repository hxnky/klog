package com.klog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klog.domain.AttachVO;
import com.klog.domain.MemberVO;
import com.klog.domain.PostVO;
import com.klog.domain.SearchVO;
import com.klog.mapper.PostMapper;
import com.klog.mapper.SearchMapper;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchMapper mapper;
	
	@Autowired
	private PostMapper postMapper;

	@Override
	public List<PostVO> SearchMyPost(String word, int m_idx) {
		
		System.out.println(word);
		System.out.println(m_idx);
		
		List<PostVO> post = mapper.Searchmypost(word, m_idx);
		
		for(int i=0; i<post.size(); i++) {
			List<AttachVO> attach = postMapper.LoadAttach(post.get(i).getP_idx());
			
			post.get(i).setAttach(attach);
		}
		
		
		return post;
	}

	@Override
	public SearchVO Searchuser(String word) {
		
		SearchVO result = new SearchVO();
		
		List<PostVO> post = mapper.SearchPost(word);
		List<MemberVO> member = mapper.SearchMember(word);
		
		for(int i=0; i<post.size(); i++) {
			List<AttachVO> attach = postMapper.LoadAttach(post.get(i).getP_idx());
			
			post.get(i).setAttach(attach);
		}
		
		result.setMember(member);
		result.setPost(post);
		
		return result;
	}
	
	

}
