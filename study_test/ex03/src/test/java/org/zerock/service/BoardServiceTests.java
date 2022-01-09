package org.zerock.service;

import static org.junit.Assert.assertNotNull;

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
public class BoardServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private BoardService service;

	// BoardService 객체가 제대로 주입이 가능한지 확인
	@Test
	public void testExist() {

		log.info(service);
		assertNotNull(service);

	}
	
	// insertSelectKey를 이용하여 나중에 생성된 게시물의 번호를 확인 할 수 있다
	@Test
	public void testRegister() {
		
		BoardVO board = new BoardVO();
		
		board.setTitle("2차 새로 작성하는 글");
		board.setContent("2차 새로 작성하는 내용");
		board.setWriter("갱");
		
		//service.register(board);
		
		//log.info("생성된 게시물의 번호 : " + board.getBno());
		
	}
	
	//getList() 확인용
	@Test
	public void testGetList() {
		
		//service.getList().forEach(board -> log.info(board));
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
		
	}
	
	// get() 확인용
	@Test
	public void testGet() {
		
		//log.info(service.get(23644L));
	}
	
	// update() 확인용
	@Test
	public void testUpdate() {
		
		//BoardVO board = service.get(23644L);
		
		// 해당 글번호의 정보가 없을경우
//		if(board == null) {
//			return ;
//		}
		
		// 있을경우
		//board.setTitle("2차 제목 수정입니다");
		//log.info("수정 결과 : " + service.modify(board));
		
	}
	
	// delete() 확인용
	@Test
	public void testDelete() {
		
		// 게시물의 번호의 존재 여부를 확인하고 테스트 해야한다
		//log.info("삭제 결과 : " + service.remove(23644L));
		
	}
}
