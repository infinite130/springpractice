package com.vam.model;

import java.util.Date;
import lombok.Data;

@Data
public class BookVO {
    
    private int bookId;
    private String bookName;
    private int authorId;
    private String authorName;
    private String publeYear;
    private String publisher; // 수정된 필드
    private String cateCode;
    private String cateName;
    private int bookPrice;
    private int bookStock;
    private double bookDiscount;
    private String bookIntro;
    private String bookContents;
    private Date regDate;
    private Date updateDate;
}
