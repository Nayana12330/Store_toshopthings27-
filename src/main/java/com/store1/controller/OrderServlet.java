package com.store1.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.store1.model.entity.CartItem;
import com.store1.model.entity.Order;
import com.store1.service.OrderService;

@WebServlet("/place-order")
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrderService orderService = new OrderService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // 🔥 DEBUG (check servlet working)
        System.out.println("🔥 OrderServlet called");

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        // ✅ IMPORTANT FIX (avoid crash)
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        double total = 0;

        for (CartItem item : cart) {
            total += item.getProduct().getPrice().doubleValue() * item.getQuantity();
        }

        // ✅ Create Order object
        Order order = new Order();
        order.setName(name);
        order.setAddress(address);
        order.setPhone(phone);
        order.setTotal(total);

        // ✅ Save to DB
        orderService.placeOrder(order);

        // ✅ Clear cart
        session.removeAttribute("cart");

        // ✅ Redirect to success page
        response.sendRedirect("success.jsp");
    }
}