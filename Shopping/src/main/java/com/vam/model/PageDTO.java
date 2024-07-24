package com.vam.model;

import lombok.Data;

@Data
public class PageDTO {
	
	private int pageStart;
	
	private int pageEnd;
	
	private boolean next, prev;
	
	private int total;
	
	private Criteria cri;

	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.pageEnd = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		
		this.pageStart = this.pageEnd - 9;
		
		int realEnd = (int)(Math.ceil(total*1.0/cri.getAmount()));
		
		if(realEnd < pageEnd) {
			this.pageEnd = realEnd;
		}
		
		this.prev = this.pageStart > 1;
		
		this.next = this.pageEnd < realEnd;
		
	}
	
	

}
