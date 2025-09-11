package service;

import jakarta.servlet.http.Part;
import model.User;
import model.UserDAO;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

public class ProfileService {
    private UserDAO userDAO;
    private static final int MAX_IMAGE_SIZE = 1024 * 1024 * 5; // 5MB
    private static final String[] ALLOWED_IMAGE_TYPES = {"image/jpeg", "image/jpg", "image/png", "image/gif"};

    public ProfileService() {
        this.userDAO = new UserDAO();
    }

    public ProfileService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    /**
     * Cập nhật thông tin user
     */
    public boolean updateUserProfile(String username, String email,
                                     String fullname, String phone, String password, Part imagePart)
            throws Exception {

        User currentUser = userDAO.getUserByUsername(username);
        // Validate dữ liệu đầu vào
        validateUserInput(username, email, fullname, phone, currentUser.getId());

        // Tạo user object mới với thông tin cập nhật
        User updatedUser = createUpdatedUser(currentUser, username, email, fullname, phone, password);

        // Xử lý upload ảnh nếu có
        if (imagePart != null && imagePart.getSize() > 0) {
           System.out.println("ahshahshsahsahshs");
            byte[] imageData = processImageUpload(imagePart);
            updatedUser.setImageData(imageData);
        } else {
            // Giữ nguyên ảnh cũ
            updatedUser.setImageData(currentUser.getImageData());
        }

        // Cập nhật vào database
        return userDAO.updateUser(updatedUser);
    }

    private void validateUserInput(String username, String email, String fullname,
                                   String phone, int currentUserId) throws Exception {

        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email không được để trống!");
        }

        if (!isValidEmail(email)) {
            throw new IllegalArgumentException("Email không hợp lệ!");
        }

        if (fullname == null || fullname.trim().isEmpty()) {
            throw new IllegalArgumentException("Họ tên không được để trống!");
        }

        if (userDAO.isEmailExistForOtherUser(email, currentUserId)) {
            throw new IllegalArgumentException("Email đã được sử dụng!");
        }
    }

    /**
     * Validate email format
     */
    private boolean isValidEmail(String email) {
        return email.matches("^[A-Za-z0-9+_.-]+@([A-Za-z0-9.-]+\\.[A-Za-z]{2,})$");
    }

    /**
     * Tạo user object với thông tin cập nhật
     */
    private User createUpdatedUser(User currentUser, String username, String email,
                                   String fullname, String phone, String password) {
        User updatedUser = new User();
        updatedUser.setId(currentUser.getId());
        updatedUser.setUsername(username.trim());
        updatedUser.setEmail(email.trim());
        updatedUser.setFullname(fullname.trim());
        updatedUser.setPhone(phone != null ? phone.trim() : null);

        return updatedUser;
    }

    /**
     * Xử lý upload và validate ảnh
     */
    private byte[] processImageUpload(Part imagePart) throws IOException {
        // Validate file size
        if (imagePart.getSize() > MAX_IMAGE_SIZE) {
            throw new IllegalArgumentException("Kích thước ảnh không được vượt quá 5MB!");
        }

        // Validate content type
        String contentType = imagePart.getContentType();
        if (!isValidImageType(contentType)) {
            throw new IllegalArgumentException("Chỉ chấp nhận file ảnh định dạng JPG, JPEG, PNG, GIF!");
        }

        // Convert InputStream to byte array
        return inputStreamToByteArray(imagePart.getInputStream());
    }

    /**
     * Chuyển InputStream thành byte array
     */
    private byte[] inputStreamToByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];

        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }

        buffer.flush();
        return buffer.toByteArray();
    }

    /**
     * Kiểm tra định dạng ảnh hợp lệ
     */
    private boolean isValidImageType(String contentType) {
        if (contentType == null) return false;

        for (String allowedType : ALLOWED_IMAGE_TYPES) {
            if (contentType.toLowerCase().contains(allowedType.toLowerCase())) {
                return true;
            }
        }
        return false;
    }

    public User getUserById(int id) throws SQLException {
        return userDAO.getUserById(id);
    }
}
