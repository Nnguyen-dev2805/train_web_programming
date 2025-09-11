package model;

import java.util.Base64;

public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String fullname;
    private String phone;
    private byte[] imageData;

    public byte[] getImageData() {
        return imageData;
    }

    public void setImageData(byte[] imageData) {
        this.imageData = imageData;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    private String image;

    public User() {
    }

    public User(String username, String password, String email, String fullname, String phone, String image) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
        this.phone = phone;
        this.image = image;
    }

    public User(String fullname, String username, String password, String email) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.email = email;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username='" + username + '\'' + ", email='" + email + '\'' + ", fullname='" + fullname + '\'' + ", phone='" + phone + '\'' + ", image='" + image + '\'' + '}';
    }

    public String getImageDataUri() {
        System.out.println(imageData);
        if (imageData != null && imageData.length > 0) {
            System.out.println("kakakakakakka");
            String base64Image = Base64.getEncoder().encodeToString(imageData);
            return "data:image/png;base64," + base64Image;
        }
        return null;
    }
}
