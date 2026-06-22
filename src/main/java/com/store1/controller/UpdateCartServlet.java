package com.store1.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.store1.model.entity.CartItem;

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Long productId = Long.parseLong(request.getParameter("productId"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            for (CartItem item : cart) {

                if (item.getProduct().getId().equals(productId)) {

                    if ("increase".equals(action)) {
                        item.setQuantity(item.getQuantity() + 1);
                    }

                    if ("decrease".equals(action)) {
                        int qty = item.getQuantity() - 1;

                        if (qty <= 0) {
                            cart.remove(item);
                        } else {
                            item.setQuantity(qty);
                        }
                        break;
                    }
                }
            }
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}