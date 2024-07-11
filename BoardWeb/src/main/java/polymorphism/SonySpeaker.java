package polymorphism;

import org.springframework.stereotype.Component;

@Component("sony")
public class SonySpeaker implements Speaker{
	
	public SonySpeaker() {
		System.out.println("===> SonySpeakedr  ");
	}
	
	
	public void volumeUp() {
		System.out.println("SonySpeaker ----  ");
	}
	
	public void volumeDown() {
		System.out.println("SonySpeaker ----");
	}
	

}
