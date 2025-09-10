package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import service.ProductService;

import java.io.IOException;
import java.util.List;

// /admin.categories , /admin/category/edit
@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        String action = request.getParameter("action");
        if (action == null) action = "list";

        System.out.println("Action = " + action);

        switch (action) {
            case "new":
                request.getRequestDispatcher("views/products/add.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Product product = productService.getProductById(id);
                request.setAttribute("product", product);
                request.getRequestDispatcher("views/products/edit.jsp").forward(request, response);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                productService.deleteProduct(id);
                response.sendRedirect("products");
                break;
            default: // list
                List<Product> products = productService.getProductsByUser(userId);
                // debug in ra console
                System.out.println("UserId = " + userId);

                if (products != null) {
                    System.out.println("Products size = " + products.size());
                    for (Product p : products) {
                        System.out.println(p.getId() + " - " + p.getName() + " - " + p.getPrice());
                    }
                } else {
                    System.out.println("Products = null");
                }
                request.setAttribute("products", products);
                request.getRequestDispatcher("views/products/list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Integer userId = (Integer) request.getSession().getAttribute("userId");

        String action = request.getParameter("action");
        if ("insert".equals(action)) {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            Product product = new Product(name, description, price, userId);
            productService.addProduct(product);
            response.sendRedirect("products");
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            Product product = new Product(id, name, description, price, userId);
            productService.updateProduct(product);
            response.sendRedirect("products");
        }
    }
}
