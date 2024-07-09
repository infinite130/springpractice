package polymorphism;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("tv")
public class LgTV implements TV{
	
	@Autowired
	@Qualifier("apple")
	private Speaker speaker;
	
	public LgTV() {
		System.out.println("========> LG TV ��ü ����");
	}

	@Override
	public void powerOn() {
		
		System.out.println("LG TV --- ���� �Ҵ�");
	}

	@Override
	public void powerOff() {
		
		 System.out.println("LG TV --- ���� ����"); 
	}

	@Override
	public void volumeUp() {
		speaker.volumeUp();
		//System.out.println("LG TV --- �Ҹ� �ø���");
		
	}

	@Override
	public void voulumeDown() {
		speaker.volumeDown();
		//System.out.println("LG TV --- �Ҹ� ������");
	}
	
	
	
	
	
	/*
	 * public void turnOn() { System.out.println("LG TV --- ���� �Ҵ�"); }
	 * 
	 * public void turnOff() { System.out.println("LG TV --- ���� ����"); }
	 * 
	 * public void soundUp() { System.out.println("LG TV --- �Ҹ� �ø���"); }
	 * 
	 * public void soundDown() { System.out.println("LG TV --- �Ҹ� ������"); }
	 */
	
}
