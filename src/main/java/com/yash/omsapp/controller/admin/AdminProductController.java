package com.yash.omsapp.controller.admin;

import com.yash.omsapp.model.Product;
import com.yash.omsapp.service.CategoryService;
import com.yash.omsapp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * This controller is used by Admin to manage products.
 * It supports listing, creating, editing, saving, and deleting products.
 */
@Controller
@RequestMapping("/admin/products")
public class AdminProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	/**
     * Shows the list of products with optional search and category filter.
     * Supports pagination.
     * @param q search keyword (optional)
     * @param category category ID to filter (optional)
     * @param page current page number (default is 1)
     * @param size number of products per page (default is 20)
     * @param model used to pass data to the view
     * @return the product-list.jsp page
     */
	@GetMapping
	public String list(@RequestParam(required = false) String q, @RequestParam(required = false) Long category,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int size, Model model) {
		model.addAttribute("products", productService.search(q, category, page, size));
		model.addAttribute("categories", categoryService.all());
		model.addAttribute("q", q);
		model.addAttribute("categoryId", category);
		return "admin/product-list";
	}

	/**
     * Displays the form to create a new product.
     * @param model used to pass a blank product and category list to the view
     * @return the product-form.jsp page
     */
	@GetMapping("/create")
	public String create(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("categories", categoryService.all());
		return "admin/product-form";
	}

	/**
     * Saves a new or edited product to the database.
     * Sets the selected category before saving.
     * @param p the product object submitted from the form
     * @param categoryId the ID of the selected category
     * @return redirects to the product list page
     */
	@PostMapping("/save")
	public String save(@ModelAttribute Product p, @RequestParam Long categoryId) {
		p.setCategory(categoryService.get(categoryId));
		productService.save(p);
		return "redirect:/admin/products";
	}

	/**
     * Displays the form to edit an existing product.
     * @param id the ID of the product to edit
     * @param model used to pass product and category data to the view
     * @return the product-form.jsp page
     */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model model) {
		model.addAttribute("product", productService.get(id));
		model.addAttribute("categories", categoryService.all());
		return "admin/product-form";
	}
	
	/**
     * Deletes a product by its ID.
     * @param id the ID of the product to delete
     * @return redirects to the product list page
     */
	@PostMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		productService.delete(id);
		return "redirect:/admin/products";
	}
}
