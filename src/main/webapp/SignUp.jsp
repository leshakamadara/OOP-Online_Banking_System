<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HelaBank Sign Up</title>
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
        
        /* Sign Up section */
        .signup-section {
            display: flex;
            width: 1200px;
            height: 1100px;
            box-shadow: 0 5px 14px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
  
            background: rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(10px);
            position: relative;
            z-index: 1;
            margin: 80px auto 50px;
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
        
        .signup-box {
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
            margin-bottom: 5px;
            font-weight: 500;
            color: #333;
        }
        
        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
            transition: border 0.3s;
            margin-bottom: 10px;
        }
        
        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus,
        select:focus {
            border-color: #25c485;
        }
        
        .terms {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .terms input[type="checkbox"] {
            width: 18px;
            height: 18px;
            margin-right: 10px;
            accent-color: #25c485;
            cursor: pointer;
        }
        
        .button-group {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .button-group button {
            background-color: #25c485;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
            flex: 1;
        }
        
        .button-group button[type="submit"] {
            background-color: #25c485;
        }
        
        .button-group button[type="reset"] {
            background-color: #f5f5f5;
            color: #333;
            border: 1px solid #ddd;
        }
        
        .button-group button:hover {
            background-color: #1ea36f;
        }
        
        .button-group button[type="reset"]:hover {
            background-color: #e5e5e5;
        }
        
        .login-link {
            margin-top: 10px;
            text-align: center;
            font-size: 14px;
        }
        
        .login-link a {
            color: #25c485;
            text-decoration: none;
            font-weight: 500;
            padding: 5px 15px;
            border: 1px solid #25c485;
            border-radius: 20px;
            margin-left: 5px;
            transition: all 0.3s;
        }
        
        .login-link a:hover {
            background-color: #25c485;
            color: white;
        }
        
        .error-message {
            color: red;
            margin-bottom: 15px;
            font-size: 14px;
        }
        
        /* Responsive adjustments */
        @media (max-width: 1250px) {
            .signup-section {
                width: 95%;
                height: auto;
                flex-direction: column;
            }
            
            .brand-image {
                padding: 40px 0;
                border-radius: 15px 15px 0 0;
            }
        }
        
        @media (max-width: 480px) {
            .signup-section {
                width: 95%;
            }
            
            .signup-box,
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
    
    <!-- Sign Up Section -->
    <section class="signup-section">
        <div class="brand-image">
            <img src="images/unnamed.png" alt="Bank Logo" class="logo-image">
        </div>
        <div class="signup-box">
            <h2>Create Account</h2>
            <p>Please complete the form to register your banking account</p>
            
            <% 
                String errorMsg = (String) request.getAttribute("error");
                if (errorMsg != null) {
            %>
                <p class="error-message"><%= errorMsg %></p>
            <% } %>
            
            <form onsubmit="return validateForm()" method="post" action="addCustomer">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter username" required>

                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname" placeholder="As per your ID" required>

                <label for="branch">Branch</label>
                <select id="branch" name="branch" required>
                    <option value="">-- Select Branch (District) --</option>
                    <option value="Colombo">Colombo</option>
                    <option value="Gampaha">Gampaha</option>
                    <option value="Kalutara">Kalutara</option>
                    <option value="Kandy">Kandy</option>
                    <option value="Matale">Matale</option>
                    <option value="Nuwara Eliya">Nuwara Eliya</option>
                    <option value="Galle">Galle</option>
                    <option value="Matara">Matara</option>
                    <option value="Hambantota">Hambantota</option>
                    <option value="Jaffna">Jaffna</option>
                    <option value="Kilinochchi">Kilinochchi</option>
                    <option value="Mannar">Mannar</option>
                    <option value="Vavuniya">Vavuniya</option>
                    <option value="Mullaitivu">Mullaitivu</option>
                    <option value="Batticaloa">Batticaloa</option>
                    <option value="Ampara">Ampara</option>
                    <option value="Trincomalee">Trincomalee</option>
                    <option value="Kurunegala">Kurunegala</option>
                    <option value="Puttalam">Puttalam</option>
                    <option value="Anuradhapura">Anuradhapura</option>
                    <option value="Polonnaruwa">Polonnaruwa</option>
                    <option value="Badulla">Badulla</option>
                    <option value="Monaragala">Monaragala</option>
                    <option value="Ratnapura">Ratnapura</option>
                    <option value="Kegalle">Kegalle</option>
                </select>

                <label for="contact">Contact Number</label>
                <input type="text" id="contact" name="contact" required>

                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="">-- Select Gender --</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>

                <label for="nic">National ID (NIC)</label>
                <input type="text" id="nic" name="nic" placeholder="e.g., 199912345678" required>

                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="yourname@example.com" required>

                <label for="password">Password</label>
                <input type="password" id="pwd" name="password" placeholder="Minimum 6 characters" required>

                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="pwd2" name="confirmPassword" placeholder="Re-enter password" required>

                <div class="terms">
                    <input type="checkbox" id="terms" onclick="enableSubmit()" required>
                    <label for="terms">I accept the <a href="#">Terms & Conditions</a>.</label>
                </div>

                <div class="button-group">
                    <button type="submit" id="submitBtn" disabled>Create Account</button>
                    <button type="reset">Clear Form</button>
                </div>
            </form>
            
            <p class="login-link">Already have an account? <a href="Login.jsp">Sign In</a></p>
        </div>
    </section>

    <script>
        function enableSubmit() {
            document.getElementById('submitBtn').disabled = !document.getElementById('terms').checked;
        }

        function validateForm() {
            const pwd = document.getElementById('pwd').value;
            const confirmPwd = document.getElementById('pwd2').value;

            if (pwd !== confirmPwd) {
                alert("Passwords do not match.");
                return false;
            }
            if (pwd.length < 6) {
                alert("Password must be at least 6 characters.");
                return false;
            }
            
           
            return true;
        }
    </script>
</body>
</html>