package com.klog.service;

import java.util.List;

import com.klog.domain.AlarmVO;

public interface AlarmService {

	// 22.03.22
	// 알람 가져오기
	public List<AlarmVO> AlarmList(int ar_idx);
	// 알람 인서트
	public int AlarmInsert(AlarmVO alarm);
	
}
