package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		//mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		
		//board.setTitle("테스트 123");
		//board.setContent("2022 화이팅");
		//board.setWriter("갱");
		
		//mapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		
		//board.setTitle("셀렉트키 테스트");
		//board.setContent("2022 셀렉트키");
		//board.setWriter("셀렉트키 갱");
		
		//mapper.insertSelectKey(board);
		
		log.info(board);
	}
	
	@Test
	public void read() {
		
		// 존재하는 게시물 번호로 테스트한다
		//BoardVO board = mapper.read(21L);
		
		//log.info(board);
	}
	
	@Test
	public void delete() {
		//log.info("DELETE COUNT : " + mapper.delete(448L));
	}
	
	@Test
	public void update() {
		
		BoardVO board = new BoardVO();
		
		//board.setBno(449L);
		//board.setTitle("다시 수정하기");
		//board.setContent("다시 수정된 내용");
		//board.setWriter("수정한 갱");
		
		//int count = mapper.update(board);
		//log.info("UPDATE COUNT : " + count);
		
	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		
		// 10개씩 3페이지
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
		
	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("새로");
		cri.setType("TC");
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		log.info("검색테스트");
		list.forEach(board -> log.info(board));
	}
}
