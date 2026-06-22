package com.store1.controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.store1.model.entity.Product;
import com.store1.service.ProductService;

@WebServlet("/product-details")
public class ProductDetailsServlet extends HttpServlet {

    private ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, jakarta.servlet.ServletException {

        Long id = Long.parseLong(request.getParameter("id"));

        Product product = productService.getProductById(id);

        request.setAttribute("product", product);

        request.getRequestDispatcher("product-details.jsp").forward(request, response);
    }
}