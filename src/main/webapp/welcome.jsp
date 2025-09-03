<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Nếu chưa login thì quay về login
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff9966, #ff5e62);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .welcome-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
            width: 450px;
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        .welcome-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .welcome-container p {
            font-size: 16px;
            margin-bottom: 25px;
            color: #555;
        }

        .welcome-container a {
            display: inline-block;
            margin: 10px 5px;
            padding: 12px 25px;
            background: linear-gradient(135deg, #ff9966, #ff5e62);
            border-radius: 8px;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .welcome-container a:hover {
            transform: translateY(-2px);
            box-shadow: 0px 6px 15px rgba(255,94,98,0.5);
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
<div class="welcome-container">
    <h2>Xin chào, <%= user %>! 👋</h2>
    <p>Chúc bạn một ngày tốt lành 🎉</p>

    <!-- Menu quản lý -->
    <a href="products">Quản lý sản phẩm</a>
    <a href="login.jsp">Đăng xuất</a>
</div>
</body>
</html>
