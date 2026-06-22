<%@ page import="java.util.List" %>
<%@ page import="com.store1.model.entity.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fashion Store</title>

<style>

/* 🔥 GLOBAL */
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f5f5f6;
}

/* 🔝 HEADER */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: white;
    padding: 15px 40px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.logo {
    font-size: 22px;
    font-weight: bold;
    color: #ff3f6c;
}

.nav a {
    margin: 0 15px;
    text-decoration: none;
    color: black;
    font-weight: 500;
}

/* 🔍 SEARCH */
.search input {
    padding: 8px 12px;
    border-radius: 6px;
    border: 1px solid #ccc;
    width: 250px;
}

/* 📦 LAYOUT */
.main {
    display: flex;
}

/* 🎛 SIDEBAR */
.sidebar {
    width: 230px;
    background: white;
    padding: 20px;
    border-right: 1px solid #ddd;
}

.sidebar h4 {
    margin-top: 15px;
}

.sidebar label {
    display: block;
    margin: 6px 0;
}

.sidebar button {
    margin-top: 15px;
    padding: 8px;
    width: 100%;
    border: none;
    background: #ff3f6c;
    color: white;
    cursor: pointer;
}

/* 🛍 GRID */
.container {
    flex: 1;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    padding: 20px;
}

/* 🧾 CARD */
.card {
    background: white;
    border-radius: 10px;
    overflow: hidden;
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.card img {
    width: 100%;
    height: 250px;
    object-fit: cover;
}

/* 📄 INFO */
.info {
    padding: 10px;
}

.brand {
    font-weight: bold;
}

.name {
    font-size: 14px;
    color: #555;
}

.price {
    font-weight: bold;
    color: #ff3f6c;
}

/* 🛒 BUTTON */
.btn {
    margin-top: 10px;
    padding: 8px;
    width: 100%;
    border: none;
    background: #ff3f6c;
    color: white;
    cursor: pointer;
}

.btn:hover {
    background: #e7335a;
}
/* 🔝 HEADER */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: white;
    padding: 15px 40px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

/* LOGO */
.logo {
    font-size: 22px;
    font-weight: bold;
    color: #ff3f6c;
}

/* NAV */
.nav a {
    margin: 0 15px;
    text-decoration: none;
    color: black;
    font-weight: 500;
}

/* RIGHT SECTION */
.right {
    display: flex;
    align-items: center;
    gap: 15px;
}

/* SEARCH */
.right input {
    padding: 8px 12px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

/* CART */
.cart {
    text-decoration: none;
    background: #ff3f6c;
    color: white;
    padding: 8px 15px;
    border-radius: 6px;
    font-weight: bold;
}

.cart:hover {
    background: #e7335a;
}
.container {
    flex: 1;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 25px;
    padding: 20px;
}

.card {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    transition: 0.3s;
    display: flex;
    flex-direction: column;
}

.card img {
    width: 100%;
    height: 250px;
    object-fit: cover;
}

.info {
    padding: 12px;
}

.brand {
    font-weight: bold;
    font-size: 14px;
}

.name {
    font-size: 13px;
    color: #555;
}

.rating {
    font-size: 12px;
    margin: 5px 0;
    color: #388e3c;
}

.price {
    font-weight: bold;
    color: #ff3f6c;
}

.sizes {
    font-size: 12px;
    margin-top: 5px;
}

.desc {
    font-size: 12px;
    color: #777;
    margin-top: 5px;
    height: 35px;
    overflow: hidden;
}

.btn {
    margin-top: 10px;
    padding: 8px;
    width: 100%;
    border: none;
    background: #ff3f6c;
    color: white;
    cursor: pointer;
}
</style>
</head>

<body>

<!-- 🔝 HEADER -->
<div class="header">

    <!-- 🔥 LOGO -->
    <div class="logo">FashionStore</div>

    <!-- 🔗 NAVIGATION -->
    <div class="nav">
        <a href="#">Men</a>
        <a href="#">Women</a>
        <a href="#">Kids</a>
    </div>

    <!-- 🔍 RIGHT SIDE (SEARCH + CART) -->
    <div class="right">

        <!-- 🔍 SEARCH -->
        <form action="products" method="get">
            <input type="text" name="keyword" placeholder="Search products...">
        </form>

        <!-- 🛒 CART -->
        <a href="cart.jsp" class="cart">
            🛒 Cart
        </a>

    </div>

</div>

<div class="main">

<!-- 🎛 FILTERS -->
<form action="products" method="get" class="sidebar">

    <!-- 👤 GENDER (RADIO ✔) -->
    <h4>Gender</h4>
    <label><input type="radio" name="category" value="" checked> All</label>
    <label><input type="radio" name="category" value="men"> Men</label>
    <label><input type="radio" name="category" value="women"> Women</label>

    <!-- 💰 PRICE -->
    <h4>Price</h4>
    <label><input type="radio" name="price" value="low"> Under ₹500</label>
    <label><input type="radio" name="price" value="mid"> ₹500 - ₹1000</label>
    <label><input type="radio" name="price" value="high"> Above ₹1000</label>

    <!-- 🏷 BRAND -->
    <h4>Brand</h4>
    <label><input type="checkbox" name="brand" value="Nike"> Nike</label>
    <label><input type="checkbox" name="brand" value="Zara"> Zara</label>
    <label><input type="checkbox" name="brand" value="Levis"> Levis</label>

    <button type="submit">Apply Filters</button>

</form>


<!-- 🛍 PRODUCTS -->
<div class="container">

<%
List<Product> products = (List<Product>) request.getAttribute("products");

if (products != null && !products.isEmpty()) {
    for (Product p : products) {
%>

<div class="card">

    <a href="product-details?id=<%= p.getId() %>">
        <img src="<%=request.getContextPath()%>/images/<%= p.getImage() %>">
    </a>

    <div class="info">
        <div class="brand"><%= p.getBrand() %></div>
        <div class="name"><%= p.getName() %></div>

        <!-- ⭐ Rating -->
        <div class="rating">⭐ 4.3 | 1.2k</div>

        <!-- 💰 Price -->
        
        <div class="price">₹ <%= p.getPrice() %></div>

        <!-- 📏 Sizes -->
       
        <div class="sizes">Sizes: S M L XL</div>

        <!-- 🧾 Description -->
        <div class="desc">
            <%= p.getDescription() %>
        </div>

        <!-- 🛒 Add to Cart -->
        <form action="add-to-cart" method="post">
            <input type="hidden" name="id" value="<%= p.getId() %>">
            <input type="hidden" name="name" value="<%= p.getName() %>">
            <input type="hidden" name="price" value="<%= p.getPrice() %>">
            <input type="hidden" name="image" value="<%= p.getImage() %>">

            <button class="btn">Add to Cart</button>
        </form>
    </div>

</div>


<%
    }
} else {
%>
    <h3 style="padding:20px;">No products found</h3>
<%
}
%>

</div>

</div>

</body>
</html>