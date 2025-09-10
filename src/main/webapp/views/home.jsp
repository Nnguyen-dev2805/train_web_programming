<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ProductManager Pro - Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Exo+2:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/home.css">
</head>
<body>
<!-- Animated Background -->
<div class="stars" id="stars"></div>
<div class="particles" id="particles"></div>
<div class="matrix" id="matrix"></div>

<!-- Navigation -->
<nav class="cyber-nav">
    <div class="nav-container">
        <div class="nav-brand">
            <i class="fas fa-cube"></i>
            <span>ProductManager Pro</span>
        </div>
        <div class="nav-user">
            <div class="user-avatar">
                <i class="fas fa-user-astronaut"></i>
            </div>
            <div class="user-info">
                <span class="user-name"><%= user %></span>
                <span class="user-role">Administrator</span>
            </div>
            <div class="nav-actions">
                <button class="cyber-btn-sm" onclick="toggleTheme()">
                    <i class="fas fa-moon"></i>
                </button>
                <button class="cyber-btn-sm" onclick="showNotifications()">
                    <i class="fas fa-bell"></i>
                    <span class="notification-badge">3</span>
                </button>
            </div>
        </div>
    </div>
</nav>

<!-- Main Container -->
<div class="main-container">
    <!-- Welcome Section -->
    <div class="welcome-section">
        <div class="container">
            <div class="welcome-card">
                <div class="welcome-content">
                    <h1 class="welcome-title">
                        <span class="typing-text">Chào mừng trở lại,</span>
                        <span class="user-highlight"><%= user %>!</span>
                    </h1>
                    <p class="welcome-subtitle">Hệ thống quản lý sản phẩm chuyên nghiệp dành cho doanh nghiệp hiện đại</p>
                    <div class="welcome-stats">
                        <div class="stat-item">
                            <i class="fas fa-chart-line"></i>
                            <div class="stat-content">
                                <span class="stat-number" data-target="1247">0</span>
                                <span class="stat-label">Sản phẩm</span>
                            </div>
                        </div>
                        <div class="stat-item">
                            <i class="fas fa-users"></i>
                            <div class="stat-content">
                                <span class="stat-number" data-target="89">0</span>
                                <span class="stat-label">Khách hàng</span>
                            </div>
                        </div>
                        <div class="stat-item">
                            <i class="fas fa-shopping-cart"></i>
                            <div class="stat-content">
                                <span class="stat-number" data-target="432">0</span>
                                <span class="stat-label">Đơn hàng</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="welcome-visual">
                    <div class="hologram-container">
                        <div class="hologram-cube">
                            <div class="cube-face front"><i class="fas fa-box"></i></div>
                            <div class="cube-face back"><i class="fas fa-cog"></i></div>
                            <div class="cube-face right"><i class="fas fa-chart-bar"></i></div>
                            <div class="cube-face left"><i class="fas fa-users"></i></div>
                            <div class="cube-face top"><i class="fas fa-star"></i></div>
                            <div class="cube-face bottom"><i class="fas fa-rocket"></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Dashboard Cards -->
    <div class="dashboard-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Trung tâm điều khiển</h2>
                <p class="section-subtitle">Quản lý toàn bộ hệ thống từ một nơi</p>
            </div>

            <div class="row g-4">
                <!-- Product Management -->
                <div class="col-lg-4 col-md-6">
                    <div class="cyber-card" data-tilt>
                        <div class="card-icon">
                            <i class="fas fa-boxes"></i>
                        </div>
                        <div class="card-content">
                            <h3>Quản lý sản phẩm</h3>
                            <p>Thêm, sửa, xóa và theo dõi tất cả sản phẩm trong kho</p>
                            <div class="card-features">
                                <span><i class="fas fa-check"></i> Quản lý kho</span>
                                <span><i class="fas fa-check"></i> Theo dõi tồn kho</span>
                                <span><i class="fas fa-check"></i> Báo cáo chi tiết</span>
                            </div>
                        </div>
                        <div class="card-action">
                            <a href="products" class="cyber-btn">
                                <span>Truy cập</span>
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="card-glow"></div>
                    </div>
                </div>

                <!-- Analytics -->
                <div class="col-lg-4 col-md-6">
                    <div class="cyber-card" data-tilt>
                        <div class="card-icon">
                            <i class="fas fa-chart-pie"></i>
                        </div>
                        <div class="card-content">
                            <h3>Thống kê & Phân tích</h3>
                            <p>Xem báo cáo chi tiết và phân tích dữ liệu kinh doanh</p>
                            <div class="card-features">
                                <span><i class="fas fa-check"></i> Biểu đồ real-time</span>
                                <span><i class="fas fa-check"></i> Báo cáo tùy chỉnh</span>
                                <span><i class="fas fa-check"></i> Xuất dữ liệu</span>
                            </div>
                        </div>
                        <div class="card-action">
                            <a href="analytics" class="cyber-btn">
                                <span>Xem báo cáo</span>
                                <i class="fas fa-chart-line"></i>
                            </a>
                        </div>
                        <div class="card-glow"></div>
                    </div>
                </div>

                <!-- User Management -->
                <div class="col-lg-4 col-md-6">
                    <div class="cyber-card" data-tilt>
                        <div class="card-icon">
                            <i class="fas fa-users-cog"></i>
                        </div>
                        <div class="card-content">
                            <h3>Quản lý người dùng</h3>
                            <p>Quản lý tài khoản và phân quyền người dùng hệ thống</p>
                            <div class="card-features">
                                <span><i class="fas fa-check"></i> Phân quyền linh hoạt</span>
                                <span><i class="fas fa-check"></i> Bảo mật cao</span>
                                <span><i class="fas fa-check"></i> Audit logs</span>
                            </div>
                        </div>
                        <div class="card-action">
                            <a href="users" class="cyber-btn">
                                <span>Quản lý</span>
                                <i class="fas fa-users"></i>
                            </a>
                        </div>
                        <div class="card-glow"></div>
                    </div>
                </div>

                <!-- Orders -->
                <div class="col-lg-4 col-md-6">
                    <div class="cyber-card" data-tilt>
                        <div class="card-icon">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="card-content">
                            <h3>Quản lý đơn hàng</h3>
                            <p>Theo dõi và xử lý đơn hàng từ khách hàng</p>
                            <div class="card-features">
                                <span><i class="fas fa-check"></i> Theo dõi real-time</span>
                                <span><i class="fas fa-check"></i> Xử lý tự động</span>
                                <span><i class="fas fa-check"></i> Thông báo SMS</span>
                            </div>
                        </div>
                        <div class="card-action">
                            <a href="orders" class="cyber-btn">
                                <span>Xem đơn hàng</span>
                                <i class="fas fa-truck"></i>
                            </a>
                        </div>
                        <div class="card-glow"></div>
                    </div>
                </div>

                <!-- Settings -->
                <div class="col-lg-4 col-md-6">
                    <div class="cyber-card" data-tilt>
                        <div class="card-icon">
                            <i class="fas fa-cogs"></i>
                        </div>
                        <div class="card-content">
                            <h3>Cấu hình hệ thống</h3>
                            <p>Thiết lập và tùy chỉnh các thông số hệ thống</p>
                            <div class="card-features">
                                <span><i class="fas fa-check"></i> Cấu hình linh hoạt</span>
                                <span><i class="fas fa-check"></i> Backup tự động</span>
                                <span><i class="fas fa-check"></i> Bảo trì hệ thống</span>
                            </div>
                        </div>
                        <div class="card-action">
                            <a href="settings" class="cyber-btn">
                                <span>Cài đặt</span>
                                <i class="fas fa-wrench"></i>
                            </a>
                        </div>
                        <div class="card-glow"></div>
                    </div>
                </div>

                <!-- Logout -->
                <div class="col-lg-4 col-md-6">
                    <div class="cyber-card logout-card" data-tilt>
                        <div class="card-icon">
                            <i class="fas fa-sign-out-alt"></i>
                        </div>
                        <div class="card-content">
                            <h3>Đăng xuất an toàn</h3>
                            <p>Kết thúc phiên làm việc và bảo vệ tài khoản</p>
                            <div class="card-features">
                                <span><i class="fas fa-check"></i> Xóa session</span>
                                <span><i class="fas fa-check"></i> Lưu trạng thái</span>
                                <span><i class="fas fa-check"></i> Bảo mật tối đa</span>
                            </div>
                        </div>
                        <div class="card-action">
                            <a href="login" class="cyber-btn logout-btn" onclick="return confirmLogout()">
                                <span>Đăng xuất</span>
                                <i class="fas fa-power-off"></i>
                            </a>
                        </div>
                        <div class="card-glow"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="cyber-footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-brand">
                    <i class="fas fa-cube"></i>
                    <span>ProductManager Pro</span>
                </div>
                <div class="footer-text">
                    © 2025 ProductManager Pro. Hệ thống quản lý sản phẩm thế hệ mới.
                </div>
                <div class="footer-links">
                    <a href="#" class="footer-link">Chính sách bảo mật</a>
                    <a href="#" class="footer-link">Điều khoản sử dụng</a>
                    <a href="#" class="footer-link">Hỗ trợ</a>
                </div>
            </div>
        </div>
    </footer>
</div>

<!-- Notification Toast -->
<div class="toast-container position-fixed top-0 end-0 p-3">
    <div id="welcomeToast" class="toast cyber-toast" role="alert">
        <div class="toast-header">
            <i class="fas fa-rocket me-2 text-primary"></i>
            <strong class="me-auto">ProductManager Pro</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
        </div>
        <div class="toast-body">
            Chào mừng <%= user %> đã quay trở lại! Hệ thống đã sẵn sàng.
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JS -->
<script src="../assets/js/home.js"></script>
</body>
</html>
