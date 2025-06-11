<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HelaBank Login</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f5f5f5;
            overflow-x: hidden;
        }
        
        /* Background elements */
        .bg {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -1;
        }
        
        .dora-wrap {
            height: 100%;
            width: 100%;
            position: relative;
        }
        
        .overlap-group {
            position: relative;
            width: 100%;
            height: 100%;
        }
        
        .dora-1 {
            width: 492px;
            height: 492px;
            top: 0;
            right: 15%;
            border-radius: 246px;
            position: absolute;
            background-color: #2bb32a;
            filter: blur(400px);
        }
        
        .dora-2 {
            width: 492px;
            height: 492px;
            top: 50vh;
            left: 5%;
            border-radius: 246px;
            position: absolute;
            background-color: #2bb32a;
            filter: blur(400px);
        }
        
        /* Navbar styles */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background-color: transparent;
            backdrop-filter: blur(10px);
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 10;
        }
        
        .logo-container {
            display: flex;
            align-items: center;
            text-decoration: none;
        }
        
        .logo-image {
            height: 32px;
            margin-right: 10px;
        }
        
        .logo-text {
            color: #000;
            font-weight: 600;
            font-size: 18px;
        }
        
        .menu {
            display: flex;
            list-style: none;
            gap: 30px;
        }
        
        .mlogin-btn {
            background: transparent;
            color: #2bb32a;
            border: 1px solid #2bb32a;
            border-radius: 20px;
            padding: 8px 24px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        
        .mlogin-btn:hover {
            background-color: #2bb32a;
            color: white;
        }
        
        /* Login section */
        .login-section {
            display: flex;
            width: 1000px;
            height: 600px;
            box-shadow: 0 5px 14px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(10px);
            position: relative;
            z-index: 1;
            margin: 100px auto 50px;
        }
        
        .brand-image {
            flex: 1;
            
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 15px 0 0 15px;
        }
        
        .brand-image .logo-image {
            max-width: 80%;
            max-height: 80%;
            height: auto;
            object-fit: contain;
        }
        
        .login-box {
            flex: 1;
            padding: 40px;
            
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        h2 {
            font-size: 36px;
            margin-bottom: 10px;
            color: #333;
        }
        
        p {
            color: #555;
            margin-bottom: 30px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
        }
        
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
            transition: border 0.3s;
            margin-bottom: 20px;
        }
        
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #25c485;
        }
        
        .captcha-container {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
        }
        
        .captcha-container label {
            display: flex;
            align-items: center;
            font-weight: normal;
            cursor: pointer;
        }
        
        .captcha-container input[type="checkbox"] {
            width: 18px;
            height: 18px;
            margin-right: 10px;
            accent-color: #25c485;
            cursor: pointer;
        }
        
        .login-btn {
            background-color: #25c485;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            display: inline-block;
            text-align: center;
            width: 120px;
            transition: background-color 0.3s;
        }
        
        .login-btn:hover {
            background-color: #1ea36f;
        }
        
        .alternative-options {
            margin-top: 30px;
            text-align: left;
        }
        
        .alternative-options p {
            margin-bottom: 0;
            font-size: 14px;
        }
        
        .alternative-options a {
            color: #25c485;
            text-decoration: none;
            font-weight: 500;
            padding: 5px 15px;
            border: 1px solid #25c485;
            border-radius: 20px;
            margin-left: 5px;
            transition: all 0.3s;
        }
        
        .alternative-options a:hover {
            background-color: #25c485;
            color: white;
        }
        
        .error-message {
            color: red;
            margin-bottom: 15px;
            font-size: 14px;
        }
        
        /* Responsive adjustments */
        @media (max-width: 992px) {
            .login-section {
                width: 90%;
                flex-direction: column;
                height: auto;
            }
            
            .brand-image {
                padding: 40px 0;
                border-radius: 15px 15px 0 0;
            }
        }
        
        @media (max-width: 480px) {
            .login-section {
                width: 95%;
            }
            
            .login-box,
            .brand-image {
                padding: 30px 20px;
            }
            
            h2 {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>
    <div class="bg">
        <div class="dora-wrap">
            <div class="overlap-group">
                <div class="dora-1"></div>
                <div class="dora-2"></div>
            </div>
        </div>
    </div>
    
    <!-- Navbar -->
    <nav class="navbar">
        <a href="landing.jsp" class="logo-container">
            <img src="images/unnamed.png" alt="HelaBank Logo" class="logo-image">
            <div class="logo-text">HelaBank</div>
        </a>
        <ul class="menu">
            <!-- Menu items if needed -->
        </ul>
        
    </nav>
    
    <!-- Login Section -->
    <section class="login-section">
        <div class="brand-image">
            <img src="images/unnamed.png" alt="Bank Logo" class="logo-image">
        </div>
        <div class="login-box">
            <h2>Welcome Back</h2>
            <p>Please log in to access your banking account</p>
            
            <% 
                String errorMsg = (String) request.getAttribute("error");
                if (errorMsg != null) {
            %>
                <p class="error-message"><%= errorMsg %></p>
            <% } %>
            
            <form id="loginForm" method="post" action="Login">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
                
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
                
                <div class="captcha-container">
                    <label for="captcha">
                        <input type="checkbox" id="captcha" name="captcha" required>
                        I'm not a robot
                    </label>
                </div>
                
                <button type="submit" class="login-btn">Login</button>
            </form>
            
            <div class="alternative-options">
                <p>Don't have an account? <a href="SignUp.jsp">Sign Up</a></p>
            </div>
        </div>
    </section>
</body>
</html>