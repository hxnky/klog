package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardMapper {

	//@Select("select * from tbl_board where bno > 0")
	// 전체 리스트 가져오기
	public List<BoardVO> getList();
	// 새로운 책 정보 등록
	public void insert(BoardVO board);
	// PK 값을 미리 처리하고 특정한 이름으로 결과를 보관한다.
	public void insertSelectKey(BoardVO board);
	// 해당 책 번호의 정보 불러오기
	public BoardVO read(Long bno);
	// 해당 책 번호 정보 삭제
	public int delete(Long bno);
	// 해당 책 번호의 정보 수정
	public int update(BoardVO board);
}
