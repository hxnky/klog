package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insertAttach(BoardAttachVO vo);
	public void deleteAttach(String uuid);
	public List<BoardAttachVO> findByBno(Long bno);
	public void deleteAll(Long bno);
	public List<BoardAttachVO> getOldFiles();

}
