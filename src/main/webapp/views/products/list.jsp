<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--<html>--%>
<%--<head><title>Danh sách sản phẩm</title></head>--%>
<%--<body>--%>
<%--<h2>Danh sách sản phẩm</h2>--%>
<%--<a href="products?action=new">Thêm sản phẩm</a>--%>

<%--<p>Số lượng sản phẩm: ${fn:length(products)}</p>--%>

<%--<table border="1" cellpadding="5">--%>
<%--    <tr>--%>
<%--        <th>ID</th><th>Tên</th><th>Mô tả</th><th>Giá</th><th>Hành động</th>--%>
<%--    </tr>--%>
<%--    <c:forEach var="p" items="${products}">--%>
<%--        <tr>--%>
<%--            <td>${p.id}</td>--%>
<%--            <td>${p.name}</td>--%>
<%--            <td>${p.description}</td>--%>
<%--            <td>${p.price}</td>--%>
<%--            <td>--%>
<%--                <a href="products?action=edit&id=${p.id}">Sửa</a>--%>
<%--                <a href="products?action=delete&id=${p.id}" onclick="return confirm('Xóa sản phẩm này?')">Xóa</a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            margin: 0;
            padding: 40px 0;
        }
        .container {
            width: 90%;
            max-width: 1000px;
            background: #fff;
            border-radius: 10px;
            padding: 25px 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            animation: fadeIn 0.5s ease-in-out;
        }
        h2 {
            color: #185a9d;
            margin-bottom: 15px;
        }
        a.button {
            display: inline-block;
            margin: 10px 0 20px 0;
            padding: 10px 15px;
            background: #43cea2;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            transition: background 0.3s ease;
        }
        a.button:hover {
            background: #36a98e;
        }
        .count {
            margin-bottom: 15px;
            font-style: italic;
            color: #555;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fafafa;
            border-radius: 6px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background: #185a9d;
            color: #fff;
        }
        tr:nth-child(even) {
            background: #f2f2f2;
        }
        tr:hover {
            background: #e0f7f4;
        }
        .actions a {
            margin-right: 10px;
            text-decoration: none;
            font-weight: 500;
        }
        .actions a:first-child {
            color: #185a9d;
        }
        .actions a:last-child {
            color: #d9534f;
        }
        .actions a:hover {
            text-decoration: underline;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Danh sách sản phẩm</h2>
    <a href="products?action=new" class="button">+ Thêm sản phẩm</a>

    <p class="count">Tổng số sản phẩm: ${fn:length(products)}</p>

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
</body>
</html>
