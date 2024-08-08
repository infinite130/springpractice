package com.sml.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	
	private int repCode;
	private int commCode;
	private String repContent;
	private Date renrollDate;
	private Date rmodifyDate;
	private String repStatus;
	private int memCode;

}
