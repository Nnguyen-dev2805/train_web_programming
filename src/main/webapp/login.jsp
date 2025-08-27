<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/27/2025
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="login" method="post">
    <h2>Login</h2>
    <input type="text" name="username" placeholder="Username" required /><br>
    <input type="password" name="password" placeholder="Password" required /><br>
    <button type="submit">Login</button>
    <p style="color:red">${error}</p>
</form>
<a href="register.jsp">Register here</a>

