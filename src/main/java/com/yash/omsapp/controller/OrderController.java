package com.yash.omsapp.controller;

import com.yash.omsapp.model.User;
import com.yash.omsapp.service.OrderService;
import com.yash.omsapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * This controller shows the logged-in customer's order history.
 */
@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;

	/**
     * Displays the list of orders placed by the currently logged-in user.
     * @param auth used to get the current user's username
     * @param model used to pass order data to the view
     * @return the orders.jsp page
     */
	@GetMapping("/orders")
	public String myOrders(Authentication auth, Model model) {
		User u = userService.findByUsername(auth.getName());
		model.addAttribute("orders", orderService.myOrders(u));
		return "orders";
	}
}
