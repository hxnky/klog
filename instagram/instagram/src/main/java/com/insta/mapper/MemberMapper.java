package com.insta.mapper;

import org.apache.ibatis.annotations.Param;

import com.insta.domain.MemberVO;
import com.insta.domain.RegVO;

public interface MemberMapper {
	
	//22.01.20
	public void register(RegVO vo);
	public int CheckEmail(String email);
	public int CheckID(String id);
	// 22.01.23
	public int CheckUserByEmail(@Param("id") String email, @Param("pw") String pw);
	public int CheckUserByID(@Param("id") String id, @Param("pw") String pw);
	public MemberVO MailEmail(String id);
	public MemberVO MailID(String id);
	public int updatePw(@Param("pw") String pw, @Param("id") String id);

}
