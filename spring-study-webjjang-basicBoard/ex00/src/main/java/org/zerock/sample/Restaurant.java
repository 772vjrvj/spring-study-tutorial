package org.zerock.sample;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.zerock.controller.HomeController;

import lombok.Data;
import lombok.Setter;


@Component
@Data
public class Restaurant {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Setter(onMethod_ = @Autowired )
	private Chef chef;
	
	public void printMathod() {
		logger.info("print test");
	}
}
