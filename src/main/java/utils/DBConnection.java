package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String URL = "jdbc:sqlserver://localhost:1433;"
            + "databaseName=Test;"
            + "encrypt=true;trustServerCertificate=true;";
    private static final String USER = "nhatnguyen";
    private static final String PASSWORD = "nguyen@282005";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Successful Connect DataBase!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Kết nối database thất bại!");
        }
        return conn;
    }
}
