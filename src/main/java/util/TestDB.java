package util;

import util.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestDB {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                System.out.println("✅ Đã kết nối SQL Server!");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT id, username, [password], email FROM users");
                while (rs.next()) {
                    System.out.println(
                            rs.getInt("id") + " | " +
                                    rs.getString("username") + " | " +
                                    rs.getString("password") + " | " +
                                    rs.getString("email")
                    );
                }
            } else {
                System.out.println("❌ Không thể kết nối SQL Server!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
