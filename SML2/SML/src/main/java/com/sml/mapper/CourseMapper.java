package com.sml.mapper;

import java.util.List;

import com.sml.model.CourseCategoryVO;
import com.sml.model.CourseVO;
import com.sml.model.Criteria;

public interface CourseMapper {
	
	public void courseEnroll(CourseVO course);
	
	public List<CourseCategoryVO> cateList();
	
	public List<CourseVO> courseList(Criteria cri);
	
	public int courseTotal(Criteria cri);

}
