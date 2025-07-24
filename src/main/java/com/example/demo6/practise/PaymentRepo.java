package com.example.demo6.practise;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo6.practise.entity.Payment;

public interface PaymentRepo extends JpaRepository<Payment, Long>
{

}
