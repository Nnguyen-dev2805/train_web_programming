//package model;
//
//import utils.DBConnection;
//import java.sql.*;
//
//public class UserDAO {
//
//    // function get information for login
//    public User getUserByUsername(String username) {
//        User user = null;
//        try (Connection conn = DBConnection.getConnection()) {
//            String sql = "SELECT * FROM users WHERE username = ?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, username);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                user = new User();
//                user.setId(rs.getInt("id"));
//                user.setUsername(rs.getString("username"));
//                user.setPassword(rs.getString("password"));
//                user.setEmail(rs.getString("email"));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return user;
//    }
//
//    // function for register
//    public boolean insertUser(User user) {
//        try (Connection conn = DBConnection.getConnection()) {
//            String sql = "INSERT INTO users(username, password, email) VALUES (?, ?, ?)";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, user.getUsername());
//            ps.setString(2, user.getPassword());
//            ps.setString(3, user.getEmail());
//            int rows = ps.executeUpdate();
//            return rows > 0;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//
//    public boolean isEmailExists(String email) {
//        try (Connection conn = DBConnection.getConnection()) {
//            String sql = "SELECT * FROM users WHERE email=?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, email);
//            ResultSet rs = ps.executeQuery();
//            return rs.next();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public void updatePasswordByEmail(String email, String newPass) {
//        try (Connection conn = DBConnection.getConnection()) {
//            String sql = "UPDATE users SET password=? WHERE email=?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, newPass);
//            ps.setString(2, email);
//            ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    /**
//     * Cập nhật thông tin user
//     */
//    public boolean updateUser(User user) throws SQLException {
//        String sql = "UPDATE users SET email = ?, fullname = ?, phone = ?, image_data = ? WHERE id = ?";
//
//        try (Connection conn = DatabaseConnection.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(sql)) {
//
//            stmt.setString(1, user.getEmail());
//            stmt.setString(2, user.getFullname());
//            stmt.setString(3, user.getPhone());
//
//            // Set image data as binary
//            if (user.getImageData() != null) {
//                stmt.setBytes(4, user.getImageData());
//            } else {
//                stmt.setNull(4, java.sql.Types.VARBINARY);
//            }
//
//            stmt.setInt(5, user.getId());
//
//            int rowsAffected = stmt.executeUpdate();
//            return rowsAffected > 0;
//        }
//    }
//}


package model;

import utils.DBConnection;
import java.sql.*;

public class UserDAO {

    // function get information for login
    public User getUserByUsername(String username) {
        User user = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = mapResultSetToUser(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // function for register
    public boolean insertUser(User user) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO users(fullname, username, password, email) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isEmailExists(String email) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updatePasswordByEmail(String email, String newPass) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE users SET password=? WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPass);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Cập nhật thông tin user (chỉ cập nhật email, fullname, phone, image_data)
     */
    public boolean updateUser(User user) throws SQLException {
        String sql = "UPDATE users SET email = ?, fullname = ?, phone = ?, image = ? WHERE id = ?";

        System.out.println(user.getId());
        System.out.println(user.getFullname());
        System.out.println(user.getPhone());
        System.out.println(user.getEmail());
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getFullname());
            stmt.setString(3, user.getPhone());

            // Set image data as binary
            if (user.getImageData() != null) {
                stmt.setBytes(4, user.getImageData());

            } else {
                stmt.setNull(4, java.sql.Types.VARBINARY);
            }



            stmt.setInt(5, user.getId());

            System.out.println(user.getImageData());

            int rowsAffected = stmt.executeUpdate();
            System.out.println(rowsAffected);

            return rowsAffected > 0;
//            return true;
        }

    }

    /**
     * Lấy user theo ID với tất cả thông tin bao gồm image binary data
     */
    public User getUserById(int userId) throws SQLException {
        String sql = "SELECT id, username, email, password, fullname, phone, " +
                "image FROM users WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
        }
        System.out.println();
        return null;
    }

    /**
     * Kiểm tra email có tồn tại cho user khác không (dùng cho update profile)
     */
    public boolean isEmailExistForOtherUser(String email, int currentUserId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ? AND id != ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setInt(2, currentUserId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    /**
     * Kiểm tra username có tồn tại cho user khác không (để tương lai có thể dùng)
     */
    public boolean isUsernameExistForOtherUser(String username, int currentUserId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM users WHERE username = ? AND id != ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setInt(2, currentUserId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    /**
     * Map ResultSet to User object với đầy đủ thông tin
     */
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setUsername(rs.getString("username"));
        user.setEmail(rs.getString("email"));

        // Chỉ set password nếu có trong ResultSet
        try {
            user.setPassword(rs.getString("password"));
        } catch (SQLException e) {
            // Ignore nếu không có cột password trong query
        }

        // Set các thông tin khác nếu có
        try {
            user.setFullname(rs.getString("fullname"));
        } catch (SQLException e) {
            // Ignore nếu không có cột fullname
        }

        try {
            user.setPhone(rs.getString("phone"));
        } catch (SQLException e) {
            // Ignore nếu không có cột phone
        }

        // Lấy binary image data
        try {
            byte[] imageData = rs.getBytes("image");
            user.setImageData(imageData);
        } catch (SQLException e) {
            // Ignore nếu không có cột image_data
        }

        return user;
    }

    /**
     * Lấy user với thông tin cơ bản cho login (không cần image data)
     */
    public User getUserForLogin(String username) {
        User user = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT id, username, password, email, fullname, role, status FROM users WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = mapResultSetToUser(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}