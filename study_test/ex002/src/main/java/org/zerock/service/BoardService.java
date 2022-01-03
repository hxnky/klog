package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {

	// 느슨한 연결을 위해 service 인터페이스와 그 인터페이스를 구현할 serviceImpl로 분리하여 작성
	public void register(BoardVO board);
	public BoardVO get(Long bno);
	public boolean modify(BoardVO board);
	public boolean remove(Long bno);
	public List<BoardVO> getList();
	
}
