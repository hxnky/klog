package com.insta.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insta.domain.MemberVO;
import com.insta.domain.RegVO;
import com.insta.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private MailSenderService MService;

	@Override
	public int register(RegVO vo) {

		System.out.println("회원가입 서비스");
		System.out.println(vo);

		log.info("회원가입 서비스 시작");
		log.info("회원가입 정보 : " + vo);
		int result = 0;

		// 회원정보 중복 확인
		// 이메일 중복과 아이디 중복을 구분해야함
		if (mapper.CheckEmail(vo.getEmail()) == 1) {

			System.out.println("이메일 중복");
			result = 1;
		} else if (mapper.CheckID(vo.getId()) == 1) {
			System.out.println("아이디 중복");
			result = 2;
		} else {
			mapper.register(vo);
		}

		log.info("실행 결과 : " + result);
		System.out.println("회원가입 서비스 마지막 ");
		System.out.println(result);

		return result;
	}

	@Override
	public int login(MemberVO vo) {

		int result = 0;

		System.out.println(vo);
		System.out.println(vo.getId());

		// 먼저 이메일/아이디가 존재하는지 확인
		if (mapper.CheckEmail(vo.getId()) == 1 || mapper.CheckID(vo.getId()) == 1) {

			// 이메일/아이디가 존재
			if (mapper.CheckUserByEmail(vo.getId(), vo.getPw()) == 1
					|| mapper.CheckUserByID(vo.getId(), vo.getPw()) == 1) {
				// 로그인 성공
				result = 1;
			} else {
				// 비밀번호가 틀림
				result = 2;
			}
		}

		return result;
	}

	@Override
	public int findPw(String id) {

		// 입력받은 아이디/이메일이 있는지 확인 후 있다면 메일 전송
		int result = 0;
		MemberVO vo = new MemberVO();

		if (mapper.CheckEmail(id) == 1 || mapper.CheckID(id) == 1) {

			result = 1;
			System.out.println(id);
			// 메일 전송 후 result = 2 로 분기 구별
			// 입력한 아이디/email의 사용자 정보 가져오기
			if (mapper.CheckEmail(id) == 1) {
				vo = mapper.MailEmail(id);
			} else {
				vo = mapper.MailID(id);
			}

			System.out.println(vo);

			if (MService.PwSend(vo) == 0) {
				result = 2;
			}
			System.out.println("메일전송완료");
		}

		return result;
	}

	@Override
	public int RecoveryPw(String pw, String id) {

		int result = 0;

		if (mapper.updatePw(pw, id) == 1) {
			result = 1;
		}

		return result;
	}

	@Override
	public MemberVO loginById(String id) {

		return mapper.MailID(id);
	}

	
}
