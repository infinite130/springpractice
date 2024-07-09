package polymorphism;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {

	public static void main(String[] args) {

		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");

		TV tv = (TV) factory.getBean("tv");
		tv.powerOff(); 
		tv.powerOn(); 
		tv.volumeUp(); 
		tv.voulumeDown();

		/*
		 * tv.powerOff(); tv.powerOn(); tv.volumeUp(); tv.voulumeDown();
		 * 
		 */
		factory.close();

		/*
		 * BeanFactory factory = new BeanFactory(); TV tv =
		 * (TV)factory.getBean(args[0]);
		 */

		/*
		 * SamsungTV tv = new SamsungTV(); tv.powerOn(); tv.volumeUp(); tv.volumeDown();
		 * tv.powerOff();
		 */

		/*
		 * tv.powerOff(); tv.powerOn(); tv.volumeUp(); tv.voulumeDown();
		 */

	}

}
