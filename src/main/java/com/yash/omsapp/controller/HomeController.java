package com.yash.omsapp.controller;

import com.yash.omsapp.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@Autowired
	private CategoryService categoryService;

	@GetMapping("/")
	public String index(Model model) {
		//model.addAttribute("categories", categoryService.all());
		model.addAttribute("categories", categoryService.all());
		return "index";
	}
}