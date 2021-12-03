package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	// 어노테이션으로 바로 지시
	@Select("SELECT sysdate FROM dual")
	public String getTime();
	
	// TimeMapper.xml을 통해 지시
	public String getTime2();

}
