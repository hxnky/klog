package com.klog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.klog.domain.NeighborVO;

public interface NeighborMapper {
	// 22.03.18
	// 이웃관련 매퍼
	// 이웃 목록 가져오기
	public List<NeighborVO> neighborList(int u_idx);

	// 이웃신청목록 가져오기
	public List<NeighborVO> neighborCheck(int u_idx);

	// 이웃 신청
	public void follow(@Param("u_idx") int u_idx, @Param("y_idx") int y_idx);

	// 서로 이웃 신청
	public void followEach(NeighborVO neighbor);

	// 이웃-->서로이웃
	public void followChange(NeighborVO neighbor);

	// 이웃 신청 받기
	public void followChk(@Param("u_idx") int u_idx, @Param("y_idx") int y_idx);

	// 이웃 삭제
	public void followDel(@Param("u_idx") int u_idx, @Param("y_idx") int y_idx);

	// 서로이웃 삭제
	public void followEachDel(@Param("u_idx") int u_idx, @Param("y_idx") int y_idx);
}
