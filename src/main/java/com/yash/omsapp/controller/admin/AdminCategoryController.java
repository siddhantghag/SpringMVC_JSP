package com.yash.omsapp.controller.admin;

import com.yash.omsapp.model.Category;
import com.yash.omsapp.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/categories")
public class AdminCategoryController {

	@Autowired
	private CategoryService categoryService;

	@GetMapping
	public String list(Model model) {
		model.addAttribute("categories", categoryService.all());
		return "admin/category-list";
	}

	@GetMapping("/create")
	public String create(Model model) {
		model.addAttribute("category", new Category());
		return "admin/category-form";
	}

	@PostMapping("/save")
	public String save(@ModelAttribute Category c) {
		categoryService.save(c);
		return "redirect:/admin/categories";
	}

	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model model) {
		model.addAttribute("category", categoryService.get(id));
		return "admin/category-form";
	}

	@PostMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		categoryService.delete(id);
		return "redirect:/admin/categories";
	}
}
