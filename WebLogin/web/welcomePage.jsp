<%@page import="Login.loginController"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Welcome Page</title>
    </head>
    <body>
        
        <%!String name,user,role,pass = " "; %>
        <%loginController tc = new loginController();
        user = request.getParameter("user");
        pass = request.getParameter("pass");%>
        <%!ArrayList<String> userDetails = new ArrayList<String>(); %>
        <%userDetails = tc.getDetails(user,pass);%>
        <div class="topright">
            <form method = "post" action ="welcomePageMalay.jsp">
            Select Language:
            <button class="languageselected" disabled>English</button>
            <button class="languagebutton" type="submit" >Malay</button>
            <input hidden type="text" id="user" name="user" value=<%=user%>><br><br>
            <input hidden type="password" id="pass" name="pass" value=<%=pass%>><br><br>
            </form>
        </div>
        <%if(userDetails.isEmpty()) { %>
        <%response.sendRedirect("loginPage2.jsp");%>
        <% } else {%>
            <h1>Welcome <%= userDetails.get(0) %></h1>
            <label>Name: <%= userDetails.get(1) %></label><br>
            <label>Role: <%= userDetails.get(2) %></label><br>
        <% } %>
        
        <button class="logoutbutton" onclick="window.location.href='/WebLogin/loginPage.jsp';">
            Log Out
        </button>
        
    </body>
</html>
