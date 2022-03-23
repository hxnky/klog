package com.klog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klog.domain.AlarmVO;
import com.klog.domain.MemberVO;
import com.klog.mapper.AlarmMapper;
import com.klog.mapper.MemberMapper;

@Service
public class AlarmServiceImpl implements AlarmService {
	
	@Autowired
	private AlarmMapper mapper;
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public List<AlarmVO> AlarmList(int ar_idx) {
		
		List<AlarmVO> alarm = new ArrayList<>();
		
		alarm = mapper.CountAlarmByIdx(ar_idx);
		
		if(alarm.size() != 0) {
			for(int i=0; i < alarm.size(); i++) {
				
				MemberVO member = memberMapper.userInfoByIdx(alarm.get(i).getAc_idx());
				
				alarm.get(i).setMember(member);
			}
		}
		
		System.out.println("알람 리스트::::: " + alarm);
		
		return alarm;
	}

	@Override
	public int AlarmInsert(AlarmVO alarm) {
		
		int result = 0;
		
		mapper.AlarmInsert(alarm);
		
		return result;
	}

	@Override
	public int AlarmContentInsert(AlarmVO alarm) {
		int result = 0;
		
		mapper.AlarmContentInsert(alarm);
		
		return result;
	}
	
	
	

}
