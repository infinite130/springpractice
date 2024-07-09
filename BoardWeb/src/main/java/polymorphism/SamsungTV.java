package polymorphism;

import org.springframework.stereotype.Component;

@Component("sstv")
public class SamsungTV implements TV{
	
	private Speaker speaker;
	private int price;
	
	public SamsungTV() {
		System.out.println("======> SamsungTV(1) ��ü ����");
	}

	public void setSpeaker(Speaker speaker) {
		System.out.println("====> setSpeaker() ȣ��");
		this.speaker = speaker;
	}

	public void setPrice(int price) {
		System.out.println("====> setPrice() ȣ��");
		this.price = price;
	}

	@Override
	public void powerOn() {
		System.out.println("SamsungTV  --- ���� �Ҵ�. (���� : " + price + ")");
	}

	@Override
	public void powerOff() {
		System.out.println("SamsungTV --- ���� ����");
	}

	@Override
	public void volumeUp() {
		
		speaker.volumeUp();
		
	}

	@Override
	public void voulumeDown() {
		speaker.volumeDown();
	}

	
	
	/*
	 * public SamsungTV(Speaker speaker) {
	 * System.out.println("======> SamsungTV(2) ��ü ����"); this.speaker = speaker; }
	 * 
	 * 
	 * public SamsungTV(Speaker speaker, int price) {
	 * System.out.println("======> SamsungTV(3) ��ü ����"); this.speaker = speaker;
	 * this.price = price; }
	 * 
	 * 
	 * 
	 * @Override public void powerOn() {
	 * 
	 * System.out.println("SamsungTV  --- ���� �Ҵ�. (���� : " + price + ")"); }
	 * 
	 * @Override public void powerOff() { System.out.println("SamsungTV --- ���� ����");
	 * 
	 * }
	 * 
	 * @Override public void volumeUp() { //speaker = new SonySpeaker();
	 * speaker.volumeUp(); }
	 * 
	 * @Override public void voulumeDown() { //speaker = new SonySpeaker();
	 * speaker.volumeDown();
	 * 
	 * }
	 */
	
	/*
	 * public void powerOn() { System.out.println("SamsungTV  --- ���� �Ҵ�"); }
	 * 
	 * public void powerOff() { System.out.println("SamsungTV --- ���� ����"); }
	 * 
	 * public void volumeUp() { System.out.println("SamsungTV --- �Ҹ� �ø���"); }
	 * 
	 * public void volumeDown() { System.out.println("SamsungTV -- �Ҹ� ������"); }
	 */
}
