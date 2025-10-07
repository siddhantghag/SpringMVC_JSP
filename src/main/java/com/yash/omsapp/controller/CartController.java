package com.yash.omsapp.controller;

import com.yash.omsapp.model.Product;
import com.yash.omsapp.service.CartService;
import com.yash.omsapp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;

	@GetMapping
	public String view(Model model) {
		model.addAttribute("cart", cartService.getCart());
		return "cart";
	}

	@PostMapping("/add")
	public String add(@RequestParam Long productId, @RequestParam(defaultValue = "1") int qty) {
		Product p = productService.get(productId);
		if (p != null)
			cartService.add(p, qty);
		return "redirect:/cart";
	}

	@PostMapping("/update")
	public String update(@RequestParam Long productId, @RequestParam int qty) {
		cartService.update(productId, qty);
		return "redirect:/cart";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam Long productId) {
		cartService.remove(productId);
		return "redirect:/cart";
	}
}
