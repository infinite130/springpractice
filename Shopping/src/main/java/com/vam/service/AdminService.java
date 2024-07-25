package com.vam.service;

import java.util.List;

import com.vam.model.AttachImageVO;
import com.vam.model.BookVO;
import com.vam.model.CateVO;
import com.vam.model.Criteria;

public interface AdminService {
	
	public void bookEnroll(BookVO book);
	
	public List<CateVO> cateList();
	
	public List<BookVO> goodsGetList(Criteria cri);
	
	public int goodsGetTotal(Criteria cri);

	public BookVO goodsGetDetail(int bookId);
	
	public int goodsModify(BookVO vo);
	
	public int goodsDelete(int bookId);
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int bookId);		
}
