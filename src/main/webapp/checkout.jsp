<%@ page import="java.util.*" %>
<%@ page import="com.store1.model.entity.CartItem" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

double total = 0;
if(cart != null){
    for(CartItem item : cart){
        total += item.getProduct().getPrice().doubleValue() * item.getQuantity();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>

<style>
body {
    font-family: 'Segoe UI';
    background: #f5f5f6;
}

.container {
    width: 80%;
    margin: 40px auto;
    display: flex;
    gap: 20px;
}

/* LEFT FORM */
.form-box {
    width: 60%;
    background: white;
    padding: 20px;
    border-radius: 10px;
}

input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
}

/* RIGHT SUMMARY */
.summary {
    width: 40%;
    background: white;
    padding: 20px;
    border-radius: 10px;
}

.total {
    font-size: 20px;
    font-weight: bold;
}

button {
    width: 100%;
    padding: 12px;
    background: #ff3f6c;
    color: white;
    border: none;
    margin-top: 20px;
}
</style>
</head>

<body>

<div class="container">

    <!-- 🧾 FORM -->
    <div class="form-box">
        <h2>Shipping Details</h2>

        <form action="place-order" method="post">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="text" name="address" placeholder="Address" required>
            <input type="text" name="phone" placeholder="Phone" required>

            <button type="submit">Place Order</button>
        </form>
    </div>

    <!-- 💰 SUMMARY -->
    <div class="summary">
        <h3>Order Summary</h3>

        <%
        if(cart != null){
            for(CartItem item : cart){
        %>
            <p><%= item.getProduct().getName() %> × <%= item.getQuantity() %></p>
        <%
            }
        }
        %>

        <hr>

        <div class="total">Total: ₹ <%= total %></div>
    </div>

</div>

</body>
</html>