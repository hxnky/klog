package com.klog.service;

import java.util.List;

import com.klog.domain.NeighborVO;

public interface NeighborService {
	
	//22.03.18
		// 이웃 목록 불러오기
		public List<NeighborVO> neighborList(int u_idx);
		// 이웃 신청 목록 불러오기
		public List<NeighborVO> neighborChk(int u_idx);
		// 이웃 신청
		public int follow(int u_idx, int y_idx);
		// 서로이웃 신청
		public int followEach(NeighborVO neighbor);
		// 이웃에서 서로이웃 변경
		public int followChg(NeighborVO neighbor);
		// 서로이웃 신청 확인
		public int followChk(int u_idx, int y_idx);
		// 이웃 삭제
		public int followDel(int u_idx, int y_idx);
		// 서로 이웃 삭제
		public int followEachDel(int u_idx, int y_idx);
		// 서로이웃 + 이웃 모두 삭제
		public int followAllDel(int u_idx, int y_idx);

}
