package com.sml.service;

import java.util.List;

import com.sml.model.CourseApplyDTO;
import com.sml.model.Criteria;

public interface CourseApplyService {
	
	// 수강 신청
	public int applyApply(CourseApplyDTO apply);
	
	// 리스트 보기
//	public List<CourseApplyDTO> applyList(Criteria cri);
//	
//	public int applyTotal(Criteria cri);
}
