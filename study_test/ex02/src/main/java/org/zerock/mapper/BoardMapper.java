package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	// 책 번호가 0 이상인 목록을 전부 불러온다
	//@Select("select * from tbl_board where bno > 0") --> mapper.xml 따로 생성하여 필요 없음
	public List<BoardVO> getList();
	
	// 책 정보를 입력한다. bno는 다음 번호를 넣는다
	public void insert(BoardVO board);
	
	// 책 정보를 입력한다. bno는 다음 번호를 sql문을 통해 구하여 넣는다.
	public Integer insertSelectKey(BoardVO board);
	
	// 특정 번호의 책 정보를 읽어온다
	public BoardVO read(Long bno);
	
	// 특정 번호의 책 정보를 삭제한다.
	public int delete(Long bno);
	
	// 특정 번호의 책 정보를 수정한다
	public int update(BoardVO board);
	
	// 페이지 처리
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	// 전체 게시물의 수 구하기
	public int getTotalCount(Criteria cri);
}
