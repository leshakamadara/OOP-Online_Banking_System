<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <!--Google Fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
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
            overflow: hidden;
            position: relative;
        }
        
        /* Background layers container */
        .background-container {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }
        
        /* Layer 1: Background image */
        .background-image {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 1;
        }
        
        /* Layer 2: Video overlay */
        .background-video {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 2;
            /* Blend mode to show both video and image */
            mix-blend-mode: overlay;
        }
        
        /* Layer 3: Login container */
        .login-container {
            position: relative;
            z-index: 3;
            width: 480px;
            height:480px;
            padding: 40px;
            background: white; /* Base background color */
            background-image: url('${pageContext.request.contextPath}/images/login-bg.jpg'); /* Login box background image */
            background-size: cover;
            background-position: center;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }
        
        /* Content wrapper inside login container for better readability */
        .login-content {
            background-color: transparent); /* Semi-transparent white background */
            padding: 25px;
            border-radius: 8px;
        }
        
        .login-container h1 {
            text-align: center;
            margin-bottom: 30px;
            color: white;
        }
        
        .login-logo {
            display: block;
            margin: 0 auto 20px auto;
            max-width: 120px;
        }
        
        .field {
            margin-bottom: 20px;
        }
        
        .input {
            position: relative;
        }
        
        .field label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color:white ;
            opacity:0.5;
            
        }
        
        .field input[type="text"],
        .field input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
            background-color: transparent; 
    		color: white;
           
            
        }
        
        .field input[type="text"]:focus,
        .field input[type="password"]:focus {
            border-color: #3498db;
            outline: none;
        }
        
        .btn {
            width: 100%;
            padding: 12px;
            background: #FFFFFF;
            color: black;
            border: none;
            border-radius: 9999px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .btn:hover {
            background: #FFFFFF;
            opacity:0.8;

    </style>
</head>
<body>
    <%
        // Check if admin is already logged in
        if(session.getAttribute("adminId") != null) {
            response.sendRedirect("adminHome.jsp");
        }
    %>
    
    <!-- Background layers -->
    <div class="background-container">
        <!-- Layer 1: Background Image -->
        <img src="${pageContext.request.contextPath}/images/bg.png" alt="Background" class="background-image">
        
        <!-- Layer 2: Video that plays on top of image -->
        <video autoplay muted loop playsinline class="background-video">
            <source src="${pageContext.request.contextPath}/videos/bg.mp4" type="video/mp4">

        </video>
    </div>
    
    <!-- Layer 3: Login Box with background image -->
    <div class="login-container">
        <div class="login-content">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="Bank Logo" class="login-logo">
            <h1>Admin Login</h1>
            
            <form action="${pageContext.request.contextPath}/AdminLoginServlet" method="post">
                <div class="field input">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" required>
                </div>
    
                <div class="field input">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" required>
                </div>
    
                <div class="field">
                    <input type="submit" class="btn" name="submit" value="Login">
                </div>
            </form>
        </div>
    </div>

    <!-- Script to ensure video plays -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const video = document.querySelector('.background-video');
            
            // Force video to play
            video.play().catch(function(error) {
                console.log("Video playback failed:", error);
                
                // Add play button if autoplay fails
                if (error.name === "NotAllowedError") {
                    const playButton = document.createElement('button');
                    playButton.textContent = "Play Background";
                    playButton.style.position = "absolute";
                    playButton.style.bottom = "20px";
                    playButton.style.left = "20px";
                    playButton.style.zIndex = "10";
                    playButton.style.padding = "10px";
                    
                    playButton.addEventListener('click', function() {
                        video.play();
                        this.remove();
                    });
                    
                    document.body.appendChild(playButton);
                }
            });
        });
    </script>
</body>
</html>