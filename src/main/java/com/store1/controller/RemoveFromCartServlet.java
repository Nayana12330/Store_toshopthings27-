package com.store1.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.store1.model.entity.CartItem;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Long productId = Long.parseLong(request.getParameter("productId"));

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            cart.removeIf(item -> item.getProduct().getId().equals(productId));
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}