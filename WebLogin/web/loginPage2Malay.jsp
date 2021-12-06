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
            <h1>Halaman Log Masuk</h1>
            <form method = "post" action ="welcomePageMalay.jsp">
                <label for="user">Nama Pengguna:</label><br>
                <input type="text" id="user" name="user"><br><br>
                <label for="pass">Kata Laluan:</label><br>
                <input type="password" id="pass" name="pass"><br><br>
                <button class="button" type="submit">Log In</button>
                <div id="error" class="errormsg">
                Nama Pengguna/Kata Laluan batal
                </div>
            </form>
        </div>
        <div class="topright">
            Pilih Bahasa: 
            <button class="languagebutton" onclick="window.location.href='/WebLogin/loginPage2.jsp';">Inggeris</button>
            <button class="languageselected" disabled>Melayu</button>
        </div>
    </body>
</html>
