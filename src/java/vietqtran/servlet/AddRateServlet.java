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
import vietqtran.model.OrderProduct;
import vietqtran.model.Rate;
import vietqtran.model.User;
import vietqtran.services.OrderProductDAO;
import vietqtran.services.RateDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "AddRateServlet", urlPatterns = {"/addRate"})
public class AddRateServlet extends HttpServlet {

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
	    out.println("<title>Servlet AddRateServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet AddRateServlet at " + request.getContextPath() + "</h1>");
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
	    int star = Integer.parseInt(request.getParameter("star").trim());
	    long orderId = Long.parseLong(request.getParameter("productId").trim());
	    String content = request.getParameter("content");
	    RateDAO rateDao = new RateDAO();
	    OrderProductDAO orderProductDao = new OrderProductDAO();
	    List<OrderProduct> orderProducts = orderProductDao.getByOrderId(orderId);
	    for (OrderProduct orderProduct : orderProducts) {
		Rate rate = new Rate(user.getId(), orderProduct.getProductId(), star, content);
		rateDao.add(rate);
	    }
	    orderProductDao.closeConnection();
	    rateDao.closeConnection();
	    response.sendRedirect("account?tab=orders&status=delivered");
	} catch (SQLException ex) {
	    response.sendRedirect("not-found");
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
