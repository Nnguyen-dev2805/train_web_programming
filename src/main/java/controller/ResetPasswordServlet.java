package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.UserDAO;

import java.io.IOException;

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("views/auth/reset-password.jsp");
        rd.forward(request, response);
    }

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        if (newPassword == null || newPassword.trim().isEmpty()) {
            request.setAttribute("error", "Mật khẩu không được để trống!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("views/auth/reset-password.jsp").forward(request, response);
            return;
        }

        // Cập nhật mật khẩu trong DB
        userDAO.updatePasswordByEmail(email, newPassword);

        request.setAttribute("message", "Mật khẩu đã được thay đổi thành công!");
        request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
    }
}
