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
import vietqtran.model.Product;
import vietqtran.model.ProductImage;
import vietqtran.model.SizeProduct;
import vietqtran.services.ProductDAO;
import vietqtran.services.ProductImageDAO;
import vietqtran.services.SizeProductDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "debug", urlPatterns = {"/debug"})
public class debug extends HttpServlet {

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
	    out.println("<title>Servlet debug</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet debug at " + request.getContextPath() + "</h1>");
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
	ProductDAO productDao = new ProductDAO();
	ProductImageDAO imageDao = new ProductImageDAO();
	SizeProductDAO sizeDao = new SizeProductDAO();

	long id = Long.parseLong(request.getParameter("id").trim());
	String name = request.getParameter("name").trim();
	double price = Double.parseDouble(request.getParameter("price").trim());
	double salePrice = Double.parseDouble(request.getParameter("salePrice").trim());
	String description = request.getParameter("description").trim();
	long color = Long.parseLong(request.getParameter("color").trim());
	long category = Long.parseLong(request.getParameter("category").trim());
	String url = request.getParameter("mainImage").trim();

	try {
	    Product product = productDao.get(id);
	    product.setName(name);
	    product.setPrice(price);
	    product.setSalePrice(salePrice);
	    product.setDescription(description);
	    product.setColor(color);
	    product.setCategoryId(category);
	    product.setUrl(url);

	    imageDao.deleteByProductId(id);
	    sizeDao.deleteByProductId(id);

	    imageDao.add(new ProductImage(id, url, 1));
	    String[] sizeNames = request.getParameterValues("sizeName");
	    if (sizeNames == null) {
		sizeNames = new String[0];
	    }
	    String[] inventor = request.getParameterValues("inventory");
	    if (inventor == null) {
		inventor = new String[0];
	    }
	    for (int i = 0; i < sizeNames.length; i++) {
		sizeDao.add(new SizeProduct(Integer.parseInt(inventor[i]), sizeNames[i], id));
	    }
	    String[] subImages = request.getParameterValues("subImage");
	    if (subImages == null) {
		subImages = new String[0];
	    }
	    for (String subImage : subImages) {
		imageDao.add(new ProductImage(id, subImage, 2));
	    }

	    productDao.update(product);

	    productDao.closeConnection();
	    imageDao.closeConnection();
	    sizeDao.closeConnection();
	} catch (SQLException ex) {
	    response.sendRedirect("not-found");
	}
	request.getRequestDispatcher("debug.jsp").forward(request, response);
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
