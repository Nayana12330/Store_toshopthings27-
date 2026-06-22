<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Fashion Store</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', sans-serif;
    }

    body {
        height: 100vh;
        background: linear-gradient(135deg, #ff3f6c, #ff9f00, #00bcd4);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        width: 380px;
        padding: 30px;
        border-radius: 20px;
        background: rgba(255,255,255,0.95);
        box-shadow: 0 15px 35px rgba(0,0,0,0.3);
        animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .logo {
        text-align: center;
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .logo span:nth-child(1) { color: #ff3f6c; }
    .logo span:nth-child(2) { color: #ff9f00; }
    .logo span:nth-child(3) { color: #00bcd4; }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .input-box {
        position: relative;
        margin-bottom: 15px;
    }

    .input-box input {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 10px;
        background: #f2f2f2;
        transition: 0.3s;
    }

    .input-box input:focus {
        outline: none;
        background: #e8e8e8;
        transform: scale(1.02);
    }

    button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 10px;
        background: linear-gradient(135deg, #ff3f6c, #ff527b);
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }

    .msg {
        text-align: center;
        color: red;
        margin-top: 10px;
    }

    .link {
        text-align: center;
        margin-top: 15px;
    }

    .link a {
        text-decoration: none;
        color: #ff3f6c;
        font-weight: bold;
    }

    .link a:hover {
        text-decoration: underline;
    }
</style>

</head>

<body>

<div class="container">

    <!-- 🔥 Logo -->
    <div class="logo">
        <span>F</span><span>S</span> <span>Store</span>
    </div>

    <h2>Login</h2>

    <form action="<%=request.getContextPath()%>/login" method="post">

        <div class="input-box">
            <input type="email" name="email" placeholder="Enter Email" required>
        </div>

        <div class="input-box">
            <input type="password" name="password" placeholder="Enter Password" required>
        </div>

        <button type="submit">Login</button>
    </form>

    <div class="msg">
        ${error}
    </div>

    <div class="link">
        <p>New here?</p>
        <a href="register.jsp">Create Account</a>
    </div>

</div>

</body>
</html>