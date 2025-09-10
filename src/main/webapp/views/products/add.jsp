<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Thêm sản phẩm</title></head>
<body>
<h2>Thêm sản phẩm</h2>
<form action="products" method="post">
    <input type="hidden" name="action" value="insert" />
    Tên: <input type="text" name="name" required /><br>
    Mô tả: <input type="text" name="description" /><br>
    Giá: <input type="number" step="0.01" name="price" required /><br>
    <button type="submit">Lưu</button>
</form>
<a href="products">Quay lại</a>
</body>
</html>
