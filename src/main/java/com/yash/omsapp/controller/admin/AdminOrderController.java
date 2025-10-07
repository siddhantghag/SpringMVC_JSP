package com.yash.omsapp.controller.admin;

import com.yash.omsapp.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/orders")
public class AdminOrderController {

	@Autowired
	private OrderService orderService;

	@GetMapping
	public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int size,
			Model model) {
		model.addAttribute("orders", orderService.all(page, size));
		model.addAttribute("total", orderService.countAll());
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		return "admin/order-list";
	}

	@PostMapping("/status/{id}")
	public String update(@PathVariable Long id, @RequestParam String status) {
		orderService.updateStatus(id, status);
		return "redirect:/admin/orders";
	}
}
