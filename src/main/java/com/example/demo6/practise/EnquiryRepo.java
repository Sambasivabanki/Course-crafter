package com.example.demo6.practise;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo6.practise.entity.Enquiry;

public interface EnquiryRepo extends JpaRepository<Enquiry, Long> 
{

}
