package com.ureca.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String index() {
		System.out.println(">>> GET index");
		return "index";
	}

//	@GetMapping("/task/listBurning")
//	public String listBurning() {
//		System.out.println(">>> GET listBurning");
//		return "listBurning";
//	}

}
