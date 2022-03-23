package com.klog.Handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.klog.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class echoHandler extends TextWebSocketHandler {

	// 로그인 한 전체
	List<WebSocketSession> session = new ArrayList<WebSocketSession>();
	// 로그인 중인 개별 유저
	Map<String, WebSocketSession> userSessionMap = new ConcurrentHashMap<String, WebSocketSession>();

	// 서버 연결
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		String senderEmail = getEmail(session); // 접속한 유저의 http세션을 조회하여 email을 가져온다
		if (StringUtils.isNotEmpty(senderEmail)) {
			System.out.println(senderEmail + "연결되었습니다.");
			userSessionMap.put(senderEmail, session);
		}

	}

	// 클라이언트에서 데이터 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// 해당하는 유저에게 바꾸기
		String msg = message.getPayload();

		// 세션 이메일
		String email = getEmail(session);

		System.out.println("메세지 도착 ::::" + msg);
		if (msg != null) {
			String[] strs = new String[3];
			strs = msg.split(",");

			if (strs != null && strs.length == 3) {
				String cmd = strs[0];
				String content = strs[1];
				String m_name = strs[2];

				System.out.println(cmd);
				System.out.println(content);
				System.out.println(m_name);

				WebSocketSession targetSession = userSessionMap.get(email); // 메세지를 받을 Email의 세션 조회
				System.out.println("현재 이메일의 세션" + targetSession);

				// 실시간 접속 시 타입별로 알람 보낸다.
				if (targetSession != null && "letter".equals(cmd)) {
					System.out.println("안부글 알림");
					TextMessage tmpMsg = new TextMessage("<a type='external' href='/mainPage/" + email + "#letter'>"
							+ m_name + "님이 안부글을 남겼습니다." + "</a><br><p>"+content+"</p>");

					targetSession.sendMessage(tmpMsg);

				} else if (targetSession != null && "reply".equals(cmd)) {
					System.out.println("답글 알림");
					TextMessage tmpMsg = new TextMessage("<a type='external' href='/mainPage/" + email + "#letter'>"
							+ m_name + "님이 답글을 남겼습니다." + "</a><br><p>\"+content+\"</p>");

					targetSession.sendMessage(tmpMsg);

				} else if (targetSession != null && "follow".equals(cmd)) {
					System.out.println("안부글 알림");
					TextMessage tmpMsg = new TextMessage("<a type='external' href='/mainPage/" + email + "#neighbor"
							+ m_name + "님이 나를 이웃으로 추가하였습니다." + "</a>");

					targetSession.sendMessage(tmpMsg);

				} else if (targetSession != null && "Eachfollow".equals(cmd)) {
					System.out.println("서로이웃 알림");
					TextMessage tmpMsg = new TextMessage("<a type='external' href='/mainPage/" + email + "#neighbor"

							+ m_name + "</a>님이 서로이웃 신청을 보냈습니다." + "");

					targetSession.sendMessage(tmpMsg);

				}
			}
		}

	}

	// 연결 해제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = getEmail(session);
		if (senderId != null) { // 로그인 값이 있는 경우만
			log.info(senderId + " 연결 종료됨");
			userSessionMap.remove(senderId);
			// sessions.remove(session); --> sessions 에서 오류
		}
	}

	// 웹소켓에서 이메일 가져오기
	private String getEmail(WebSocketSession session) {

		Map<String, Object> httpSession = session.getAttributes();
		MemberVO loginUser = (MemberVO) httpSession.get("userInfo");

		if (loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getEmail();
		}

	}
}
