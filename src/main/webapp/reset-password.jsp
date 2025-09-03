<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .reset-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
            width: 350px;
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        .reset-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .reset-container input {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: 0.3s;
        }

        .reset-container input:focus {
            border-color: #43cea2;
            box-shadow: 0 0 8px rgba(67,206,162,0.4);
        }

        .reset-container button {
            width: 95%;
            padding: 12px;
            margin-top: 15px;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .reset-container button:hover {
            transform: translateY(-2px);
            box-shadow: 0px 6px 15px rgba(67,206,162,0.5);
        }

        .reset-container p {
            margin-top: 10px;
            font-size: 14px;
        }

        .reset-container a {
            text-decoration: none;
            color: #185a9d;
            font-weight: bold;
        }

        .error {
            color: red;
            margin-top: 8px;
            font-size: 14px;
        }

        .success {
            color: green;
            margin-top: 8px;
            font-size: 14px;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
<div class="reset-container">
    <form action="reset-password" method="post">
        <h2>Đặt lại mật khẩu</h2>
        <input type="hidden" name="email" value="${email}" />
        <input type="password" name="newPassword" placeholder="Nhập mật khẩu mới" required /><br>
        <button type="submit">Xác nhận</button>
        <p class="error">${error}</p>
        <p class="success">${message}</p>
    </form>
    <p><a href="login.jsp">Quay lại đăng nhập</a></p>
</div>
</body>
</html>
