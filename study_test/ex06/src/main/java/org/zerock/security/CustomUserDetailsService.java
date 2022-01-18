package org.zerock.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;

	// 내부적으로 MemberMapper를 이용하여 MemberVO 객체를 조회하고 만일 MemberVO의 인스턴스를 얻을 수 있다면
	// CustomUser 타입의 객체로 변환하여 반환한다.
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + username);

		// username = userid
		MemberVO vo = mapper.readMember(username);

		log.warn("queried by member mapper : " + vo);

		return vo == null ? null : new CustomUser(vo);

	}

}
