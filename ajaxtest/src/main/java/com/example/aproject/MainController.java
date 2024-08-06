package com.example.aproject;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
public class MainController {
	
	@GetMapping("/get.do")
	public String ajax() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kor", "korea");
		map.put("us", "United States");
		
		return null;
	}

}
