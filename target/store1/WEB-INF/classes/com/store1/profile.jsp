<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - Shop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            min-height: 100vh;
        }

        /* ── Sidebar ── */
        .sidebar {
            width: 80px;
            background-color: #ffffff;
            border-right: 1px solid #e8e8e8;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
            position: fixed;
            height: 100vh;
            top: 0;
            left: 0;
            z-index: 100;
        }

        .sidebar-logo {
            font-size: 22px;
            font-weight: 800;
            color: #5b21b6;
            margin-bottom: 40px;
            letter-spacing: -1px;
        }

        .sidebar-nav {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            width: 100%;
        }

        .nav-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 12px 0;
            width: 100%;
            cursor: pointer;
            text-decoration: none;
            color: #aaa;
            font-size: 11px;
            transition: color 0.2s;
        }

        .nav-item i {
            font-size: 20px;
            margin-bottom: 4px;
        }

        .nav-item:hover,
        .nav-item.active {
            color: #5b21b6;
        }

        /* ── Top Header ── */
        .main-wrapper {
            margin-left: 80px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .top-header {
            background: #ffffff;
            padding: 16px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #e8e8e8;
            position: sticky;
            top: 0;
            z-index: 50;
        }

        .header-title {
            font-size: 22px;
            font-weight: 800;
            color: #5b21b6;
        }

        .cart-btn {
            background: #5b21b6;
            color: #fff;
            border: none;
            padding: 10px 22px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            transition: background 0.2s;
        }

        .cart-btn:hover {
            background: #4c1d95;
        }

        /* ── Page Content ── */
        .content {
            padding: 40px;
            flex: 1;
        }

        .page-heading {
            font-size: 26px;
            font-weight: 700;
            color: #1a1a2e;
            margin-bottom: 6px;
        }

        .page-subheading {
            color: #888;
            font-size: 14px;
            margin-bottom: 36px;
        }

        /* ── Profile Card ── */
        .profile-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 40px;
            display: flex;
            align-items: center;
            gap: 36px;
            box-shadow: 0 2px 16px rgba(91,33,182,0.07);
            margin-bottom: 36px;
        }

        .avatar-wrapper {
            position: relative;
            flex-shrink: 0;
        }

        .avatar {
            width: 110px;
            height: 110px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #5b21b6;
        }

        .avatar-placeholder {
            width: 110px;
            height: 110px;
            border-radius: 50%;
            background: linear-gradient(135deg, #5b21b6, #7c3aed);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 42px;
            color: #fff;
            font-weight: 700;
            border: 4px solid #5b21b6;
        }

        .avatar-edit-btn {
            position: absolute;
            bottom: 4px;
            right: 4px;
            background: #5b21b6;
            border: 2px solid #fff;
            color: #fff;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 12px;
        }

        .profile-info h2 {
            font-size: 24px;
            font-weight: 700;
            color: #1a1a2e;
            margin-bottom: 4px;
        }

        .profile-info .email {
            color: #888;
            font-size: 14px;
            margin-bottom: 16px;
        }

        .profile-badge {
            display: inline-block;
            background: #ede9fe;
            color: #5b21b6;
            font-size: 12px;
            font-weight: 600;
            padding: 4px 14px;
            border-radius: 20px;
        }

        /* ── Stats Row ── */
        .stats-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 36px;
        }

        .stat-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 24px 28px;
            box-shadow: 0 2px 16px rgba(91,33,182,0.07);
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .stat-icon {
            width: 52px;
            height: 52px;
            border-radius: 14px;
            background: #ede9fe;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            color: #5b21b6;
            flex-shrink: 0;
        }

        .stat-label {
            font-size: 13px;
            color: #888;
            margin-bottom: 4px;
        }

        .stat-value {
            font-size: 22px;
            font-weight: 700;
            color: #1a1a2e;
        }

        /* ── Details Grid ── */
        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 28px;
        }

        .details-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 32px;
            box-shadow: 0 2px 16px rgba(91,33,182,0.07);
        }

        .card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .card-title {
            font-size: 17px;
            font-weight: 700;
            color: #1a1a2e;
        }

        .edit-link {
            font-size: 13px;
            color: #5b21b6;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .edit-link:hover {
            color: #4c1d95;
        }

        /* ── Form Fields ── */
        .field-group {
            margin-bottom: 18px;
        }

        .field-label {
            font-size: 12px;
            font-weight: 600;
            color: #aaa;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
        }

        .field-value {
            font-size: 15px;
            color: #1a1a2e;
            font-weight: 500;
        }

        .field-input {
            width: 100%;
            padding: 10px 14px;
            border: 1.5px solid #e0e0e0;
            border-radius: 10px;
            font-size: 14px;
            color: #1a1a2e;
            background: #fafafa;
            outline: none;
            transition: border-color 0.2s;
        }

        .field-input:focus {
            border-color: #5b21b6;
            background: #fff;
        }

        .divider {
            border: none;
            border-top: 1px solid #f0f0f0;
            margin: 18px 0;
        }

        /* ── Save Button ── */
        .save-btn {
            background: #5b21b6;
            color: #fff;
            border: none;
            padding: 12px 28px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.2s;
        }

        .save-btn:hover {
            background: #4c1d95;
        }

        /* ── Order List ── */
        .order-item {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 14px 0;
        }

        .order-thumb {
            width: 52px;
            height: 52px;
            border-radius: 12px;
            background: linear-gradient(135deg, #ede9fe, #c4b5fd);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            color: #5b21b6;
            flex-shrink: 0;
        }

        .order-info {
            flex: 1;
        }

        .order-name {
            font-size: 14px;
            font-weight: 600;
            color: #1a1a2e;
        }

        .order-date {
            font-size: 12px;
            color: #aaa;
            margin-top: 2px;
        }

        .order-status {
            font-size: 12px;
            font-weight: 600;
            padding: 4px 12px;
            border-radius: 20px;
        }

        .status-delivered { background: #d1fae5; color: #059669; }
        .status-processing { background: #fef3c7; color: #d97706; }
        .status-shipped { background: #dbeafe; color: #2563eb; }

        /* ── Responsive ── */
        @media (max-width: 900px) {
            .details-grid { grid-template-columns: 1fr; }
            .stats-row { grid-template-columns: 1fr 1fr; }
        }

        @media (max-width: 600px) {
            .content { padding: 20px; }
            .profile-card { flex-direction: column; text-align: center; }
            .stats-row { grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>

    <!-- ══ SIDEBAR ══ -->
    <aside class="sidebar">
        <div class="sidebar-logo">shop</div>
        <nav class="sidebar-nav">
            <a href="home.jsp" class="nav-item">
                <i class="fas fa-home"></i>
                Home
            </a>
            <a href="category.jsp" class="nav-item">
                <i class="fas fa-tshirt"></i>
                Category
            </a>
            <a href="cart.jsp" class="nav-item">
                <i class="fas fa-shopping-cart"></i>
                Cart
            </a>
            <a href="profile.jsp" class="nav-item active">
                <i class="fas fa-user"></i>
                Account
            </a>
        </nav>
    </aside>

    <!-- ══ MAIN WRAPPER ══ -->
    <div class="main-wrapper">

        <!-- Top Header -->
        <header class="top-header">
            <span class="header-title">shop</span>
            <a href="cart.jsp" class="cart-btn">
                <i class="fas fa-shopping-cart"></i> Cart
            </a>
        </header>

        <!-- Page Content -->
        <main class="content">
            <h1 class="page-heading">My Profile</h1>
            <p class="page-subheading">Manage your account details and preferences</p>

            <!-- Profile Hero Card -->
            <div class="profile-card">
                <div class="avatar-wrapper">
                    <c:choose>
                        <c:when test="${not empty user.profileImage}">
                            <img class="avatar" src="${user.profileImage}" alt="Profile Photo">
                        </c:when>
                        <c:otherwise>
                            <div class="avatar-placeholder">
                                ${not empty user.firstName ? user.firstName.charAt(0) : 'U'}
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="avatar-edit-btn" title="Change photo">
                        <i class="fas fa-camera"></i>
                    </div>
                </div>
                <div class="profile-info">
                    <h2>${not empty user.firstName ? user.firstName : 'User'}
                        ${not empty user.lastName ? user.lastName : ''}</h2>
                    <p class="email">${not empty user.email ? user.email : 'user@example.com'}</p>
                    <span class="profile-badge"><i class="fas fa-crown"></i> Premium Member</span>
                </div>
            </div>

            <!-- Stats Row -->
            <div class="stats-row">
                <div class="stat-card">
                    <div class="stat-icon"><i class="fas fa-box"></i></div>
                    <div>
                        <div class="stat-label">Total Orders</div>
                        <div class="stat-value">${not empty totalOrders ? totalOrders : '0'}</div>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon"><i class="fas fa-heart"></i></div>
                    <div>
                        <div class="stat-label">Wishlist Items</div>
                        <div class="stat-value">${not empty wishlistCount ? wishlistCount : '0'}</div>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon"><i class="fas fa-star"></i></div>
                    <div>
                        <div class="stat-label">Reward Points</div>
                        <div class="stat-value">${not empty rewardPoints ? rewardPoints : '0'}</div>
                    </div>
                </div>
            </div>

            <!-- Details Grid -->
            <div class="details-grid">

                <!-- Personal Info -->
                <div class="details-card">
                    <div class="card-header">
                        <span class="card-title"><i class="fas fa-user-circle" style="color:#5b21b6;margin-right:8px;"></i>Personal Info</span>
                        <a href="#" class="edit-link" onclick="toggleEdit('personalForm')">
                            <i class="fas fa-pen"></i> Edit
                        </a>
                    </div>

                    <!-- View Mode -->
                    <div id="personalView">
                        <div class="field-group">
                            <div class="field-label">First Name</div>
                            <div class="field-value">${not empty user.firstName ? user.firstName : '—'}</div>
                        </div>
                        <hr class="divider">
                        <div class="field-group">
                            <div class="field-label">Last Name</div>
                            <div class="field-value">${not empty user.lastName ? user.lastName : '—'}</div>
                        </div>
                        <hr class="divider">
                        <div class="field-group">
                            <div class="field-label">Email</div>
                            <div class="field-value">${not empty user.email ? user.email : '—'}</div>
                        </div>
                        <hr class="divider">
                        <div class="field-group">
                            <div class="field-label">Phone</div>
                            <div class="field-value">${not empty user.phone ? user.phone : '—'}</div>
                        </div>
                    </div>

                    <!-- Edit Form -->
                    <form id="personalForm" action="updateProfile" method="post" style="display:none;">
                        <div class="field-group">
                            <div class="field-label">First Name</div>
                            <input class="field-input" type="text" name="firstName" value="${user.firstName}" placeholder="First name">
                        </div>
                        <div class="field-group">
                            <div class="field-label">Last Name</div>
                            <input class="field-input" type="text" name="lastName" value="${user.lastName}" placeholder="Last name">
                        </div>
                        <div class="field-group">
                            <div class="field-label">Email</div>
                            <input class="field-input" type="email" name="email" value="${user.email}" placeholder="Email address">
                        </div>
                        <div class="field-group">
                            <div class="field-label">Phone</div>
                            <input class="field-input" type="tel" name="phone" value="${user.phone}" placeholder="Phone number">
                        </div>
                        <button type="submit" class="save-btn"><i class="fas fa-save"></i> Save Changes</button>
                    </form>
                </div>

                <!-- Shipping Address -->
                <div class="details-card">
                    <div class="card-header">
                        <span class="card-title"><i class="fas fa-map-marker-alt" style="color:#5b21b6;margin-right:8px;"></i>Shipping Address</span>
                        <a href="#" class="edit-link" onclick="toggleEdit('addressForm')">
                            <i class="fas fa-pen"></i> Edit
                        </a>
                    </div>

                    <div id="addressView">
                        <div class="field-group">
                            <div class="field-label">Street</div>
                            <div class="field-value">${not empty user.street ? user.street : '—'}</div>
                        </div>
                        <hr class="divider">
                        <div class="field-group">
                            <div class="field-label">City</div>
                            <div class="field-value">${not empty user.city ? user.city : '—'}</div>
                        </div>
                        <hr class="divider">
                        <div class="field-group">
                            <div class="field-label">State / ZIP</div>
                            <div class="field-value">
                                ${not empty user.state ? user.state : '—'}
                                ${not empty user.zip ? ', ' += user.zip : ''}
                            </div>
                        </div>
                        <hr class="divider">
                        <div class="field-group">
                            <div class="field-label">Country</div>
                            <div class="field-value">${not empty user.country ? user.country : '—'}</div>
                        </div>
                    </div>

                    <form id="addressForm" action="updateAddress" method="post" style="display:none;">
                        <div class="field-group">
                            <div class="field-label">Street</div>
                            <input class="field-input" type="text" name="street" value="${user.street}" placeholder="Street address">
                        </div>
                        <div class="field-group">
                            <div class="field-label">City</div>
                            <input class="field-input" type="text" name="city" value="${user.city}" placeholder="City">
                        </div>
                        <div class="field-group">
                            <div class="field-label">State</div>
                            <input class="field-input" type="text" name="state" value="${user.state}" placeholder="State">
                        </div>
                        <div class="field-group">
                            <div class="field-label">ZIP Code</div>
                            <input class="field-input" type="text" name="zip" value="${user.zip}" placeholder="ZIP / Postal code">
                        </div>
                        <div class="field-group">
                            <div class="field-label">Country</div>
                            <input class="field-input" type="text" name="country" value="${user.country}" placeholder="Country">
                        </div>
                        <button type="submit" class="save-btn"><i class="fas fa-save"></i> Save Address</button>
                    </form>
                </div>

                <!-- Recent Orders -->
                <div class="details-card" style="grid-column: 1 / -1;">
                    <div class="card-header">
                        <span class="card-title"><i class="fas fa-shopping-bag" style="color:#5b21b6;margin-right:8px;"></i>Recent Orders</span>
                        <a href="orders.jsp" class="edit-link"><i class="fas fa-arrow-right"></i> View All</a>
                    </div>

                    <c:choose>
                        <c:when test="${not empty recentOrders}">
                            <c:forEach var="order" items="${recentOrders}">
                                <div class="order-item">
                                    <div class="order-thumb"><i class="fas fa-tshirt"></i></div>
                                    <div class="order-info">
                                        <div class="order-name">Order #${order.orderId} — ${order.productName}</div>
                                        <div class="order-date">${order.orderDate}</div>
                                    </div>
                                    <span class="order-status
                                        ${order.status == 'Delivered' ? 'status-delivered' :
                                          order.status == 'Processing' ? 'status-processing' : 'status-shipped'}">
                                        ${order.status}
                                    </span>
                                </div>
                                <hr class="divider">
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <!-- Sample static orders shown when no data available -->
                            <div class="order-item">
                                <div class="order-thumb"><i class="fas fa-tshirt"></i></div>
                                <div class="order-info">
                                    <div class="order-name">Order #1024 — Summer Blazer</div>
                                    <div class="order-date">June 18, 2026</div>
                                </div>
                                <span class="order-status status-delivered">Delivered</span>
                            </div>
                            <hr class="divider">
                            <div class="order-item">
                                <div class="order-thumb"><i class="fas fa-tshirt"></i></div>
                                <div class="order-info">
                                    <div class="order-name">Order #1023 — Casual Trousers</div>
                                    <div class="order-date">June 10, 2026</div>
                                </div>
                                <span class="order-status status-shipped">Shipped</span>
                            </div>
                            <hr class="divider">
                            <div class="order-item">
                                <div class="order-thumb"><i class="fas fa-tshirt"></i></div>
                                <div class="order-info">
                                    <div class="order-name">Order #1022 — Linen Shirt</div>
                                    <div class="order-date">June 2, 2026</div>
                                </div>
                                <span class="order-status status-processing">Processing</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div><!-- /details-grid -->
        </main>
    </div><!-- /main-wrapper -->

    <script>
        function toggleEdit(formId) {
            const viewMap = {
                'personalForm': 'personalView',
                'addressForm':  'addressView'
            };
            const form = document.getElementById(formId);
            const view = document.getElementById(viewMap[formId]);
            const isHidden = form.style.display === 'none';
            form.style.display = isHidden ? 'block' : 'none';
            view.style.display = isHidden ? 'none' : 'block';
        }
    </script>

</body>
</html>
