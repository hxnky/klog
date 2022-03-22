package com.klog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klog.domain.AlarmVO;
import com.klog.mapper.AlarmMapper;

@Service
public class AlarmServiceImpl implements AlarmService {
	
	@Autowired
	private AlarmMapper mapper;

	@Override
	public List<AlarmVO> AlarmList(int ar_idx) {
		
		return mapper.CountAlarmByIdx(ar_idx);
	}

	@Override
	public int AlarmInsert(AlarmVO alarm) {
		
		int result = 0;
		
		mapper.AlarmInsert(alarm);
		
		return result;
	}
	
	
	

}
