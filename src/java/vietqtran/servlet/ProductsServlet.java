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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import vietqtran.model.Product;
import vietqtran.services.CategoryDAO;
import vietqtran.services.ColorDAO;
import vietqtran.services.ProductDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "ProductsServlet", urlPatterns = {"/products"})
public class ProductsServlet extends HttpServlet {

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
	    out.println("<title>Servlet ProductsServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ProductsServlet at " + request.getContextPath() + "</h1>");
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
	//Call DAO
	CategoryDAO categoryDao = new CategoryDAO();
	ColorDAO colorDao = new ColorDAO();
	ProductDAO productDao = new ProductDAO();
	try {
	    //Init
	    String filterQuery = "SELECT * FROM products WHERE 1=1";

	    //Logic
	    String categoryID = request.getParameter("cid") != null ? request.getParameter("cid").trim() : "";
	    String colorId = request.getParameter("clid") != null ? request.getParameter("clid").trim() : "";
	    String min = request.getParameter("min") != null ? request.getParameter("min").trim() : "";
	    String max = request.getParameter("max") != null ? request.getParameter("max").trim() : "";
	    String star = request.getParameter("star") != null ? request.getParameter("star").trim() : "";

	    if (!categoryID.isEmpty()) {
		filterQuery += " AND [categoryId] = " + Long.parseLong(categoryID);
	    }
	    if (!colorId.isEmpty()) {
		filterQuery += " AND [color] = " + Long.parseLong(colorId);
	    }
	    if (!min.isEmpty()) {
		filterQuery += " AND [price] >= " + Double.parseDouble(min);
	    }
	    if (!max.isEmpty()) {
		filterQuery += " AND [price] <= " + Double.parseDouble(max);
	    }
	    if (!star.isEmpty()) {
		filterQuery += " AND [rate] >= " + Double.parseDouble(star);
	    }

	    int itemsPerPage = 60;
	    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
	    int startIndex = (currentPage - 1) * itemsPerPage;
	    List<Product> filterProducts = productDao.getAll(filterQuery);
	    int endIndex = Math.min(startIndex + itemsPerPage, filterProducts.size());
	    List<Product> products = productDao.getByPagination(startIndex, endIndex, filterProducts);

	    //Set Attribute
	    request.setAttribute("categories", categoryDao.getAll());
	    request.setAttribute("colors", colorDao.getAll());
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("productsSize", filterProducts.size());
	    request.setAttribute("products", products);

	    //Close Connection
	    categoryDao.closeConnection();
	    colorDao.closeConnection();
	    productDao.closeConnection();

	    //Redirect
	    request.getRequestDispatcher("products.jsp").forward(request, response);
	} catch (SQLException ex) {
	    Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
	}
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
	processRequest(request, response);
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
