package org.zerock.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice // 해당 객체가 예외를 처리하는 존재임을 명시
@Log4j
public class CommonExceptionAdvice {

	// 예외처리 목적의 클래스
	// 주로 500
	@ExceptionHandler(Exception.class) // 괄호 안의 메서드가 들어가는 예외타입 처리
	public String except(Exception ex, Model model) {

		log.error("Exception......" + ex.getMessage());
		model.addAttribute("exception", ex);
		log.error(model);
		return "error_page";
	}
	
	// 404에러 처리
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		
		return "custom404";
	}

}
