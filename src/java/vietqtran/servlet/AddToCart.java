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
import vietqtran.model.Cart;
import vietqtran.model.CartProduct;
import vietqtran.model.Product;
import vietqtran.model.Shop;
import vietqtran.model.User;
import vietqtran.services.CartDAO;
import vietqtran.services.CartProductDAO;
import vietqtran.services.ProductDAO;
import vietqtran.services.ShopDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/addToCart"})
public class AddToCart extends HttpServlet {

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
	    out.println("<title>Servlet AddToCart</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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
	processRequest(request, response);
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
	try {
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");
	    ProductDAO productDao = new ProductDAO();
	    ShopDAO shopDao = new ShopDAO();
	    CartDAO cartDAO = new CartDAO();
	    CartProductDAO cartProductDao = new CartProductDAO();
	    CartProduct cartProduct = new CartProduct();

	    long productId = 0;
	    try {
		productId = Long.parseLong(request.getParameter("productId").trim());
	    } catch (NumberFormatException e) {
		response.sendRedirect("not-found");
		return;
	    }

	    Product product = productDao.get(productId);

	    if (product == null) {
		response.sendRedirect("not-found");
		return;
	    } else {
		cartProduct.setProductId(product.getId());
	    }

	    Cart cart = cartDAO.getByUserId(user.getId());
	    if (cart == null) {
		response.sendRedirect("login");
		return;
	    }
	    cartProduct.setCartId(cart.getId());

	    Shop shop = shopDao.get(product.getShopId());
	    cartProduct.setShopId(shop.getId());

	    String sid = request.getParameter("size") != null ? request.getParameter("size").trim() : "";
	    if (sid.isEmpty()) {
		cartProduct.setSizeId(-1);
	    } else {
		long sizeId = Long.parseLong(request.getParameter("size").trim());
		cartProduct.setSizeId(sizeId);
	    }
	    try {
		int quantity = request.getParameter("quantity") != null ? Integer.parseInt(request.getParameter("quantity").trim()) : 1;
		cartProduct.setQuantity(quantity);
	    } catch (NumberFormatException e) {
		response.sendRedirect("not-found");
		return;
	    }
	    cartProductDao.add(cartProduct);
	    productDao.closeConnection();
	    shopDao.closeConnection();
	    cartDAO.closeConnection();
	    cartProductDao.closeConnection();
	    response.sendRedirect("productDetail?id=" + productId);
	} catch (SQLException ex) {
	}

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
