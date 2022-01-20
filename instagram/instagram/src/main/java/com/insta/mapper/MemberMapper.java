package com.insta.mapper;

import com.insta.domain.RegVO;

public interface MemberMapper {
	
	//22.01.20
	public void register(RegVO vo);
	public int CheckUser(String email);

}
