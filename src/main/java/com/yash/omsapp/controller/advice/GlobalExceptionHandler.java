package com.yash.omsapp.controller.advice;

import org.slf4j.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * This class handles unexpected errors across the whole application.
 * It catches exceptions and shows a friendly error page.
 */
@ControllerAdvice
public class GlobalExceptionHandler {

	private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	/**
     * This method runs when any unhandled exception occurs.
     * It logs the error and shows a custom error page.
     * @param model used to pass the error message to the view
     * @param ex the exception that was thrown
     * @return the error/500.jsp page
     */
	@ExceptionHandler(Exception.class)
	public String handle(Model model, Exception ex) {
		log.error("Unhandled error", ex);
		model.addAttribute("message", ex.getMessage());
		return "error/500";
	}
}
