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

	@GetMapping
	public String checkout(Model model) {
		model.addAttribute("cart", cartService.getCart());
		// Add-ons: just pick latest 4 products
		List<Product> suggested = productService.findLatest(4);
		model.addAttribute("suggestedProducts", suggested);

		return "checkout";
	}

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
