package com.store1.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.store1.model.entity.CartItem;
import com.store1.model.entity.Product;
import com.store1.service.ProductService;

@WebServlet("/add-to-cart")
public class CartServlet extends HttpServlet {

    private ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Long productId = Long.parseLong(request.getParameter("id"));

        String image = request.getParameter("image");
        String size = request.getParameter("size");

        // ✅ First fetch product
        Product product = productService.getProductById(productId);

        // ❗ Safety check
        if (product == null) {
            response.sendRedirect("products");
            return;
        }

        HttpSession session = request.getSession();

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;

        for (CartItem ci : cart) {
            // ✅ Check BOTH product + size
            if (ci.getProduct().getId().equals(productId)
                    && ci.getSize() != null
                    && ci.getSize().equals(size)) {

                ci.setQuantity(ci.getQuantity() + 1);
                found = true;
                break;
            }
        }

        // ✅ Add new item if not found
        if (!found) {
            CartItem item = new CartItem(product, 1, image);
            item.setSize(size);

            cart.add(item);
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp"); // better UX
    }
}