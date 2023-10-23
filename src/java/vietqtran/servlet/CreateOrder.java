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
import java.util.List;
import vietqtran.model.User;
import vietqtran.services.AddressDAO;
import vietqtran.services.CartProductDAO;
import vietqtran.services.ShipCompanyDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "CreateOrder", urlPatterns = {"/createOrder"})
public class CreateOrder extends HttpServlet {

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
	    out.println("<title>Servlet CreateOrder</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet CreateOrder at " + request.getContextPath() + "</h1>");
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
	User user = (User) session.getAttribute("user");
	if (user == null) {
	    response.sendRedirect("login");
	    return;
	}
	CartProductDAO cartProductDao = new CartProductDAO();
	AddressDAO addressDao = new AddressDAO();
	ShipCompanyDAO shipCompanyDao = new ShipCompanyDAO();

	String[] productIds = request.getParameterValues("productId");

	long[] longProductIds = new long[productIds.length];
	for (int i = 0; i < productIds.length; i++) {
	    longProductIds[i] = Long.parseLong(productIds[i]);
	}
	try {
	    request.setAttribute("address", addressDao.getAllByUserId(user.getId()));
	    request.setAttribute("data", cartProductDao.getCartProductToOrder(longProductIds));
	    request.setAttribute("shipCompanies", shipCompanyDao.getAll());
	    addressDao.closeConnection();
	    cartProductDao.closeConnection();
	    shipCompanyDao.closeConnection();
	} catch (SQLException | NullPointerException ex) {
	}
	request.getRequestDispatcher("prepareOrder.jsp").forward(request, response);
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
