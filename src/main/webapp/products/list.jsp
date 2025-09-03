<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head><title>Danh sách sản phẩm</title></head>
<body>
<h2>Danh sách sản phẩm</h2>
<a href="products?action=new">Thêm sản phẩm</a>

<p>Số lượng sản phẩm: ${fn:length(products)}</p>

<table border="1" cellpadding="5">
    <tr>
        <th>ID</th><th>Tên</th><th>Mô tả</th><th>Giá</th><th>Hành động</th>
    </tr>
    <c:forEach var="p" items="${products}">
        <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>${p.description}</td>
            <td>${p.price}</td>
            <td>
                <a href="products?action=edit&id=${p.id}">Sửa</a>
                <a href="products?action=delete&id=${p.id}" onclick="return confirm('Xóa sản phẩm này?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
