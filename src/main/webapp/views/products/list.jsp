<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
    body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 20px 0;
        min-height: 100vh;
    }

    .product-container {
        max-width: 1000px;
        margin: 50px auto;
        padding: 30px 40px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
        border-radius: 8px;
        background-color: #fff;
    }

    .product-container h2 {
        color: #2c2c72;
        margin-bottom: 25px;
        font-size: 28px;
        font-weight: 600;
    }

    .add-btn {
        display: inline-block;
        margin-bottom: 20px;
        padding: 12px 20px;
        background: linear-gradient(90deg, #5a4fcf, #7f73f5);
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-weight: 600;
        font-size: 16px;
        transition: background 0.3s;
    }

    .add-btn:hover {
        background: #3e3ca6;
    }

    .count {
        margin-bottom: 20px;
        padding: 15px 20px;
        background: linear-gradient(135deg, #f8f9ff, #e8ebff);
        border-radius: 6px;
        border-left: 4px solid #5a4fcf;
        color: #2c2c72;
        font-weight: 600;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #f0f0f0;
    }

    th {
        background: linear-gradient(90deg, #2c2c72, #5a4fcf);
        color: white;
        font-weight: 600;
        font-size: 16px;
    }

    tr:nth-child(even) {
        background-color: #f9f9ff;
    }

    tr:hover {
        background-color: #e8ebff;
        transition: background-color 0.2s;
    }

    .actions a {
        margin-right: 15px;
        text-decoration: none;
        font-weight: 600;
        padding: 6px 12px;
        border-radius: 4px;
        transition: all 0.3s;
    }

    .actions a:first-child {
        color: #5a4fcf;
        border: 1px solid #5a4fcf;
    }

    .actions a:first-child:hover {
        background-color: #5a4fcf;
        color: white;
    }

    .actions a:last-child {
        color: #d9534f;
        border: 1px solid #d9534f;
    }

    .actions a:last-child:hover {
        background-color: #d9534f;
        color: white;
    }
</style>

<div class="product-container">
    <h2>Danh sách sản phẩm</h2>
    <a href="products?action=new" class="add-btn">+ Thêm sản phẩm</a>

    <div class="count">Tổng số sản phẩm: ${fn:length(products)}</div>

    <table>
        <tr>
            <th>ID</th><th>Tên</th><th>Mô tả</th><th>Giá</th><th>Hành động</th>
        </tr>
        <c:forEach var="p" items="${products}">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.description}</td>
                <td>${p.price}</td>
                <td class="actions">
                    <a href="products?action=edit&id=${p.id}">Sửa</a>
                    <a href="products?action=delete&id=${p.id}" onclick="return confirm('Xóa sản phẩm này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>