package com.yash.omsapp.controller.admin;

import com.yash.omsapp.model.Category;
import com.yash.omsapp.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * This controller is used by Admin to manage product categories.
 * It supports listing, creating, editing, saving, and deleting categories.
 */
@Controller
@RequestMapping("/admin/categories")
public class AdminCategoryController {

	@Autowired
	private CategoryService categoryService;

	/**
     * Shows the list of all categories.
     * @param model used to pass category data to the view
     * @return the category-list.jsp page
     */
	@GetMapping
	public String list(Model model) {
		model.addAttribute("categories", categoryService.all());
		return "admin/category-list";
	}

	/**
     * Displays the form to create a new category.
     * @param model used to pass a blank category object to the view
     * @return the category-form.jsp page
     */
	@GetMapping("/create")
	public String create(Model model) {
		model.addAttribute("category", new Category());
		return "admin/category-form";
	}

	/**
     * Saves a new or edited category to the database.
     * @param c the category object submitted from the form
     * @return redirects to the category list page
     */
	@PostMapping("/save")
	public String save(@ModelAttribute Category c) {
		categoryService.save(c);
		return "redirect:/admin/categories";
	}

	/**
     * Displays the form to edit an existing category.
     * @param id the ID of the category to edit
     * @param model used to pass the category data to the view
     * @return the category-form.jsp page
     */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model model) {
		model.addAttribute("category", categoryService.get(id));
		return "admin/category-form";
	}

	/**
     * Deletes a category by its ID.
     * @param id the ID of the category to delete
     * @return redirects to the category list page
     */
	@PostMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		categoryService.delete(id);
		return "redirect:/admin/categories";
	}
}
