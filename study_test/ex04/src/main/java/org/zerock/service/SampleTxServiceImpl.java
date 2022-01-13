package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.mapper.Sample1Mapper;
import org.zerock.mapper.Sample2Mapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SampleTxServiceImpl implements SampleTxService {
	
	@Autowired
	private Sample1Mapper mapper1;
	
	@Autowired
	private Sample2Mapper mapper2;

	@Transactional // 트랙잭션 처리가 된 메서드를 구분 
	// tbl_sample2에는 들어가지 않고 오류가 발생하므로 둘 다 들어가면 안된다. 
	@Override
	public void addData(String value) {
		
		log.info("mapper1 실행===============");
		mapper1.insertCol1(value);
				
		log.info("mapper2 실행 ===============");
		mapper2.insertCol2(value);
		
		log.info("서비스 종료 ===================");
		
	}

}
