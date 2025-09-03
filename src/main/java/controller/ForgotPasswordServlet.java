package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.UserDAO;

import java.io.IOException;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        if (userDAO.isEmailExists(email)) {
            // Nếu email tồn tại -> chuyển sang trang reset-password.jsp
            request.setAttribute("email", email); // truyền email sang trang reset
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Email không tồn tại trong hệ thống!");
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
        }
    }
}
