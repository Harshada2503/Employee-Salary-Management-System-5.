
package org.techhub.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminAuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {

        HttpSession session = request.getSession(false);

        // Check whether admin is logged in
        if (session == null
                || session.getAttribute("adminId") == null) {

            // Redirect to Admin Login page
            response.sendRedirect(
                    request.getContextPath() + "/admin/login");

            return false;
        }

        // Allow access if admin is logged in
        return true;
    }
}
