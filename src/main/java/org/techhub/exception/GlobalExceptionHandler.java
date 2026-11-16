
package org.techhub.exception;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger LOGGER =
            Logger.getLogger(GlobalExceptionHandler.class.getName());

    // Handle database constraint errors
    @ExceptionHandler(DataIntegrityViolationException.class)
    public String handleDatabaseException(
            DataIntegrityViolationException exception,
            Model model) {

        LOGGER.log(Level.SEVERE,
                "Database constraint error occurred", exception);

        model.addAttribute(
                "errorMessage",
                "This operation could not be completed because the data conflicts with existing records.");

        return "error/error-page";
    }

    // Handle invalid URL parameter types
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public String handleTypeMismatchException(
            MethodArgumentTypeMismatchException exception,
            Model model) {

        LOGGER.log(Level.WARNING,
                "Invalid request parameter received", exception);

        model.addAttribute(
                "errorMessage",
                "Invalid request information. Please check the entered details.");

        return "error/error-page";
    }

    // Handle unexpected application errors
    @ExceptionHandler(Exception.class)
    public String handleGeneralException(
            Exception exception,
            Model model) {

        LOGGER.log(Level.SEVERE,
                "Unexpected application error occurred", exception);

        model.addAttribute(
                "errorMessage",
                "Something went wrong. Please try again later.");

        return "error/error-page";
    }
}
