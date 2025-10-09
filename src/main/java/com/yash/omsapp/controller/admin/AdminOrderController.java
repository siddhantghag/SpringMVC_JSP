package com.yash.omsapp.controller.admin;

import com.yash.omsapp.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * This controller is used by Admin to manage customer orders.
 * It allows viewing all orders and updating their status.
 */
@Controller
@RequestMapping("/admin/orders")
public class AdminOrderController {

	@Autowired
	private OrderService orderService;

	/**
     * Shows a paginated list of all orders.
     * @param page current page number (default is 1)
     * @param size number of orders per page (default is 20)
     * @param model used to pass data to the view
     * @return the order-list.jsp page
     */
	@GetMapping
	public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int size,
			Model model) {
		model.addAttribute("orders", orderService.all(page, size));
		model.addAttribute("total", orderService.countAll());
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		return "admin/order-list";
	}

	/**
     * Updates the status of a specific order.
     * @param id the ID of the order to update
     * @param status the new status to set (e.g., "SHIPPED", "DELIVERED")
     * @return redirects to the order list page
     */
	@PostMapping("/status/{id}")
	public String update(@PathVariable Long id, @RequestParam String status) {
		orderService.updateStatus(id, status);
		return "redirect:/admin/orders";
	}
}
