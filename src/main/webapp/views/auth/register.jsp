<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
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

        .register-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
            width: 380px;
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        .register-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .register-container input {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: 0.3s;
        }

        .register-container input:focus {
            border-color: #ff9a9e;
            box-shadow: 0 0 8px rgba(255,154,158,0.4);
        }

        .register-container button {
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

        .register-container button:hover {
            transform: translateY(-2px);
            box-shadow: 0px 6px 15px rgba(255,154,158,0.5);
        }

        .register-container p {
            margin-top: 10px;
            font-size: 14px;
        }

        .register-container a {
            text-decoration: none;
            color: #ff7a7a;
            font-weight: bold;
        }

        .error {
            color: red;
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
<div class="register-container">
    <form action="register" method="post">
        <h2>Register</h2>
        <input type="text" name="username" placeholder="Username" required /><br>
        <input type="password" name="password" placeholder="Password" required /><br>
        <input type="email" name="email" placeholder="Email" required /><br>
        <button type="submit">Register</button>
        <p class="error">${error}</p>
    </form>
    <p>Already have an account? <a href="login">Back to Login</a></p>
</div>
</body>
</html>
