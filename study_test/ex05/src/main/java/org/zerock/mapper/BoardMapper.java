package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

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
	// 페이징 리스트
	public List<BoardVO> getListWithPaging(Criteria cri);
	//총 데이터 수 구하기 --> 어노테이션으로 구해도 상관 x
	public int getTotalCount(Criteria cri);
	// 22.01.13 댓글 수
	// amount는 해당 게시물의 번호인 bno의 증가나 감소를 의미 
	// 2개 이상의 데이터를 전달하려면 @Param을 사용해야 한다.
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
}
