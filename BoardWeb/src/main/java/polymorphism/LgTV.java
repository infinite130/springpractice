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
		System.out.println("========> LG TV ");
	}

	@Override
	public void powerOn() {
		
		System.out.println("LG TV --- ");
	}

	@Override
	public void powerOff() {
		
		 System.out.println("LG TV --- "); 
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
