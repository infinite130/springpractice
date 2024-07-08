package polymorphism;

public class LgTV implements TV{
	
	public LgTV() {
		System.out.println("========> LG TV 객체 생성");
	}

	@Override
	public void powerOn() {
		
		System.out.println("LG TV --- 전원 켠다");
	}

	@Override
	public void powerOff() {
		
		 System.out.println("LG TV --- 전원 끈다"); 
	}

	@Override
	public void volumeUp() {
		System.out.println("LG TV --- 소리 올린다");
		
	}

	@Override
	public void voulumeDown() {
		
		System.out.println("LG TV --- 소리 내린다");
	}
	
	
	
	
	
	/*
	 * public void turnOn() { System.out.println("LG TV --- 전원 켠다"); }
	 * 
	 * public void turnOff() { System.out.println("LG TV --- 전원 끈다"); }
	 * 
	 * public void soundUp() { System.out.println("LG TV --- 소리 올린다"); }
	 * 
	 * public void soundDown() { System.out.println("LG TV --- 소리 내린다"); }
	 */
	
}
