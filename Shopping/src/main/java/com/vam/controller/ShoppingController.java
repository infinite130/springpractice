package com.vam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShoppingController {
	private static final Logger Logger = LoggerFactory.getLogger(ShoppingController.class);
	
	@GetMapping("/main")
	public void mainPageGET() {
		
		Logger.info("메인 페이지 진입");
	}

}
