package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class DecoratorFilter implements Filter {

    private String headerHtml;
    private String footerHtml;


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        headerHtml = """
        <!DOCTYPE html>
        <html lang="vi">
        <head>
            <meta charset="UTF-8" />
            <title>Phần mềm quản lý sản xuất ưu việt</title>
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        </head>
        <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
          <div class="container">
            <a class="navbar-brand fw-bold" href="#">Odoo</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="#">Sản xuất</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Tổng quan</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Tính năng</a></li>
                <li class="nav-item"><a class="nav-link" href="#">PLM</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Bảo dưỡng</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Chất lượng</a></li>
              </ul>
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/login">Đăng nhập</a></li>
                <li class="nav-item"><a class="btn btn-outline-light" href="/register">Đăng ký</a></li>
              </ul>
            </div>
          </div>
        </nav>
        <main class="container my-5">
    """;
        footerHtml = """
        </main>
        <footer class="bg-primary text-white text-center py-3 mt-auto">
            &copy; 2024 Odoo - Phần mềm quản lý sản xuất ưu việt. Bản quyền thuộc về Odoo.
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>
        </html>
    """;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
// Lấy phần path sau context path
        String path = uri.substring(req.getContextPath().length());
        if (path.equals("/") || path.equals("") || path.endsWith(".jsp") || path.equals("/login") || path.equals("/register") || path.equals("/products")) {
            // Áp dụng filter chèn header/footer
            res.setCharacterEncoding("UTF-8");
            res.setContentType("text/html;charset=UTF-8");
            CharResponseWrapper responseWrapper = new CharResponseWrapper(res);
            chain.doFilter(request, responseWrapper);
            String originalContent = responseWrapper.toString();
            PrintWriter out = res.getWriter();
            out.println(headerHtml);
            out.println(originalContent);
            out.println(footerHtml);
            out.close();
        } else {
            chain.doFilter(request, response);
        }
    }


    @Override
    public void destroy() {
    }
}
