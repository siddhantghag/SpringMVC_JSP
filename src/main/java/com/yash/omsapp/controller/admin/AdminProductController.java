package com.yash.omsapp.controller.admin;

import com.yash.omsapp.model.Product;
import com.yash.omsapp.service.CategoryService;
import com.yash.omsapp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/products")
public class AdminProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@GetMapping
	public String list(@RequestParam(required = false) String q, @RequestParam(required = false) Long category,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int size, Model model) {
		model.addAttribute("products", productService.search(q, category, page, size));
		model.addAttribute("categories", categoryService.all());
		model.addAttribute("q", q);
		model.addAttribute("categoryId", category);
		return "admin/product-list";
	}

	@GetMapping("/create")
	public String create(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("categories", categoryService.all());
		return "admin/product-form";
	}

	@PostMapping("/save")
	public String save(@ModelAttribute Product p, @RequestParam Long categoryId) {
		p.setCategory(categoryService.get(categoryId));
		productService.save(p);
		return "redirect:/admin/products";
	}

	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model model) {
		model.addAttribute("product", productService.get(id));
		model.addAttribute("categories", categoryService.all());
		return "admin/product-form";
	}

	@PostMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		productService.delete(id);
		return "redirect:/admin/products";
	}
}
