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
import vietqtran.model.Shop;
import vietqtran.services.OrderDAO;
import vietqtran.services.ShipCompanyDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "SeachOrderServlet", urlPatterns = {"/search-order"})
public class SeachOrderServlet extends HttpServlet {

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
	    out.println("<title>Servlet SeachOrderServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet SeachOrderServlet at " + request.getContextPath() + "</h1>");
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
	try {
	    HttpSession session = request.getSession();
	    Shop shop = (Shop) session.getAttribute("shop");
	    if (shop == null) {
		response.sendRedirect("shopLogin");
		return;
	    }
	    String filterQuery = "SELECT * FROM orders WHERE shopId = " + shop.getId();
	    String id = request.getParameter("id") != null ? request.getParameter("id").trim() : "";
	    String min = request.getParameter("min") != null ? request.getParameter("min").trim() : "";
	    String max = request.getParameter("max") != null ? request.getParameter("max").trim() : "";
	    String date = request.getParameter("date") != null ? request.getParameter("date").trim() : "";
	    String status = request.getParameter("status") != null ? request.getParameter("status").trim() : "";
	    String ship = request.getParameter("ship") != null ? request.getParameter("ship").trim() : "";

	    if (!id.isEmpty()) {
		filterQuery += " AND id = " + Long.parseLong(id);
		request.setAttribute("id", id);
	    }
	    if (!min.isEmpty()) {
		filterQuery += " AND totalPrice >= " + Double.parseDouble(min);
		request.setAttribute("min", min);
	    }
	    if (!max.isEmpty()) {
		filterQuery += " AND totalPrice <= " + Double.parseDouble(max);
		request.setAttribute("max", max);
	    }
	    if (!date.isEmpty()) {
		filterQuery += " AND orderDate >= '" + date + "'";
		request.setAttribute("date", date);
	    }
	    if (!status.isEmpty()) {
		filterQuery += " AND status = '" + status + "'";
		request.setAttribute("status", status);
	    }
	    if (!ship.isEmpty()) {
		filterQuery += " AND shipperId = " + Long.parseLong(ship);
		request.setAttribute("ship", ship);
	    }
	    filterQuery += " order by id desc";
	    OrderDAO orderDao = new OrderDAO();
	    request.setAttribute("orders", orderDao.getAllByQuery(filterQuery));
	    orderDao.closeConnection();
	    ShipCompanyDAO shipDao = new ShipCompanyDAO();
	    request.setAttribute("ships", shipDao.getAll());
	    request.setAttribute("tab", "orders");
	    request.getRequestDispatcher("shop.jsp").forward(request, response);
	} catch (SQLException ex) {
	    Logger.getLogger(SeachOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
