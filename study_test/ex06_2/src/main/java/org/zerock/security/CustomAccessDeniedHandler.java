package org.zerock.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	
	// 접근이 제한된 경우에 쿠키나 세션에 특정한 작업을 하는 경우 핸들러를 통해 직접 구현하는 방식이 더 권장됨
	// 직접적으로 서블릿 API를 이용하여 처리
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessException) throws IOException, ServletException{
		
		log.error("AccessDeniedHandler");
		
		log.error("Rediret");
		
		// 접근 제한ㅇ에 걸리는 경우 리다이렉트
		response.sendRedirect("/accessError");
	}

}
