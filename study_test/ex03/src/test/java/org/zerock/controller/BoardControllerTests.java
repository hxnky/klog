package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// 스프링의 테스트 기능을 이용하면 개발 시 Tomcat을 실행하지 않고 스프링과 웹 URL을 테스트 할 수 있다.
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration // Controller 테스트 시 필요
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;
	private MockMvc mockMvc;

	@Before // 모든 테스트 전에 매번 실행한다
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	// 리스트 불러오기 테스트
	@Test
	public void testList() throws Exception {
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap());
	}

	// 등록하기 테스트
	@Test
	public void testRegister() throws Exception {

		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/register/").param("title", "2차 테스트 새 글 등록")
						.param("content", "2차 테스트 새글 내용").param("writer", "갱"))
				.andReturn().getModelAndView().getViewName();

		log.info(resultPage);
	}

	// 정보 불러오기 테스트
	@Test
	public void testGet() throws Exception {

		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get").param("bno", "573484")).andReturn()
				.getModelAndView().getModelMap());

	}

	// 정보 수정 테스트
	@Test
	public void testModify() throws Exception {

		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/modify").param("bno", "573484").param("title", "2차 수정")
						.param("content", "2차 수정 내용").param("writer", "2차 수정 작가"))
				.andReturn().getModelAndView().getViewName();

		log.info(resultPage);
	}

	// 정보 삭제 테스트
	@Test
	public void testRemove() throws Exception {

		// 삭제 전 데이터 베이스에 해당 책 번호의 정보가 있는지 확인해야 한다
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove").param("bno", "573484"))
				.andReturn().getModelAndView().getViewName();

		log.info(resultPage);

	}

	@Test
	public void testListPaging() throws Exception {

		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list").param("pageNum", "2").param("amount", "50"))
				.andReturn().getModelAndView().getModelMap());
		

	}

}
