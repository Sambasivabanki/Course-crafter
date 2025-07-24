package com.example.demo6.practise;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo6.practise.entity.Courses;

public interface CoursesRepo extends JpaRepository<Courses, Long>
{

}
