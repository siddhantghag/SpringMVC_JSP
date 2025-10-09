package com.yash.omsapp.controller;

import com.yash.omsapp.model.User;
import com.yash.omsapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;



/**
 * Controller for handling authentication-related operations such as login and registration.
 * Routes are prefixed with "/auth".
 */
@Controller
@RequestMapping("/auth")
public class AuthController {

    /**
     * Service for managing user registration and authentication logic.
     */
	@Autowired
	private UserService userService;

	/**
     * Displays the login page.
     * If the user is already authenticated, redirects to the home page.
     * @return view name for login or redirect
     */
	@GetMapping("/login")
	public String login() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && auth.isAuthenticated() && !(auth instanceof AnonymousAuthenticationToken)) {
			return "redirect:/";
		}
		return "login";
	}
	
	/**
     * Displays the registration form.
     * @return view name for registration page
     */
	@GetMapping("/register")
	public String registerForm() {
		return "register";
	}

	/**
     * Handles user registration.
     * On success, redirects to login page with success message.
     * On failure, returns to registration page with error message.
     * @param username the username entered by the user
     * @param password the password entered by the user
     * @param model the model to pass attributes to the view
     * @return view name for login or registration
     */
	@PostMapping("/register")
	public String register(@RequestParam String username, @RequestParam String password, Model model) {
		try {
			userService.registerCustomer(username, password);
			model.addAttribute("success", "Registration successful. Please login.");
			return "login";
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			return "register";
		}
	}
}
