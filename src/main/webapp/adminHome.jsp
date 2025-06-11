<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
    <!--Google Fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h1>Admin Dashboard</h1>
    
    <h2>
        Welcome, <%= session.getAttribute("adminFname") %> <%= session.getAttribute("adminLname") %>!
    </h2>
    <h3>Role: <%= session.getAttribute("adminRole") %> | Department: <%= session.getAttribute("adminDept") %></h3>
    
    <div class="admin-dashboard">
        <!-- Menu options based on admin role -->
        <div class="menu-items">
            <ul>
                <li><a href="adminProfile.jsp">My Profile</a></li>
                <li><a href="manageUsers.jsp">Manage Users</a></li>
                <li><a href="reports.jsp">View Reports</a></li>
                <% if (session.getAttribute("adminRole").equals("super_admin")) { %>
                <li><a href="manageAdmins.jsp">Manage Admins</a></li>
                <% } %>
            </ul>
        </div>
    </div>
    
    <form action="AdminLogoutServlet" method="get">
        <input type="submit" value="Logout" class="btn" />
    </form>
</body>
</html>