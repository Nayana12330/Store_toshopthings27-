<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Fashion Store</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: linear-gradient(to right, #141e30, #243b55);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 420px;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: none;
            border-radius: 8px;
            background: #f1f1f1;
            transition: 0.3s;
        }

        input:focus {
            outline: none;
            background: #e0e0e0;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            border: none;
            border-radius: 8px;
            background: #ff4b2b;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #ff416c;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            text-decoration: none;
            color: #ff4b2b;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .brand {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            color: #ff4b2b;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="brand">Fashion Store</div>

    <h2>Create Account</h2>

    <form action="register" method="post">

        <input type="text" name="name" placeholder="Full Name" required>

        <input type="email" name="email" placeholder="Email" required>

        <input type="password" name="password" placeholder="Password" required>

        <input type="text" name="phone" placeholder="Phone">

        <input type="text" name="addressLine" placeholder="Address" required>

        <input type="text" name="city" placeholder="City" required>

        <input type="text" name="state" placeholder="State" required>

        <input type="text" name="pincode" placeholder="Pincode" required>

        <button type="submit">Register</button>

    </form>

    <div class="login-link">
        <p>Already have an account?</p>
        <a href="login.jsp">Login</a>
    </div>

</div>

</body>
</html>