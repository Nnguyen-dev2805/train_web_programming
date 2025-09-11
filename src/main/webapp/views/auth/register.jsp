<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 20px 0;
        min-height: 100vh;
    }

    .register-container {
        max-width: 450px;
        margin: 50px auto;
        padding: 30px 40px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
        border-radius: 8px;
        background-color: #fff;
    }

    .register-container h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #2c2c72;
        font-size: 28px;
        font-weight: 600;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-weight: 600;
        margin-bottom: 8px;
        color: #2c2c72;
    }

    .form-group input {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
        transition: border-color 0.3s;
        box-sizing: border-box;
    }

    .form-group input:focus {
        border-color: #5a4fcf;
        outline: none;
        box-shadow: 0 0 0 3px rgba(90, 79, 207, 0.1);
    }

    .register-btn {
        width: 100%;
        padding: 12px;
        background: linear-gradient(90deg, #5a4fcf, #7f73f5);
        color: white;
        font-weight: 700;
        font-size: 18px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background 0.3s;
        margin-bottom: 15px;
    }

    .register-btn:hover {
        background: #3e3ca6;
    }

    .login-link {
        display: block;
        text-align: center;
        color: #5a4fcf;
        font-weight: 600;
        text-decoration: none;
        cursor: pointer;
        transition: color 0.3s;
        margin-top: 10px;
    }

    .login-link:hover {
        color: #3e3ca6;
        text-decoration: underline;
    }

    .error {
        color: #d9534f;
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
        padding: 10px 15px;
        border-radius: 4px;
        margin-bottom: 20px;
        font-size: 14px;
        text-align: center;
    }

    .login-text {
        text-align: center;
        color: #666;
        font-size: 14px;
        margin-top: 15px;
    }
</style>

<div class="register-container">
    <h2>Đăng ký tài khoản</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form action="register" method="post">
        <div class="form-group">
            <label for="fullname">Họ và tên</label>
            <input type="text" id="fullname" name="fullname" placeholder="Nhập họ và tên đầy đủ" required>
        </div>

        <div class="form-group">
            <label for="username">Tên đăng nhập</label>
            <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Nhập địa chỉ email" required>
        </div>

        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
        </div>

        <button type="submit" class="register-btn">Đăng ký</button>
    </form>

    <p class="login-text">Đã có tài khoản? <a href="login" class="login-link">Đăng nhập ngay</a></p>
</div>