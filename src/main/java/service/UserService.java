package service;

import model.User;
import model.UserDAO;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public String login(String username, String password) {
        User user = userDAO.getUserByUsername(username);
        if (user == null) {
            return "User not found";
        }
        if (!user.getPassword().equals(password)) {
            return "Wrong password";
        }
        return "SUCCESS";
    }

    public String register(String fullname, String username, String password, String email) {
        if (userDAO.getUserByUsername(username) != null) {
            return "Username already exists";
        }
        if (!email.contains("@")) {
            return "Invalid email";
        }
        boolean inserted = userDAO.insertUser(new User(fullname,username, password, email));
        return inserted ? "SUCCESS" : "Failed to register";
    }

    public int getUserIdByUsername(String username) {
        return userDAO.getUserByUsername(username).getId();
    }

    public User getUserByUsername(String username) {
        return userDAO.getUserByUsername(username);
    }
}
