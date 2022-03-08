package com.insta.persistance;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class DataSourceTests {

	// ConnectionPool 테스트 
	@Setter(onMethod_ = { @Autowired })
	private DataSource dataSource;

	// mybatis 테스트
	@Setter(onMethod_ = { @Autowired })
	private SqlSessionFactory sqlSessionFactory;

	@Test
	public void testConnection() {
		try (Connection con = dataSource.getConnection(); SqlSession session = sqlSessionFactory.openSession()) {
			log.info(con);
			log.info(session);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
