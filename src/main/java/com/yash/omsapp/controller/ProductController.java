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


/**
 * This controller handles product listing and product detail pages.
 * Customers can search, filter by category, and view individual product details.
 */
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	/**
     * Displays the list of products.
     * Supports search by keyword, filter by category, and pagination.
     * @param q search keyword (optional)
     * @param category category ID to filter (optional)
     * @param page current page number (default is 1)
     * @param size number of products per page (default is 12)
     * @param model used to pass data to the view
     * @return the products.jsp page
     */
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

	/**
     * Displays the detail page for a single product.
     * If the product is not found, shows a 404 error page.
     * @param id the ID of the product
     * @param model used to pass product data to the view
     * @return the product-detail.jsp page or error page
     */
	@GetMapping("/products/{id}")
	public String detail(@PathVariable Long id, Model model) {
		Product p = productService.get(id);
		if (p == null)
			return "error/404";
		model.addAttribute("p", p);
		return "product-detail";
	}
}
