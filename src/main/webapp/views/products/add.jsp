<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 20px 0;
        min-height: 100vh;
    }

    .form-container {
        max-width: 500px;
        margin: 50px auto;
        padding: 30px 40px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
        border-radius: 8px;
        background-color: #fff;
    }

    .form-container h2 {
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

    .save-btn {
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

    .save-btn:hover {
        background: #3e3ca6;
    }

    .back-link {
        display: block;
        text-align: center;
        color: #5a4fcf;
        font-weight: 600;
        text-decoration: none;
        cursor: pointer;
        transition: color 0.3s;
    }

    .back-link:hover {
        color: #3e3ca6;
        text-decoration: underline;
    }
</style>

<div class="form-container">
    <h2>Thêm sản phẩm</h2>
    <form action="products" method="post">
        <input type="hidden" name="action" value="insert" />

        <div class="form-group">
            <label for="name">Tên sản phẩm</label>
            <input type="text" id="name" name="name" placeholder="Nhập tên sản phẩm" required>
        </div>

        <div class="form-group">
            <label for="description">Mô tả</label>
            <input type="text" id="description" name="description" placeholder="Nhập mô tả sản phẩm">
        </div>

        <div class="form-group">
            <label for="price">Giá</label>
            <input type="number" step="0.01" id="price" name="price" placeholder="Nhập giá sản phẩm" required>
        </div>

        <button type="submit" class="save-btn">Lưu sản phẩm</button>
    </form>

    <a href="products" class="back-link">← Quay lại danh sách</a>
</div>