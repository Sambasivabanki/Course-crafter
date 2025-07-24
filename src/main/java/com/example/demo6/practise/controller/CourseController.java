	package com.example.demo6.practise.controller;
	
	import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
	
	import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.GetMapping;
	import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo6.practise.CoursesRepo;
import com.example.demo6.practise.EnquiryRepo;
import com.example.demo6.practise.PaymentRepo;
import com.example.demo6.practise.StudentRepo;
import com.example.demo6.practise.entity.Courses;
import com.example.demo6.practise.entity.EmailService;
import com.example.demo6.practise.entity.Enquiry;
import com.example.demo6.practise.entity.Payment;
import com.example.demo6.practise.entity.Student;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
	
	
	
	@Controller
	public class CourseController 
	{
		@Autowired
		CoursesRepo courserepo;
		
		@Autowired
		StudentRepo studentrepo;
		
		@Autowired
		EnquiryRepo enquiryrepo;
		
		@Autowired
		private EmailService emailService;
		
		@Value("${razorpay.key_id}")
		private String razorpayKey;

		@Value("${razorpay.key_secret}")
		private String razorpaySecret;
		
		@Autowired
		private PaymentRepo paymentRepo;
		
		@RequestMapping("/")
		public String home(Model model)
		{
			List<Courses> courseList=courserepo.findAll();
			model.addAttribute("courses",courseList);
			return "home.jsp";
		}
		
//		@GetMapping("/courses")
//		public String getAllCourses(Model model)
//		{
//			 
//			 return "home"; 
//		}
		@GetMapping("/addcourse")
		public String showAddCourseForm(Model model) {
		    model.addAttribute("course", new Courses());
		    return "addCourse.jsp"; 
		}
	
		@PostMapping("/admin/addCourse")
		public String saveCourse(@ModelAttribute Courses course,
		                         @RequestParam("courseImage") MultipartFile file,
		                         HttpServletRequest request) {

		    if (!file.isEmpty()) {
		        String fileName = file.getOriginalFilename();
		        course.setImageName(fileName);  // Save to DB

		        try {
		            // Get real path to the /images/courses/ folder in deployed directory
		            String uploadPath = request.getServletContext().getRealPath("/images/courses/");
		            File uploadDir = new File(uploadPath);
		            if (!uploadDir.exists()) {
		                uploadDir.mkdirs();
		            }

		            File saveFile = new File(uploadDir, fileName);
		            file.transferTo(saveFile);

		        } catch (IOException e) {
		            e.printStackTrace(); // You can log error properly
		        }
		    }

		    courserepo.save(course);
		    return "redirect:/adminHome";
		}

		
		@GetMapping("/adminHome")
		public String showAdminHome(Model model) {
		    model.addAttribute("course", new Courses());
		    model.addAttribute("courses", courserepo.findAll());
		    return "adminHome.jsp";
		}
		@GetMapping("/loginpage")
		public String loginPage()
		{
			return "login.jsp";
		}
		@PostMapping("/doLogin")
		public String doLogin(@RequestParam String email,@RequestParam String password,HttpSession session,Model model)
		{
			if(email.equals("admin@gmail.com")&&password.equals("123"))
			{
				session.setAttribute("email", email);
				session.setAttribute("role", "ADMIN");
				return "redirect:/adminHome";
			}
			else
			{
				model.addAttribute("error", "Invalid credentials");
		        return "login.jsp";
			}
			
	
		}
		@GetMapping("/logout")
		public String logout(HttpSession session) {
		    session.invalidate(); 
		    return "login.jsp"; 
		}
		
		@PostMapping("/admin/updateCourse")
		public String showUpdateForm(@RequestParam Long courseId,
		                             @RequestParam String courseName,
		                             @RequestParam String description,
		                             @RequestParam String startDate,
		                             @RequestParam double price,
		                             @RequestParam String imageName,
		                             Model model) {
		    Courses course = new Courses(courseId, courseName, description, startDate, price, imageName);
		    model.addAttribute("course", course);
		    return "/courseUpdateForm.jsp"; // This JSP will have editable form fields
		}

		
		@PostMapping("/admin/saveUpdatedCourse")
		public String saveUpdatedCourse(@RequestParam Long courseId,
		                                @RequestParam String courseName,
		                                @RequestParam String description,
		                                @RequestParam String startDate,
		                                @RequestParam double price,
		                                @RequestParam("courseImage") MultipartFile file,
		                                @RequestParam String oldImageName,
		                                HttpServletRequest request) {

		    Courses course = courserepo.findById(courseId).orElseThrow();

		    course.setCourseName(courseName);
		    course.setDescription(description);
		    course.setStartDate(startDate);
		    course.setPrice(price);

		    if (!file.isEmpty()) {
		        String fileName = file.getOriginalFilename();
		        course.setImageName(fileName);
		        try {
		            String uploadPath = request.getServletContext().getRealPath("/images/courses/");
		            File uploadDir = new File(uploadPath);
		            if (!uploadDir.exists()) {
		                uploadDir.mkdirs();
		            }
		            file.transferTo(new File(uploadDir, fileName));
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		    } else {
		        course.setImageName(oldImageName); // Retain old image
		    }

		    courserepo.save(course);
		    return "redirect:/adminHome";
		}

		
		@PostMapping("/deleteCourse")
		public String deleteCourse(@RequestParam("courseId") long courseId)
		{
			courserepo.deleteById(courseId);
			return "redirect:/adminHome";
		}
		

		
		@GetMapping("/enroll/{id}")
		public String showEnrollForm(@PathVariable("id") Long id, Model model) {
		    Courses course = courserepo.findById(id).orElseThrow();
		    model.addAttribute("course", course);
		    return "/enroll.jsp"; // should match enroll.jsp without .jsp extension
		}


		@PostMapping("/enroll")
		public String handleEnrollment(@RequestParam String studentName,
		                               @RequestParam String email,
		                               @RequestParam String phone,
		                               @RequestParam Long courseId) {
		    // Fetch course
		    Courses course = courserepo.findById(courseId).orElseThrow();

		    // Create and save student
		    Student student = new Student();
		    student.setStudentName(studentName);
		    student.setEmail(email);
		    student.setPhone(phone);
		    student.setCourses(course);
		    student.setFeepaid(false);  // Initial value: not paid
		    Student savedStudent = studentrepo.save(student); // Capture saved student to get ID

		    // Send email with payment link and PDF
		    emailService.sendEnrollmentConfirmationWithPaymentLink(
		        email,
		        course.getCourseName(),
		        studentName,
		        savedStudent.getId()
		    );

//		    return "redirect:/enrollment-success";
		    return "enrollment-success.jsp";
		}

		
		@GetMapping("/enrolledStudents")
		public String showEnrolledStudents(Model model)
		{
			List<Student> students=studentrepo.findAll();
			model.addAttribute("students",students);
			return "enrolledStudents.jsp";
		}
		
		@GetMapping("/admin/editStudent/{id}")
		public String editStudentForm(@PathVariable Long id, Model model) {
		    Student student = studentrepo.findById(id).orElseThrow();
		    List<Courses> courses = courserepo.findAll();
		    model.addAttribute("student", student);
		    model.addAttribute("courses", courses);
		    return "/editStudent.jsp";
		}

		@PostMapping("/admin/updateStudent")
		public String updateStudent(@ModelAttribute Student student) {
		    studentrepo.save(student);
		    return "redirect:/enrolledStudents";
		}

		@GetMapping("/admin/deleteStudent/{id}")
		public String deleteStudent(@PathVariable Long id) {
		    studentrepo.deleteById(id);
		    return "redirect:/enrolledStudents";
		}
		@PostMapping("/submitEnquiry")
		public String submitEnquiry(@ModelAttribute Enquiry enquiry, RedirectAttributes redirectAttributes) {
		    enquiryrepo.save(enquiry);
		    redirectAttributes.addFlashAttribute("success", "Thank you! Your enquiry has been submitted.");
		    return "redirect:/#contact";  // Assumes anchor tag with id="contact"
		}

		@GetMapping("/admin/enquiries")
		public String viewEnquiries(Model model) {
		    List<Enquiry> enquiries = enquiryrepo.findAll();
		    model.addAttribute("enquiries", enquiries);
		    return "/viewEnquiries.jsp";
		}
		
		@GetMapping("/pay/{id}")
		public String pay(@PathVariable Long id, Model model) {
		    Student student = studentrepo.findById(id).orElseThrow();
		    model.addAttribute("student", student);
		    model.addAttribute("razorpayKey", razorpayKey); // Injected from properties
		    return "/razorpayPayment.jsp";
		}
		
		@GetMapping("/payment-success/{studentId}")
		public String updatePaymentStatus(@PathVariable("studentId") Long id) {
		    Student student = studentrepo.findById(id).orElseThrow();
		    student.setFeepaid(true);
		    studentrepo.save(student);

		    emailService.sendPaymentSuccessMail(
		        student.getEmail(),
		        student.getCourses().getCourseName(),
		        student.getStudentName()
		    );

		    return "/paymentSuccess.jsp";
		}

		
		@GetMapping("/admin/paidStudents")
		public String showPaidStudents(Model model) {
		    List<Payment> payments = paymentRepo.findAll();
		    model.addAttribute("payments", payments);
		    return "/paidStudents.jsp";
		}

	}
