package com.yash.omsapp.controller;

import com.yash.omsapp.model.Product;
import com.yash.omsapp.service.CategoryService;
import com.yash.omsapp.service.ProductService;
import com.yash.omsapp.util.Paging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@GetMapping("/products")
	public String list(@RequestParam(required = false) String q, @RequestParam(required = false) Long category,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "12") int size, Model model) {
		List<Product> products = productService.search(q, category, page, size);
		long total = productService.countSearch(q, category);
		model.addAttribute("products", products);
		model.addAttribute("total", total);
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("q", q);
		model.addAttribute("categoryId", category);
		model.addAttribute("categories", categoryService.all());
		return "products";
	}

	@GetMapping("/products/{id}")
	public String detail(@PathVariable Long id, Model model) {
		Product p = productService.get(id);
		if (p == null)
			return "error/404";
		model.addAttribute("p", p);
		return "product-detail";
	}
}
