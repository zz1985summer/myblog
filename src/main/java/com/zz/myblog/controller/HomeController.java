package com.zz.myblog.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	@RequestMapping("/user/login")
	public String starter() {

		return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/")
	public String article() {
		return "articles";
	}	
	
	@RequestMapping("/articles")
	public String article2() {
		return "articles";
	}
	
	@RequestMapping("/fail")
	public String fail() {
		return "fail";
	}
	

	@RequestMapping("/home")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/about_me")
	public String aboutme() {
		return "aboutme";
	}	
	
	
	
}
