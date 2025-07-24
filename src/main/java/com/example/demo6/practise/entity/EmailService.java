package com.example.demo6.practise.entity;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailsender;

    // Email with PDF and Payment Link
    public void sendEnrollmentConfirmationWithPaymentLink(String toEmail, String courseName, String studentName, Long studentId) {
        MimeMessage message = mailsender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(toEmail);
            helper.setSubject("Course Enrollment - Payment Pending");
            helper.setFrom("sivasambabanki03@gmail.com");

            String paymentUrl = "http://localhost:8080/pay/" + studentId;
            String body = "Dear " + studentName + ",\n\n"
                    + "You have successfully enrolled in the course: " + courseName + ".\n\n"
                    + "Please find the attached course material and click the link below to complete your payment:\n"
                    + paymentUrl + "\n\n"
                    + "Thank you for enrolling!\n\nCourseCrafter Team";

            helper.setText(body);

            // Attach course PDF
            String pdfFileName = getPdfFileName(courseName);
            String pdfPath = "src/main/resources/static/pdfs/" + pdfFileName;

            File pdfFile = new File(pdfPath);
            if (pdfFile.exists()) {
                FileSystemResource file = new FileSystemResource(pdfFile);
                helper.addAttachment(pdfFileName, file);
            } else {
                System.out.println("PDF not found for course: " + courseName);
            }

            mailsender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    // Email after successful payment
    public void sendPaymentSuccessMail(String toEmail, String courseName, String studentName) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Payment Successful - Course Enrolled");
        message.setText("Dear " + studentName + ",\n\n"
                + "Your payment for the course '" + courseName + "' was successful.\n\n"
                + "You are now fully enrolled.\n\n"
                + "CourseCrafter Team");
        message.setFrom("sivasambabanki03@gmail.com");

        mailsender.send(message);
    }

    // Maps course name to corresponding PDF filename
    private String getPdfFileName(String courseName) {
        courseName = courseName.toLowerCase().replaceAll("\\s+", "");

        if (courseName.contains("javafullstack")) {
            return "JavaFullStack.pdf";
        } else if (courseName.contains("pythonfullstack")) {
            return "PythonFullStack.pdf";
        } else if (courseName.contains("webdevelopment")) {
            return "WebDevelopment.pdf";
        } else if (courseName.contains("meanstack") || courseName.contains("mean")) {
            return "mean.pdf";
        } else if (courseName.contains("mernstack") || courseName.contains("mern")) {
            return "mern.pdf";
        } else if (courseName.contains("java")) {
            return "Java.pdf";
        } else if (courseName.contains("python")) {
            return "Python.pdf";
        } else if (courseName.contains("c")) {
            return "C.pdf";
        } else {
            return "default.pdf"; // fallback option
        }
    }
}
