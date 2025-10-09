package com.yash.omsapp.controller;

import com.yash.omsapp.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * This controller handles the home page of the application.
 * It loads all product categories and displays them on the index page.
 */
@Controller
public class HomeController {

	@Autowired
	private CategoryService categoryService;

	/**
     * Handles requests to the root URL ("/").
     * Loads all categories and passes them to the index.jsp view.
     * @param model used to pass data to the view
     * @return the index.jsp page
     */
	@GetMapping("/")
	public String index(Model model) {
		//model.addAttribute("categories", categoryService.all());
		model.addAttribute("categories", categoryService.all());
		return "index";
	}
}