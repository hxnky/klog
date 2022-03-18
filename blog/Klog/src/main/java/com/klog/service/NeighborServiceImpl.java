package com.klog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klog.domain.MemberVO;
import com.klog.domain.NeighborVO;
import com.klog.mapper.MemberMapper;
import com.klog.mapper.NeighborMapper;

@Service
public class NeighborServiceImpl implements NeighborService {

	@Autowired
	private NeighborMapper mapper;
	
	@Autowired
	private MemberMapper memberMapper;

	// 22.03.18
	// 이웃/서로이웃
	@Override
	public List<NeighborVO> neighborList(int u_idx) {
		
		List<NeighborVO> followList = mapper.neighborCheck(u_idx);
		MemberVO member = new MemberVO();
		
		for(int i = 0; i<followList.size(); i++) {
			int user_idx = followList.get(i).getU_idx();
			
			member = memberMapper.userInfoByIdx(user_idx);			
			followList.get(i).setMember(member);
		}

		return followList;
	}

	@Override
	public List<NeighborVO> neighborChk(int u_idx) {
		
		List<NeighborVO> followList = mapper.neighborCheck(u_idx);
		MemberVO member = new MemberVO();
		
		for(int i = 0; i<followList.size(); i++) {
			int user_idx = followList.get(i).getU_idx();
			
			member = memberMapper.userInfoByIdx(user_idx);			
			followList.get(i).setMember(member);
		}
		
		System.out.println("서로이웃 리스트 :::::"+ followList);
		

		return followList;
	}

	@Override
	public int follow(int u_idx, int y_idx) {

		int result = 0;

		mapper.follow(u_idx, y_idx);

		return result;
	}

	@Override
	public int followEach(NeighborVO neighbor) {

		int result = 0;

		mapper.followEach(neighbor);

		return result;
	}

	@Override
	public int followChg(NeighborVO neighbor) {

		int result = 0;
		mapper.followChange(neighbor);

		return result;
	}

	@Override
	public int followChk(int u_idx, int y_idx) {
		int result = 0;
		mapper.followChk(u_idx, y_idx);

		return result;
	}

	@Override
	public int followDel(int u_idx, int y_idx) {
		int result = 0;
		mapper.followDel(u_idx, y_idx);
		return result;
	}

	@Override
	public int followEachDel(int u_idx, int y_idx) {
		int result = 0;
		mapper.followEachDel(u_idx, y_idx);
		return result;
	}

}
