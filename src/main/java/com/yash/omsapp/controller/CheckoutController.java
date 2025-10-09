package com.yash.omsapp.controller;

import com.yash.omsapp.model.Product;
import com.yash.omsapp.model.User;
import com.yash.omsapp.service.CartService;
import com.yash.omsapp.service.OrderService;
import com.yash.omsapp.service.UserService;
import com.yash.omsapp.service.ProductService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * This controller handles the checkout process for customers.
 * It shows the cart, suggests products, and places the order.
 */
@Controller
@RequestMapping("/checkout")
public class CheckoutController {

	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;

	@Autowired
	private ProductService productService;

	/**
     * Shows the checkout page with cart items and suggested products.
     * @param model used to pass data to the view
     * @return the checkout.jsp page
     */
	@GetMapping
	public String checkout(Model model) {
		model.addAttribute("cart", cartService.getCart());
		// Add-ons: just pick latest 4 products
		List<Product> suggested = productService.findLatest(4);
		model.addAttribute("suggestedProducts", suggested);

		return "checkout";
	}
	
	/**
     * Places the order for the logged-in user.
     * Clears the cart after successful order placement.
     * If there's an error, shows the checkout page again with error message.
     * @param auth the authentication object to get current user
     * @param model used to pass messages to the view
     * @return success page or back to checkout
     */
	@PostMapping("/place")
	public String place(Authentication auth, Model model) {
		User u = userService.findByUsername(auth.getName());
		if (u == null) {
			return "redirect:/auth/login";
		}
		try {
			orderService.placeOrder(u, cartService.getCart());
			cartService.clear();
			return "order-success";
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			return "checkout";
		}
	}
}
