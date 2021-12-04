package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	// 책 전체 리스트
	@Test
	public void testGetList() {
		//mapper.getList().forEach(board -> log.info(board));
	}
	
	// 책 정보 삽입
	@Test
	public void testInsert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("새로 쓰는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		//mapper.insert(board);
		
		log.info(board);
		
	}
	
	//selectKey 사용하여 삽입
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 쓰는 글 selectKey");
		board.setContent("새로 작성하는 내용 selectKey");
		board.setWriter("newbie");
		
		//mapper.insertSelectKey(board);
		
		log.info(board);
		
	}

	// 특정 책 정보 읽어오기
	@Test
	public void testRead() {
		
		// 존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(5L);
		
		log.info(board);
		
	}
	
	// 특정 책 정보 삭제하기
	@Test
	public void testDelete() {
		
		//log.info("DELETE COUNT : " + mapper.delete(3L));
		
	}
	
	// 특정 책 정보 수정하기
	@Test
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		
		// 실행 전 존재하는 번호인지 확인해야함
		board.setBno(5L);
		board.setTitle("책 제목 수정");
		board.setContent("책 내용 수정");
		board.setWriter("책 작가 수정");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT : " + count);
			
	}
	
}
