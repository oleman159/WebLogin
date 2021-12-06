<%@page import="Login.loginController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Login Page</title>
    </head>
    <body>
        <div class="centered">
            <h1>Login Page</h1>
            <form method = "post" action ="welcomePage.jsp">
                <label for="user">Username:</label><br>
                <input type="text" id="user" name="user"><br><br>
                <label for="pass">Password:</label><br>
                <input type="password" id="pass" name="pass"><br><br>
                <button class="button" type="submit">Log In</button>
                <div id="error" class="errormsg">
                Invalid Username/Password
                </div>
            </form>
        </div>
        <div class="topright">
            Select Language: 
            <button class="languageselected" disabled>English</button>
            <button class="languagebutton" onclick="window.location.href='/WebLogin/loginPage2Malay.jsp';">Malay</button>
        </div>
    </body>
</html>
