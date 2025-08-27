<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/27/2025
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String user = (String) session.getAttribute("username"); %>
<h2>Welcome, <%= user %>!</h2>
<a href="login.jsp">Logout</a>

