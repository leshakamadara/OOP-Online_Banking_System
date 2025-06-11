<%@ page import="java.sql.Connection" %>
<%@ page import="com.banking.utility.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
    <title>DB Connection Test</title>
</head>
<body>
    <h2>Database Connection Test</h2>

    <%
   

            Connection conn = null;
            try {
                conn = DBConnect.getConnection();
                if (conn != null && !conn.isClosed()) {
                    out.println("<p style='color:green;'>Connection successful!</p>");
                } else {
                    out.println("<p style='color:red;'>Connection failed.</p>");
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (Exception e) {
                        out.println("<p>Error closing connection: " + e.getMessage() + "</p>");
                    }
                }
            }
    %>
</body>
</html>
