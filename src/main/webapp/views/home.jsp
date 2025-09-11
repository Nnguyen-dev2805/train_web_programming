<%@ page import="model.User" %>
<%@ page import="model.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserByUsername(username);
    if (user == null) {
        response.sendRedirect("views/auth/login.jsp");
        return;
    }
%>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
    .home-content {
        font-family: 'Inter', sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 80vh;
        padding: 2rem 0;
    }

    .welcome-section {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .welcome-title {
        font-size: 2.5rem;
        font-weight: 700;
        color: #4c63d2;
        margin-bottom: 0.5rem;
    }

    .welcome-subtitle {
        color: #666;
        font-size: 1.1rem;
        margin-bottom: 2rem;
    }

    .stats-row {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 1.5rem;
        margin-bottom: 3rem;
    }

    .stat-card {
        background: rgba(255, 255, 255, 0.8);
        border-radius: 15px;
        padding: 1.5rem;
        text-align: center;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    }

    .stat-icon {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1rem;
        font-size: 1.5rem;
        color: white;
    }

    .stat-number {
        font-size: 2rem;
        font-weight: 700;
        color: #4c63d2;
        display: block;
    }

    .stat-label {
        color: #666;
        font-weight: 500;
    }

    .functions-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 2rem;
        margin-top: 2rem;
    }

    .function-card {
        background: rgba(255, 255, 255, 0.95);
        border-radius: 20px;
        padding: 2rem;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    .function-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, #667eea, #764ba2);
        transform: scaleX(0);
        transition: transform 0.3s ease;
    }

    .function-card:hover::before {
        transform: scaleX(1);
    }

    .function-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
    }

    .function-icon {
        width: 80px;
        height: 80px;
        border-radius: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2rem;
        color: white;
        margin-bottom: 1.5rem;
    }

    .function-title {
        font-size: 1.3rem;
        font-weight: 600;
        color: #333;
        margin-bottom: 1rem;
    }

    .function-description {
        color: #666;
        margin-bottom: 1.5rem;
        line-height: 1.6;
    }

    .function-btn {
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: white;
        border: none;
        padding: 12px 30px;
        border-radius: 50px;
        font-weight: 600;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 10px;
        transition: all 0.3s ease;
    }

    .function-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        color: white;
    }

    .logout-card {
        border: 2px solid #ff4757;
    }

    .logout-btn {
        background: linear-gradient(135deg, #ff4757, #ff3742);
    }

    .logout-btn:hover {
        box-shadow: 0 10px 25px rgba(255, 71, 87, 0.3);
    }

    @media (max-width: 768px) {
        .welcome-title {
            font-size: 2rem;
        }

        .functions-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<div class="home-content">
    <div class="container">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <h1 class="welcome-title">Chào mừng trở lại, <%= user.getFullname() %>!</h1>
            <p class="welcome-subtitle">Hệ thống quản lý sản phẩm chuyên nghiệp cho doanh nghiệp hiện đại</p>

            <!-- Statistics -->
            <div class="stats-row">
                <div class="stat-card">
                    <div class="stat-icon" style="background: linear-gradient(135deg, #667eea, #764ba2);">
                        <i class="fas fa-boxes"></i>
                    </div>
                    <span class="stat-number">1,247</span>
                    <span class="stat-label">Sản phẩm</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon" style="background: linear-gradient(135deg, #f093fb, #f5576c);">
                        <i class="fas fa-tags"></i>
                    </div>
                    <span class="stat-number">24</span>
                    <span class="stat-label">Danh mục</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon" style="background: linear-gradient(135deg, #4facfe, #00f2fe);">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <span class="stat-number">432</span>
                    <span class="stat-label">Đơn hàng</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon" style="background: linear-gradient(135deg, #43e97b, #38f9d7);">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <span class="stat-number">₫2.4M</span>
                    <span class="stat-label">Doanh thu</span>
                </div>
            </div>
        </div>

        <!-- Functions Grid -->
        <div class="functions-grid">
            <!-- Product Management -->
            <div class="function-card">
                <div class="function-icon" style="background: linear-gradient(135deg, #667eea, #764ba2);">
                    <i class="fas fa-boxes"></i>
                </div>
                <h3 class="function-title">Quản lý sản phẩm</h3>
                <p class="function-description">
                    Thêm, sửa, xóa và theo dõi tất cả sản phẩm trong kho. Quản lý thông tin chi tiết, hình ảnh, giá cả và tồn kho.
                </p>
                <a href="products" class="function-btn">
                    <i class="fas fa-arrow-right"></i>
                    Truy cập ngay
                </a>
            </div>

            <!-- Category Management -->
            <div class="function-card">
                <div class="function-icon" style="background: linear-gradient(135deg, #f093fb, #f5576c);">
                    <i class="fas fa-tags"></i>
                </div>
                <h3 class="function-title">Quản lý danh mục</h3>
                <p class="function-description">
                    Tạo và quản lý các danh mục sản phẩm. Phân loại sản phẩm một cách khoa học và dễ tìm kiếm.
                </p>
                <a href="categories" class="function-btn">
                    <i class="fas fa-list"></i>
                    Quản lý danh mục
                </a>
            </div>

            <!-- Order Management -->
            <div class="function-card">
                <div class="function-icon" style="background: linear-gradient(135deg, #4facfe, #00f2fe);">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <h3 class="function-title">Quản lý đơn hàng</h3>
                <p class="function-description">
                    Theo dõi và xử lý đơn hàng từ khách hàng. Cập nhật trạng thái và quản lý giao hàng hiệu quả.
                </p>
                <a href="orders" class="function-btn">
                    <i class="fas fa-truck"></i>
                    Xem đơn hàng
                </a>
            </div>

            <!-- Customer Management -->
            <div class="function-card">
                <div class="function-icon" style="background: linear-gradient(135deg, #fa709a, #fee140);">
                    <i class="fas fa-users"></i>
                </div>
                <h3 class="function-title">Quản lý khách hàng</h3>
                <p class="function-description">
                    Quản lý thông tin khách hàng, lịch sử mua hàng và xây dựng mối quan hệ bền vững.
                </p>
                <a href="customers" class="function-btn">
                    <i class="fas fa-address-book"></i>
                    Danh sách khách hàng
                </a>
            </div>

            <!-- Inventory Management -->
            <div class="function-card">
                <div class="function-icon" style="background: linear-gradient(135deg, #a8edea, #fed6e3);">
                    <i class="fas fa-warehouse"></i>
                </div>
                <h3 class="function-title">Quản lý kho hàng</h3>
                <p class="function-description">
                    Theo dõi tồn kho, nhập xuất hàng và cảnh báo hàng sắp hết. Tối ưu hóa quản lý kho.
                </p>
                <a href="inventory" class="function-btn">
                    <i class="fas fa-clipboard-list"></i>
                    Kiểm tra kho
                </a>
            </div>

            <!-- Reports & Analytics -->
            <div class="function-card">
                <div class="function-icon" style="background: linear-gradient(135deg, #43e97b, #38f9d7);">
                    <i class="fas fa-chart-pie"></i>
                </div>
                <h3 class="function-title">Báo cáo & Thống kê</h3>
                <p class="function-description">
                    Xem báo cáo chi tiết về doanh thu, sản phẩm bán chạy và phân tích xu hướng kinh doanh.
                </p>
                <a href="reports" class="function-btn">
                    <i class="fas fa-chart-line"></i>
                    Xem báo cáo
                </a>
            </div>

            <!-- Settings -->
            <div class="function-card">
                <div class="function-icon" style="background: linear-gradient(135deg, #667eea, #764ba2);">
                    <i class="fas fa-cogs"></i>
                </div>
                <h3 class="function-title">Cài đặt hệ thống</h3>
                <p class="function-description">
                    Cấu hình các thông số hệ thống, quản lý người dùng và tùy chỉnh giao diện theo nhu cầu.
                </p>
                <a href="settings" class="function-btn">
                    <i class="fas fa-wrench"></i>
                    Cài đặt
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    // Add some interactive effects
    document.querySelectorAll('.function-card').forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
        });

        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });

    // Animate numbers
    function animateNumbers() {
        const numbers = document.querySelectorAll('.stat-number');
        numbers.forEach(number => {
            if (number.textContent.includes('₫')) return;
            const target = parseInt(number.textContent.replace(/,/g, ''));
            let current = 0;
            const increment = target / 100;
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    number.textContent = target.toLocaleString();
                    clearInterval(timer);
                } else {
                    number.textContent = Math.floor(current).toLocaleString();
                }
            }, 20);
        });
    }

    // Start animation when page loads
    window.addEventListener('load', animateNumbers);
</script>