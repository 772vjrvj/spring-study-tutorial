package org.zerock.util.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;


// aop 프로그램 중 aspect 프로그램 임을 알려 준다.
@Aspect
// 자동 생성
@Component
//로그로 출력
@Log4j
public class LogAdvice {

	//around aop 처리   모든 데이터를 다 받아야 하니깐 object
	//org.zerock.image.service 
	//org.zerock.board.service 의 모든 클래스의 모든 매소드 (..)이거는 파라미터
	
	@Around("execution(* org.zerock.*.service.*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		
		Object result = null;
		
		// ------------------- 여기에 작성한 코드들은 실행 이전에 처리된다. - 넘오오는 데이터 출력
		// 시작 시간 저장
		long start = System.currentTimeMillis();
		
		log.info("\n\n<====================Service log ================>");
		
		//실행하려는 서비스 프로그램 타입
		log.info("실행 서비스 : " + pjp.getTarget());
		log.info("넘어가는 데이터 : " + Arrays.toString(pjp.getArgs()));
		
		// aop가 여러개인 경우 다음 aop로 이동해야 한다.
		try {
			//다음 진행으로 이동
			result = pjp.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//여기에 작성한 코드들은 실행 이후에 처리된다. - 실행 결과 데이터 출력
		long end = System.currentTimeMillis();
		
		// 처리할 때 걸린 시간
		log.info("TIME : " + (end - start) / 1000.0 + "초");
		
		log.info("<<====================Service log ================>>\n\n");
		
		return result;
		
		
	}
	
}
