<%@ page import="com.store1.model.entity.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
Product p = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>

<style>
body {
    font-family: 'Segoe UI', sans-serif;
    background: #f5f5f6;
    margin: 0;
}

/* MAIN LAYOUT */
.container {
    display: flex;
    padding: 50px;
    gap: 60px;
}

/* IMAGE */
.image-box img {
    width: 350px;
    height: 450px;
    object-fit: cover;
    border-radius: 10px;
}

/* DETAILS */
.details {
    max-width: 500px;
}

.brand {
    font-size: 18px;
    font-weight: bold;
}

.name {
    font-size: 16px;
    color: #555;
}

.price {
    color: #ff3f6c;
    font-size: 22px;
    font-weight: bold;
    margin: 10px 0;
}

/* RATING */
.rating {
    background: #e8f5e9;
    color: #388e3c;
    padding: 5px 10px;
    display: inline-block;
    border-radius: 5px;
    margin: 10px 0;
}

/* SIZE BOX */
.sizes {
    margin-top: 15px;
}

.size-btn {
    display: inline-block;
    border: 1px solid #ccc;
    padding: 8px 12px;
    margin-right: 8px;
    border-radius: 50%;
    cursor: pointer;
}

.size-btn:hover {
    border-color: #ff3f6c;
    color: #ff3f6c;
}

/* DESCRIPTION */
.desc {
    margin-top: 15px;
    color: #555;
}

/* BUTTON */
button {
    margin-top: 20px;
    padding: 12px;
    width: 220px;
    background: #ff3f6c;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}

button:hover {
    background: #e7335a;
}
.desc h3 {
    margin-top: 20px;
}

.desc ul {
    margin-top: 10px;
    padding-left: 18px;
    color: #555;
}

.desc li {
    margin-bottom: 5px;
}
</style>
</head>

<body>

<div class="container">

    <!-- IMAGE -->
    <div class="image-box">
        <img src="<%=request.getContextPath()%>/images/<%= p.getImage() %>">
    </div>

    <!-- DETAILS -->
    <div class="details">

        <div class="brand"><%= p.getBrand() %></div>
        <div class="name"><%= p.getName() %></div>

        <!-- ⭐ Rating -->
        <div class="rating">⭐ 4.3 | 1.2k Ratings</div>

        <div class="price">₹ <%= p.getPrice() %></div>

        <!-- 📏 Sizes -->
        <div class="sizes">
    <b>Select Size:</b><br><br>

<%
    if(p.getSizes() != null){
        String[] sizeArray = p.getSizes().split(",");
        for(String s : sizeArray){
%>
    <span class="size-btn" onclick="selectSize('<%= s %>', this)">
        <%= s %>
    </span>
<%
        }
    }
%>

</div>

        <!-- 🧾 Description -->
        <div class="desc">
    <h3>Product Details</h3>
    <p><%= p.getDescription() %></p>

    <ul>
        <li>✔ 100% Original Product</li>
        <li>✔ Quality Checked</li>
        <li>✔ Easy 7 Days Return</li>
        <li>✔ Cash on Delivery Available</li>
    </ul>
</div>
        <!-- 🛒 ADD TO CART -->
        <form action="add-to-cart" method="post">
            <input type="hidden" name="id" value="<%= p.getId() %>">
            <input type="hidden" name="name" value="<%= p.getName() %>">
            <input type="hidden" name="price" value="<%= p.getPrice() %>">
            <input type="hidden" name="image" value="<%= p.getImage() %>">
            <input type="hidden" name="size" id="selectedSize">
           
            <button>Add to Cart</button>
        </form>

    </div>

</div>
<script>
function selectSize(size, element) {
    document.getElementById("selectedSize").value = size;

    let buttons = document.querySelectorAll(".size-btn");
    buttons.forEach(btn => {
        btn.style.background = "";
        btn.style.color = "";
    });

    element.style.background = "#ff3f6c";
    element.style.color = "white";
}
</script>
</body>
</html>