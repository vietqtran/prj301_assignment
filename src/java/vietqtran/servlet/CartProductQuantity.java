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
import vietqtran.model.CartProduct;
import vietqtran.model.SizeProduct;
import vietqtran.services.CartProductDAO;
import vietqtran.services.SizeProductDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "CartProductQuantity", urlPatterns = {"/cartProductQuantity"})
public class CartProductQuantity extends HttpServlet {

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
	    out.println("<title>Servlet CartProductQuantity</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet CartProductQuantity at " + request.getContextPath() + "</h1>");
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
	String action = request.getParameter("action") != null ? request.getParameter("action").trim() : "";
	if (id.isEmpty() || action.isEmpty()) {
	    response.sendRedirect("not-found");
	    return;
	}
	CartProductDAO cartProductDao = new CartProductDAO();
	try {
	    CartProduct cp = cartProductDao.get(Long.parseLong(id));
	    switch (action) {
		case "increase":
		    SizeProductDAO sizeDao = new SizeProductDAO();
		    SizeProduct size = sizeDao.get(cp.getSizeId());
		    if (cp.getQuantity() < size.getInventory()) {
			cp.setQuantity(cp.getQuantity() + 1);
		    }
		    sizeDao.closeConnection();
		    break;
		case "decrease":
		    if (cp.getQuantity() > 1) {
			cp.setQuantity(cp.getQuantity() - 1);
		    }
		    break;
		default:
		    throw new SQLException();
	    }
	    cartProductDao.update(cp);
	    response.sendRedirect("cart");
	} catch (SQLException | NumberFormatException ex) {
	    response.sendRedirect("not-found");
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
