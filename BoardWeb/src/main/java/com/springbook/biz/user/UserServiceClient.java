package com.springbook.biz.user;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class UserServiceClient {
	
	public static void main(String[] args) {
		

		AbstractApplicationContext container = 
				new GenericXmlApplicationContext("applicationContext.xml");
		

		UserService userService =
				(UserService) container.getBean("userService");
		

		UserVO vo = new UserVO();
		vo.setId("test");
		vo.setPassword("test1234");
		
		UserVO user = userService.getUser(vo);
		if(user != null) {
			System.out.println(user.getName() + "");
		}else {
			System.out.println("");
		}
		


		
		
	}

}
