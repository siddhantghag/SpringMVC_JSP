package com.yash.omsapp.controller;

import com.yash.omsapp.model.User;
import com.yash.omsapp.service.OrderService;
import com.yash.omsapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;

	@GetMapping("/orders")
	public String myOrders(Authentication auth, Model model) {
		User u = userService.findByUsername(auth.getName());
		model.addAttribute("orders", orderService.myOrders(u));
		return "orders";
	}
}
