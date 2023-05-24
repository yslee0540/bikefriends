package com.spring.bf.course;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CourseDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(CourseVO vo) {
		int result = my.insert("course.insert", vo);
		return result;
	}
	
	public int insert2(CourseVO vo) {
		int result = my.insert("course.insert2", vo);
		return result;
	}
	
	public int delete(int course_no) {
		int result = my.delete("course.delete", course_no);
		return result;
	}
	
	public int update(CourseVO vo) {
		int result = my.update("course.update", vo);
		return result;
	}
	
	public int update2(CourseVO vo) {
		int result = my.update("course.update2", vo);
		return result;
	}
	
	public CourseVO one(int course_no) {
		CourseVO vo = my.selectOne("course.one", course_no);
		return vo;
	}
	
	public List<CourseVO> list(CourseVO vo) {
		List<CourseVO> list = my.selectList("course.list", vo);
		return list;
	}

	public List<CourseVO> search(String title) {
		List<CourseVO> list = my.selectList("course.search", title);
		return list;
	}
	
}
