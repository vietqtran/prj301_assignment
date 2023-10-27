/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vietqtran.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import vietqtran.model.Product;
import vietqtran.model.ProductImage;
import vietqtran.model.Shop;
import vietqtran.model.SizeProduct;
import vietqtran.services.CategoryDAO;
import vietqtran.services.ColorDAO;
import vietqtran.services.ProductDAO;
import vietqtran.services.ProductImageDAO;
import vietqtran.services.SizeProductDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "ShopProduct", urlPatterns = {"/shopProduct"})
public class ShopProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	try ( PrintWriter out = response.getWriter()) {
	    /* TODO output your page here. You may use following sample code. */
	    out.println("<!DOCTYPE html>");
	    out.println("<html>");
	    out.println("<head>");
	    out.println("<title>Servlet ShopSearchProduct</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ShopSearchProduct at " + request.getContextPath() + "</h1>");
	    out.println("</body>");
	    out.println("</html>");
	}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	HttpSession session = request.getSession();
	String id = request.getParameter("id") != null ? request.getParameter("id").trim() : "";
	String name = request.getParameter("name") != null ? request.getParameter("name").trim() : "";
	String min = request.getParameter("min") != null ? request.getParameter("min").trim() : "";
	String max = request.getParameter("max") != null ? request.getParameter("max").trim() : "";
	String date = request.getParameter("date") != null ? request.getParameter("date").trim() : "";
	String color = request.getParameter("color") != null ? request.getParameter("color").trim() : "";
	String category = request.getParameter("category") != null ? request.getParameter("category").trim() : "";
	String query = "SELECT * FROM products WHERE shopId = " + ((Shop) session.getAttribute("shop")).getId();
	try {
	    if (!id.isEmpty()) {
		query += " AND id = " + Long.parseLong(id);
	    }
	    if (!name.isEmpty()) {
		query += " AND name like '%" + name + "%'";
	    }
	    if (!min.isEmpty()) {
		query += " AND price >= " + Double.parseDouble(min);
	    }
	    if (!max.isEmpty()) {
		query += " AND price <= " + Double.parseDouble(max);
	    }
	    if (!date.isEmpty()) {
		query += " AND [createDate] = '" + date + "'";
	    }
	    if (!color.isEmpty()) {
		query += " AND [color] = " + Long.parseLong(color);
	    }
	    if (!category.isEmpty()) {
		query += " AND [categoryId] = " + Long.parseLong(category);
	    }
	} catch (NumberFormatException e) {
	    response.sendRedirect("not-found");
	    return;
	}

	ProductDAO productDao = new ProductDAO();
	ColorDAO colorDao = new ColorDAO();
	CategoryDAO categoryDao = new CategoryDAO();
	try {
	    request.setAttribute("colors", colorDao.getAll());
	    request.setAttribute("categories", categoryDao.getAll());
	    request.setAttribute("tab", "products");
	    request.setAttribute("products", productDao.getSearchProducts(query));
	    productDao.closeConnection();
	    colorDao.closeConnection();
	    categoryDao.closeConnection();
	} catch (SQLException ex) {
	    Logger.getLogger(ProductAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
	}
	request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	HttpSession session = request.getSession();
	Shop shop = (Shop) session.getAttribute("shop");
	if (shop == null) {
	    response.sendRedirect("shopLogin");
	    return;
	}

	ProductDAO productDao = new ProductDAO();
	ProductImageDAO imageDao = new ProductImageDAO();
	SizeProductDAO sizeDao = new SizeProductDAO();

	String name = request.getParameter("name").trim();
	long shopId = Long.parseLong(request.getParameter("shopId").trim());
	double price = Double.parseDouble(request.getParameter("price").trim());
	double salePrice = Double.parseDouble(request.getParameter("salePrice").trim());
	String description = request.getParameter("description").trim();
	long color = Long.parseLong(request.getParameter("color").trim());
	long category = Long.parseLong(request.getParameter("category").trim());
	String url = request.getParameter("mainImage").trim();
	String address = shop.getAddress();
	String[] parts = address.split(", ");
	String city = parts[parts.length - 1];
	Product product = new Product(name, price, salePrice, description, city, 0, 0, color, category, 0, shopId, shop.getName(), "", url);
	try {
	    long productId = productDao.addWithGetIndex(product);
	    imageDao.add(new ProductImage(productId, url, 1));
	    String[] sizeNames = request.getParameterValues("sizeName");
	    if (sizeNames == null) {
		sizeNames = new String[0];
	    }
	    String[] inventor = request.getParameterValues("inventory");
	    if (inventor == null) {
		inventor = new String[0];
	    }
	    for (int i = 0; i < sizeNames.length; i++) {
		sizeDao.add(new SizeProduct(Integer.parseInt(inventor[i]), sizeNames[i], productId));
	    }
	    String[] subImages = request.getParameterValues("subImage");
	    if (subImages == null) {
		subImages = new String[0];
	    }
	    for (String subImage : subImages) {
		imageDao.add(new ProductImage(productId, subImage, 2));
	    }
	    productDao.closeConnection();
	    imageDao.closeConnection();
	    sizeDao.closeConnection();
	} catch (SQLException ex) {
	    Logger.getLogger(ShopProduct.class.getName()).log(Level.SEVERE, null, ex);
	}
	response.sendRedirect("shop-dashboard?tab=products");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}
