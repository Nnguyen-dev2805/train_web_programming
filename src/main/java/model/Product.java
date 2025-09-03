package model;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private int userId;

    public Product() {}

    public Product(int id, String name, String description, double price, int userId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.userId = userId;
    }

    public Product(String name, String description, double price, int userId) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.userId = userId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
}
