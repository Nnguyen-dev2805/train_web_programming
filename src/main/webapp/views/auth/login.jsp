<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h2>Đăng nhập</h2>
<form action="/login" method="post">
    <div>
        <label>Tên đăng nhập:</label>
        <input type="text" name="username" required />
    </div>
    <div>
        <label>Mật khẩu:</label>
        <input type="password" name="password" required />
    </div>
    <button type="submit">Đăng nhập</button>
</form>