package com.example.demo6.practise;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo6.practise.entity.Student;

public interface StudentRepo extends JpaRepository<Student,Long> 
{

}
