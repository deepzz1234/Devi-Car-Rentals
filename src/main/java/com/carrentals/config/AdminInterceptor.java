package com.carrentals.config;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.carrentals.model.Admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {

        HttpSession session =
                request.getSession(false);

        // Check whether admin is logged in
        if (session != null) {

            Admin admin =
                    (Admin) session.getAttribute(
                            "loggedInAdmin"
                    );

            if (admin != null) {

                // Admin is logged in
                return true;
            }
        }

        // Admin is not logged in
        response.sendRedirect(
                request.getContextPath()
                + "/admin-login"
        );

        return false;
    }
}
