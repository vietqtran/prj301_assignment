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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import vietqtran.services.CategoryDAO;
import vietqtran.services.ColorDAO;
import vietqtran.services.ProductDAO;
import vietqtran.services.ShopDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductAdminServlet extends HttpServlet {

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
	    out.println("<title>Servlet ProductServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
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
	String id = request.getParameter("id") != null ? request.getParameter("id").trim() : "";
	String name = request.getParameter("name") != null ? request.getParameter("name").trim() : "";
	String min = request.getParameter("min") != null ? request.getParameter("min").trim() : "";
	String max = request.getParameter("max") != null ? request.getParameter("max").trim() : "";
	String date = request.getParameter("date") != null ? request.getParameter("date").trim() : "";
	String color = request.getParameter("color") != null ? request.getParameter("color").trim() : "";
	String category = request.getParameter("category") != null ? request.getParameter("category").trim() : "";
	String shop = request.getParameter("shop") != null ? request.getParameter("shop").trim() : "";

	String query = "SELECT * FROM products WHERE 1=1";

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
	    if (!shop.isEmpty()) {
		query += " AND [shopId] = " + Long.parseLong(shop);
	    }
	} catch (NumberFormatException e) {
	    response.sendRedirect("not-found");
	    return;
	}

	ProductDAO productDao = new ProductDAO();
	ColorDAO colorDao = new ColorDAO();
	CategoryDAO categoryDao = new CategoryDAO();
	ShopDAO shopDao2 = new ShopDAO();
	try {
	    request.setAttribute("colors", colorDao.getAll());
	    request.setAttribute("categories", categoryDao.getAll());
	    request.setAttribute("shops", shopDao2.getAll());
	    request.setAttribute("tab", "products");
	    request.setAttribute("products", productDao.getSearchProducts(query));
	    productDao.closeConnection();
	    colorDao.closeConnection();
	    categoryDao.closeConnection();
	    shopDao2.closeConnection();
	} catch (SQLException ex) {
	    Logger.getLogger(ProductAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
	}
	request.getRequestDispatcher("admin.jsp").forward(request, response);
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
