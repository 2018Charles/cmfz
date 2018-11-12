package com.baizhi.service;

import com.baizhi.dao.CourseDAO;
import com.baizhi.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDAO courseDAO;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Course> findAllCourse() {
        List<Course> courses = courseDAO.queryAllCourse();
        return courses;
    }
}
