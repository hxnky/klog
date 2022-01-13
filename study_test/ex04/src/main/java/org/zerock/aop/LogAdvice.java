package org.zerock.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect // 해당 객체가 Aspect를 구현한 것임을 나타넴
@Log4j
@Component // AOP와는 관계 없으나 스프링에서 빈으로 인식하기 위해 사용
public class LogAdvice {

	// AspectJ의 표현식 맨 앞의 * : 접근제한자, 맨 뒤의 * : 클래스와 메서드의 이름

	@Before("execution(* org.zerock.service.SampleService*.*(..))")
	public void logBefore() {
		
		// doAdd() 실행 전 로그 출력
		log.info("============================");

	}

	// args : 단순한 로그 뿐만 아니라 메서드에 전달된 파라미터도 파악할 수 있다
	// 하지만 파라미터가 다른 여러 종류에 메서드에 적용하는 데에는 간단하지 않다
	// 메서드(doAdd)를 명시하고 뒤에 파라미터를 설정한다
	@Before("execution(* org.zerock.service.SampleService*.doAdd(String, String)) && args(str1, str2)")
	public void logBeforeWithParam(String str1, String str2) {

		// doAdd() 실행 전 로그 출력
		log.info("str1 : " + str1);
		log.info("str : " + str2);

	}

	// @AfterThrowing : 지정된 대상이 예외를 발생한 후에 동작하면서 문제를 찾을 수 있도록 한다.
	@AfterThrowing(pointcut = "execution(* org.zerock.service.SampleService*.*(..))", throwing = "exception")
	public void logException(Exception exception) {
		
		log.info("Exception 발생 !!!!!!!");
		log.info("exception ; " + exception);
	}
	
	// @Around : 직접 대상 메서드를 실행 할 수 있는 권한을 갖고있다. 메서드의 실행 전과 후에 처리 가능
	@Around("execution (* org.zerock.Service.SampleService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		
		long start = System.currentTimeMillis();
		
		log.info("Target : " + pjp.getTarget());
		log.info("Param : " + Arrays.toString(pjp.getArgs()));
		
		// 메서드 호출
		Object result = null;
		
		try {
			result = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		long end = System.currentTimeMillis();
		
		log.info("TIME : " + (end - start));
		
		return result;
		
	}

}
