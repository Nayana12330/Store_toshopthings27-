package com.store1.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.store1.model.entity.User;
import com.store1.service.UserService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔥 DEBUG PRINT (VERY IMPORTANT)
        System.out.println("🔥 Login servlet called");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Email: " + email);
        System.out.println("Password: " + password);

        User user = userService.login(email, password);

        if (user != null) {
            System.out.println("✅ User found: " + user.getName());

            HttpSession oldSession = request.getSession(false);

            Object cart = null;

            if (oldSession != null) {
                cart = oldSession.getAttribute("cart");
                oldSession.invalidate();
            }

            HttpSession newSession = request.getSession(true);

            newSession.setAttribute("user", user);

            if (cart != null) {
                newSession.setAttribute("cart", cart);
            }

            response.sendRedirect("products");

        } else {
            System.out.println("❌ Invalid login");

            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}