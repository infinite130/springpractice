package com.sml.service;

import java.util.List;

import com.sml.model.CourseCategoryVO;
import com.sml.model.CourseVO;
import com.sml.model.Criteria;

public interface CourseService {
	
	public void courseEnroll(CourseVO course);
	
	public List<CourseCategoryVO> cateList();
	
	public List<CourseVO> courseList(Criteria cri);
	
	public int courseTotal(Criteria cri);
	
	public CourseVO courseDetail(int courseCode);
	
	public int courseModify(CourseVO course) throws Exception;
	
	public int courseDelete(int courseCode);
	
	public CourseVO courseApplyDetail(int courseCode);

}
