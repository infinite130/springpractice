package com.vam.model;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
	
	private int amount;
	
	private String type;
	
	private String keyword;

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public Criteria() {
		this(1, 10);
	}
	
	
	public String[] getTypeArr() {
		return type == null? new String[] {}:type.split("");
	}

}
