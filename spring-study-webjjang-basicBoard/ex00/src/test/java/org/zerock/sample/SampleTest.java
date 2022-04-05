package org.zerock.sample;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// Test할 프로그램 설정
@RunWith(SpringJUnit4ClassRunner.class)
// 실행할 때의 설정 파일 -file: --> project 처음 위치에서부터 찾는다.
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SampleTest {

	// 자동 DI를 적용시키는 어노테이션
	//@Inject - java, @Autowired - Spring, @Setter - Lombok
	@Setter(onMethod_ = @Autowired) 
	private Restaurant restaurant;
	
	@Test
	public void testExist1() {
		log.info("---------------------------------");
		restaurant.printMathod();
		restaurant.getChef().ChefTest();
	}
	
	@Test
	public void testExist2() {
		log.info("---------------------------------");
		restaurant.printMathod();
		restaurant.getChef().ChefTest();
	}
	
}
