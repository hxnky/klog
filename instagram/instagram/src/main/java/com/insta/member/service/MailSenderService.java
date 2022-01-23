package com.insta.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.insta.domain.MemberVO;

@Service
public class MailSenderService {

	@Autowired
	private JavaMailSender sender;

	public int PwSend(MemberVO vo) {

		int result = 1;

		MimeMessage message = sender.createMimeMessage();

		try {

			// 메일 제목
			message.setSubject(vo.getId() + "님, 더욱 간편하게 Instagram에 다시 로그인해보세요", "UTF-8");

			// 메일 내용 컨텐츠 html
			String html = "<div style='width:500px;'><h3>" + vo.getId() + "님, 안녕하세요.</h3><br>";
			html += " <h1>Instagram 로그인과 관련하여 불편을 끼쳐드려 죄송합니다. </h1><br>";
			html += "<h1>비밀번호를 잊으셨나요? </h1><br>";
			html += "<h1>회원님이 로그인한 것이 맞다면 지금 바로 계정에 로그인하거나 비밀번호를 재설정할 수 있습니다.</h1>";
			html += "<button style='width: 80%; height: 30px; margin-top: 10px; margin-bottom: 20px;";
			html +=  "margin-left: 40px; background-color: dodgerblue; border: none;border-radius: 5px'>";
			html += "<a href='http://localhost:8080/user/RePw?id="+vo.getId()+"' style='font-weight: bold; color: white; '>" + vo.getId() + "(으)로 로그인</a></button><div>";
			html += "회원님의 Instagram 비밀번호를 알고 있거나 이 이메일에서 로그인 링크를 클릭한 사람만 회원님의 계정에 로그인할 수 있습니다.";

			// message에 내용 적용
			message.setText(html, "utf-8", "html");

			// from 설정
			message.setFrom(new InternetAddress("Instagram"));

			// to 설정
			message.addRecipient(RecipientType.TO, new InternetAddress(vo.getEmail(), vo.getId() + " 님 💛", "UTF-8"));

			// 메일 발송
			sender.send(message);

		} catch (MessagingException e) {
			result = 0;
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;

	}

}
