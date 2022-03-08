package com.klog.persistance;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

// JDBC 연결 테스트
@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
		try (Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/klog?serverTimezone=Asia/Seoul", "klog", "klog")) {
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
			// TODO: handle exception
		}
	}

}
