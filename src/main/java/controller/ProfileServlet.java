package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.User;
import model.UserDAO;
import filter.HeaderFooter;
import service.ProfileService;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@WebServlet("/profile")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 50    // 50 MB
)
public class ProfileServlet extends HttpServlet {

    private UserDAO userDAO;

    private ProfileService profileService;

    @Override
    public void init() throws ServletException {
        profileService = new ProfileService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User currentUser = getCurrentUser(request, response);
        if (currentUser == null) return;

        try {
            if (currentUser == null) {
                response.sendRedirect("login");
                return;
            }

            // Render profile page
            renderProfilePage(request, response, currentUser, null, null);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Có lỗi xảy ra khi tải thông tin tài khoản");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Kiểm tra authentication
        User currentUser = getCurrentUser(request, response);
        if (currentUser == null) return;

        try {
            // Lấy dữ liệu từ form (chỉ các trường được phép sửa)
            String username = currentUser.getUsername();
            String password = currentUser.getPassword();
            String email = request.getParameter("email");
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            Part imagePart = request.getPart("image");

            // Gọi service để cập nhật profile
            boolean success = profileService.updateUserProfile(username, email, fullname, phone,password, imagePart);

            if (success) {
                // Lấy user đã cập nhật để hiển thị
                User updatedUser = profileService.getUserById(currentUser.getId());
                System.out.println("345 " + updatedUser.getId());
                System.out.println("12566 " + updatedUser.getImageData());
                System.out.println("123   " + updatedUser.getImageDataUri());
                // Cập nhật session
                HttpSession session = request.getSession();
                session.setAttribute("user", updatedUser);
                session.setAttribute("fullName", updatedUser.getFullname());

                String successMessage = "Cập nhật thông tin thành công!";
                renderProfilePage(request, response, updatedUser, null, successMessage);
            } else {
                String errorMessage = "Có lỗi xảy ra khi cập nhật thông tin!";
                renderProfilePage(request, response, currentUser, errorMessage, null);
            }

        } catch (IllegalArgumentException e) {
            renderProfilePage(request, response, currentUser, e.getMessage(), null);
        } catch (Exception e) {
            handleError(response, e, "Có lỗi xảy ra khi cập nhật thông tin");
        }
    }

    /**
     * Lấy user hiện tại từ session và kiểm tra authentication
     */
    private User getCurrentUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login");
            return null;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return null;
        }

        return user;
    }

    private void renderProfilePage(HttpServletRequest request, HttpServletResponse response,
                                   User user, String errorMessage, String successMessage)
            throws ServletException, IOException {

        // Set attributes cho JSP
        request.setAttribute("user", user);
        request.setAttribute("errorMessage", errorMessage);
        request.setAttribute("successMessage", successMessage);

        // Tạo HTML response với header, JSP content và footer
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Header
            HttpSession session = request.getSession();
            out.write(HeaderFooter.getHeaderHtml(session, user.getFullname()));

            // Include JSP content
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/auth/profile.jsp");
            dispatcher.include(request, response);

            // Footer
            out.write(HeaderFooter.getFooterHtml());

        } catch (Exception e) {
            throw new ServletException("Error rendering profile page", e);
        }
    }

    /**
     * Xử lý lỗi và trả về error response
     */
    private void handleError(HttpServletResponse response, Exception e, String message)
            throws IOException {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, message);
    }
}