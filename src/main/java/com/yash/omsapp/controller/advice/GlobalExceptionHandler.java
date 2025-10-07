package com.yash.omsapp.controller.advice;

import org.slf4j.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@ControllerAdvice
public class GlobalExceptionHandler {

	private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	@ExceptionHandler(Exception.class)
	public String handle(Model model, Exception ex) {
		log.error("Unhandled error", ex);
		model.addAttribute("message", ex.getMessage());
		return "error/500";
	}
}
