package controller;

import service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String result = userService.login(username, password);

        if ("SUCCESS".equals(result)) {
            HttpSession session = request.getSession();
            int userId = userService.getUserIdByUsername(username);

            session.setAttribute("username", username);
            session.setAttribute("userId", userId);

            response.sendRedirect("welcome.jsp");
        } else {
            request.setAttribute("error", result);
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
}
