<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .forgot-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
            width: 350px;
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        .forgot-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .forgot-container input {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: 0.3s;
        }

        .forgot-container input:focus {
            border-color: #ff9a9e;
            box-shadow: 0 0 8px rgba(255,154,158,0.4);
        }

        .forgot-container button {
            width: 95%;
            padding: 12px;
            margin-top: 15px;
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .forgot-container button:hover {
            transform: translateY(-2px);
            box-shadow: 0px 6px 15px rgba(255,154,158,0.5);
        }

        .forgot-container p {
            margin-top: 10px;
            font-size: 14px;
        }

        .forgot-container a {
            text-decoration: none;
            color: #ff7a7a;
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
<div class="forgot-container">
    <form action="forgot-password" method="post">
        <h2>Quên mật khẩu</h2>
        <input type="email" name="email" placeholder="Nhập email của bạn" required /><br>
        <button type="submit">Gửi yêu cầu</button>
        <p class="error">${error}</p>
        <p class="success">${message}</p>
    </form>
    <p><a href="login.jsp">Quay lại đăng nhập</a></p>
</div>
</body>
</html>
