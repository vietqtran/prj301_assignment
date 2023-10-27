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
import vietqtran.model.Order;
import vietqtran.model.OrderProduct;
import vietqtran.model.Product;
import vietqtran.model.SizeProduct;
import vietqtran.model.User;
import vietqtran.services.OrderDAO;
import vietqtran.services.OrderProductDAO;
import vietqtran.services.ProductDAO;
import vietqtran.services.SizeProductDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "OrderAction", urlPatterns = {"/orderAction"})
public class OrderAction extends HttpServlet {

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
	    out.println("<title>Servlet OrderAction</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet OrderAction at " + request.getContextPath() + "</h1>");
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
	String status = request.getParameter("status").trim();
	if (status.equals("canceled") || status.equals("delivered")) {
	    try {
		long id = Long.parseLong(request.getParameter("id"));
		OrderDAO orderDao = new OrderDAO();
		Order order = orderDao.get(id);
		order.setStatus(status);
		orderDao.update(order);
		if (status.equals("canceled")) {
		    OrderProductDAO orderProductDao = new OrderProductDAO();
		    ProductDAO productDao = new ProductDAO();
		    SizeProductDAO sizeDao = new SizeProductDAO();
		    List<OrderProduct> orderProducts = orderProductDao.getByOrderId(order.getId());
		    for (OrderProduct orderProduct : orderProducts) {
			Product product = productDao.get(orderProduct.getProductId());
			SizeProduct size = sizeDao.get(orderProduct.getSizeId());
			size.setInventory(size.getInventory() + orderProduct.getQuantity());
			sizeDao.update(size);
			product.setBoughtQuantity(product.getBoughtQuantity() - orderProduct.getQuantity());
			productDao.update(product);
		    }
		    orderProductDao.closeConnection();
		    productDao.closeConnection();
		    sizeDao.closeConnection();
		    response.sendRedirect("account?tab=orders&status=canceled");
		} else {
		    orderDao.setSuccessDate(id);
		    response.sendRedirect("account?tab=orders&status=delivered");
		}
	    } catch (SQLException | NumberFormatException ex) {
		response.sendRedirect("not-found");
	    }
	} else {
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
