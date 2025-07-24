//package com.example.demo6.practise.controller;
//
//import java.util.List;
//import java.util.Optional;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.example.demo6.practise.StudentRepo;
//import com.example.demo6.practise.entity.Student;
//
//import jakarta.servlet.http.HttpSession;
//
//
//@Controller
//public class MyController 
//{
//	@Autowired
//	StudentRepo repo;
//	@RequestMapping({"/","/home"})
//	public String home()
//	{
//		return "home.jsp";
//	}
//	@RequestMapping("/index")
//	public String index()
//	{
//		return "index.jsp";
//	}
////	@RequestMapping("/index")
////	public String index1()
////	{
////		return "index.jsp";
////	}
//	@RequestMapping("/register")
//	public String register(Student student,RedirectAttributes re)
//	{
//		Optional<Student> check=repo.findById(student.getEmail());
//		if(check.isPresent())
//		{
//			repo.save(student);//update existing user
//			re.addFlashAttribute("msg","User updated successfully");
//			return "redirect:/allUser";
//		}
//		else { //new registration
//		repo.save(student);
//		return "login.jsp";
//		}
//	}
////	@RequestMapping("/login")
////	public String login()
////	{
////		return "login.jsp";
////	}
//	@RequestMapping("/success")
//	public String success()
//	{
//		return "success.jsp";
//	}
//	@RequestMapping("/validate")
//	public String user(@RequestParam String email,@RequestParam String password,RedirectAttributes re,Model model,HttpSession session)
//	{
//		try
//		{
//			Optional<Student> optional=repo.findById(email);
//			if(optional.isPresent())
//			{
//				Student stu=optional.get();
//				if(stu.getPassword().equalsIgnoreCase(password))
//				{
//					session.setAttribute("user", stu);
//					if("admin".equalsIgnoreCase(stu.getDesig()))
//					{
//						model.addAttribute("user", stu);
//						return "adminHome.jsp";
//					}
//					else
//					{
//						model.addAttribute("user", stu);
//						return "userHome.jsp";
//					}
//		
//				}
//				else
//				{
//					re.addFlashAttribute("msg","Invalidpassword");
//					return "redirect:/login";
//				}
//			}
//			else
//			{
//				re.addFlashAttribute("msg", "Invalidcreditianls");
//				return "redirect:/login";
//			}
//		}
//		catch(Exception ex)
//		{
//			ex.printStackTrace();
//			re.addFlashAttribute("msg","Something went wrong");
//			return "redirect:/login";
//		}
//		
//	}
//	@RequestMapping("/userHome")
//	public String userHome(HttpSession session,Model model)
//	{
//		Student stu=(Student)session.getAttribute("user");
//		if(stu==null)
//		{
//			return "redirect:login";
//		}
//		model.addAttribute("user",stu);
//		return "userHome.jsp";
//	}
//	@RequestMapping("/adminHome")
//	public String adminHome(HttpSession session,Model model)
//	{
//		Student stu=(Student)session.getAttribute("user");
//		if(stu==null)
//		{
//			return "redirect:login";
//		}
//		model.addAttribute("user",stu);
//		return "adminHome.jsp";
//	}
//	@RequestMapping("/logout")
//	public String logout(HttpSession session,RedirectAttributes re)
//	{
//		session.invalidate();
//		re.addFlashAttribute("msg","logout successfully");
//		return "redirect:login";
//	}
//	@RequestMapping("/alluser")
//	public String getUser(Model model)
//	{
//		List<Student> l1=repo.findAll();
//		model.addAttribute("users", l1);
//		return "allUser.jsp";
//	}
//	@RequestMapping("/delete")
//	public String deleteUser(@RequestParam String email,Model model)
//	{
//		repo.deleteById(email);
//		List<Student> l1=repo.findAll();
//		model.addAttribute("users", l1);
//		return "allUser.jsp";
//	}
//	@RequestMapping("/update")
//	public String updateUser(@RequestParam String email,Model model)
//	{
//		Student student=repo.findById(email).get();
//		List<Student> l1=repo.findAll();
//		model.addAttribute("users", l1);
//		model.addAttribute("updateUser",student);
//		return "allUser.jsp";
//	}
//	@RequestMapping("/updateSuccess")
//	public String updateSuccess(Student updatedStudent, RedirectAttributes re) {
//	    Optional<Student> optional = repo.findById(updatedStudent.getEmail());
//	    if (optional.isPresent()) {
//	        Student existing = optional.get();
//	        existing.setFullname(updatedStudent.getFullname());
//	        existing.setDesig(updatedStudent.getDesig());
//	        existing.setPhone(updatedStudent.getPhone());
//	        existing.setGender(updatedStudent.getGender());
//	        repo.save(existing);
//	        re.addFlashAttribute("msg", "User updated successfully");
//	    }
//	    return "redirect:/alluser";
//	}
//
//
//}
