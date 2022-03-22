package com.klog.mapper;

import java.util.List;

import com.klog.domain.AlarmVO;

public interface AlarmMapper {
	
	// 로그인 시 알람 가져오기
	public List<AlarmVO> CountAlarmByIdx(int ar_idx);
	
	// 알람 입력
	public void AlarmInsert(AlarmVO alarm);

}
