package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String URL = "jdbc:sqlserver://localhost:1433;"
            + "databaseName=Test;"
            + "encrypt=true;trustServerCertificate=true;";
    private static final String USER = "nhatnguyen";           // đổi thành user SQL Server của bạn
    private static final String PASSWORD = "nguyen@282005";   // đổi thành mật khẩu SQL Server của bạn

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load driver SQL Server
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            // Tạo kết nối
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Kết nối database thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Kết nối database thất bại!");
        }
        return conn;
    }
}
