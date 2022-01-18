package org.zerock.service;

import org.springframework.stereotype.Service;

@Service
public class SampleServiceImpl implements SampleService {

	@Override
	public Integer doAdd(String str1, String str2) throws Exception {
		
		// 원래 쓰던 log.info같은 애들은 AOP를 사용한다. (LogAdvice)
		
		// 단순 숫자 반복
		return Integer.parseInt(str1) + Integer.parseInt(str2);
		
		
	}

}
