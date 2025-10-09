package com.yash.omsapp.controller;

import com.yash.omsapp.model.Product;
import com.yash.omsapp.service.CartService;
import com.yash.omsapp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * This controller handles all cart-related actions for the customer.
 * It allows viewing the cart, adding products, updating quantities, and removing items.
 */
@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;

	
	/**
     * Shows the cart page with all items added by the user.
     * @param model used to pass cart data to the view
     * @return the cart.jsp page
     */
	@GetMapping
	public String view(Model model) {
		model.addAttribute("cart", cartService.getCart());
		return "cart";
	}

	/**
     * Adds a product to the cart.
     * If no quantity is given, it adds 1 by default.
     * @param productId the ID of the product to add
     * @param qty the quantity to add
     * @return redirects back to the cart page
     */
	@PostMapping("/add")
	public String add(@RequestParam Long productId, @RequestParam(defaultValue = "1") int qty) {
		Product p = productService.get(productId);
		if (p != null)
			cartService.add(p, qty);
		return "redirect:/cart";
	}
	
	
	/**
     * Updates the quantity of a product already in the cart.
     * @param productId the ID of the product to update
     * @param qty the new quantity
     * @return redirects back to the cart page
     */
	@PostMapping("/update")
	public String update(@RequestParam Long productId, @RequestParam int qty) {
		cartService.update(productId, qty);
		return "redirect:/cart";
	}

	
	 /**
     * Removes a product from the cart.
     * @param productId the ID of the product to remove
     * @return redirects back to the cart page
     */
	@PostMapping("/remove")
	public String remove(@RequestParam Long productId) {
		cartService.remove(productId);
		return "redirect:/cart";
	}
}
