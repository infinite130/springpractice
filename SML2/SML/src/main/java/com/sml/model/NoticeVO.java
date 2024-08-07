package com.sml.model;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
     
	private int noticeCode;
	private int memCode;
	private int categoryCode;
	private String noticeTitle;
	private String noticeBody;
	private Date noticeEnroll;
	private Date noticeModify;
	private int noticeLike;
	private int noticeStatus;
	private int noticeCount;
	
}
