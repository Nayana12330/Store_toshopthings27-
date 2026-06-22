package com.store1.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.store1.model.entity.User;
import com.store1.service.UserService;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	User user = new User();

    	user.setName(request.getParameter("name"));
    	user.setEmail(request.getParameter("email"));
    	user.setPassword(request.getParameter("password"));
    	user.setPhone(request.getParameter("phone"));
    	user.setAddressLine(request.getParameter("addressLine"));
    	user.setCity(request.getParameter("city"));
    	user.setState(request.getParameter("state"));
    	user.setPincode(request.getParameter("pincode"));
    	
        userService.registerUser(user);

        response.sendRedirect("login.jsp");
    }
}