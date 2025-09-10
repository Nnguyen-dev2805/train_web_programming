<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Sửa sản phẩm</title></head>
<body>
<h2>Sửa sản phẩm</h2>
<form action="products" method="post">
    <input type="hidden" name="action" value="update" />
    <input type="hidden" name="id" value="${product.id}" />
    Tên: <input type="text" name="name" value="${product.name}" required /><br>
    Mô tả: <input type="text" name="description" value="${product.description}" /><br>
    Giá: <input type="number" step="0.01" name="price" value="${product.price}" required /><br>
    <button type="submit">Cập nhật</button>
</form>
<a href="products">Quay lại</a>
</body>
</html>
