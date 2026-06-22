<%@ page import="java.util.*" %>
<%@ page import="com.store1.model.entity.CartItem" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>

<style>

/* 🔥 GLOBAL */
body {
    font-family: 'Segoe UI', sans-serif;
    background: #f5f5f6;
    margin: 0;
}

/* 🔝 HEADER */
.header {
    background: white;
    padding: 15px 30px;
    font-size: 22px;
    font-weight: bold;
    color: #ff3f6c;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

/* 📦 CONTAINER */
.container {
    width: 80%;
    margin: 30px auto;
}

/* 🧾 CART CARD */
.card {
    display: flex;
    align-items: center;
    background: white;
    padding: 15px;
    margin-bottom: 15px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

/* 🖼 IMAGE */
.card img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 10px;
}

/* 📄 INFO */
.info {
    margin-left: 20px;
    flex: 1;
}

.name {
    font-size: 18px;
    font-weight: bold;
}

.price {
    color: #ff3f6c;
    margin-top: 5px;
}

.qty {
    margin-top: 5px;
}

/* 💰 TOTAL */
.total {
    text-align: right;
    font-size: 20px;
    font-weight: bold;
    margin-top: 20px;
}

/* 🛒 BUTTON */
.checkout {
    display: block;
    margin-top: 20px;
    padding: 12px;
    width: 200px;
    background: #ff3f6c;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    float: right;
}

.checkout:hover {
    background: #e7335a;
}

.empty {
    text-align: center;
    font-size: 18px;
    margin-top: 50px;
}
.remove-btn {
    background: #ff3f6c;
    color: white;
    border: none;
    padding: 8px 12px;
    border-radius: 6px;
    cursor: pointer;
    height: 40px;
}

.remove-btn:hover {
    background: #e7335a;
}
.qty button {
    padding: 5px 10px;
    margin: 0 5px;
    border: none;
    background: #ff3f6c;
    color: white;
    cursor: pointer;
}
</style>

</head>

<body>

<div class="header">Your Cart</div>

<div class="container">

<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

if (cart == null || cart.isEmpty()) {
%>
   
    <div class="empty">🛒 Your cart is empty</div>

<%
} else {

    double total = 0;

    for (CartItem item : cart) {

        double price = item.getProduct().getPrice().doubleValue();
        int qty = item.getQuantity();
        total += price * qty;
%>

<div class="card">

    <!-- 🖼 IMAGE (placeholder for now) -->
    <img src="https://via.placeholder.com/150" />
    <div class="qty">

    <!-- ➖ DECREASE -->
    <form action="update-cart" method="post" style="display:inline;">
        <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
        <input type="hidden" name="action" value="decrease">
        <button>-</button>
    </form>

    Quantity: <%= item.getQuantity() %>

    <!-- ➕ INCREASE -->
    <form action="update-cart" method="post" style="display:inline;">
        <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
        <input type="hidden" name="action" value="increase">
        <button>+</button>
    </form>

</div>
    <div class="info">
        <div class="name"><%= item.getProduct().getName() %></div>

        <div class="price">₹ <%= price %></div>

        <div class="qty">Quantity: <%= qty %></div>
    </div>
    <form action="remove-from-cart" method="post">
    <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
    <button style="background:red;color:white;border:none;padding:6px;">Remove</button>
</form>

</div>

<%
    }
%>

<div class="total">
    Total: ₹ <%= total %>
</div>

<button class="checkout">Proceed to Checkout</button>

<%
}
%>

</div>

</body>
</html>