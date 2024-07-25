package com.vam.mapper;

import java.util.List;

import com.vam.model.AttachImageVO;
import com.vam.model.BookVO;
import com.vam.model.CateVO;
import com.vam.model.Criteria;

public interface AdminMapper {
	
	public void bookEnroll(BookVO book);
	
	public List<CateVO> cateList();
	
	public List<BookVO> goodsGetList(Criteria cri);
	
	public int goodsGetTotal(Criteria cri);
	
	public BookVO goodsGetDetail(int bookId);
	
	public int goodsModify(BookVO vo);
	
	public int goodsDelete(int bookId);
	
	/* 이미지 등록 */
	public void imageEnroll(AttachImageVO vo);
	
	/* 지정 상품 이미지 전체 삭제 */
	public void deleteImageAll(int bookId);
	
	/* 어제자 날짜 이미지 리스트 */
	public List<AttachImageVO> checkFileList();
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int bookId);		

}
