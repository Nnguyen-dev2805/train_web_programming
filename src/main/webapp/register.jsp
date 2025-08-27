<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/27/2025
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="register" method="post">
    <h2>Register</h2>
    <input type="text" name="username" placeholder="Username" required /><br>
    <input type="password" name="password" placeholder="Password" required /><br>
    <input type="email" name="email" placeholder="Email" required /><br>
    <button type="submit">Register</button>
    <p style="color:red">${error}</p>
</form>
<a href="login.jsp">Back to Login</a>

