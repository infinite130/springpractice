package polymorphism;

import org.springframework.stereotype.Component;

@Component("sstv")
public class SamsungTV implements TV{
	
	private Speaker speaker;
	private int price;
	
	public SamsungTV() {
		System.out.println("======> SamsungTV(1) ");
	}

	public void setSpeaker(Speaker speaker) {
		System.out.println("====> setSpeaker()");
		this.speaker = speaker;
	}

	public void setPrice(int price) {
		System.out.println("====> setPrice() ");
		this.price = price;
	}

	@Override
	public void powerOn() {
		System.out.println("SamsungTV  ---  " + price + ")");
	}

	@Override
	public void powerOff() {
		System.out.println("SamsungTV ---");
	}

	@Override
	public void volumeUp() {
		
		speaker.volumeUp();
		
	}

	@Override
	public void voulumeDown() {
		speaker.volumeDown();
	}

	
}
