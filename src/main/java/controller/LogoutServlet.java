package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy session hiện tại
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Xóa toàn bộ session
            session.invalidate();

            // Hoặc chỉ xóa các attribute cụ thể
            // session.removeAttribute("user");
            // session.removeAttribute("isLoggedIn");
        }

        // Chuyển hướng về trang chủ hoặc login
        response.sendRedirect(request.getContextPath() + "/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
