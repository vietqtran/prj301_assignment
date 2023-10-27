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
import java.util.logging.Level;
import java.util.logging.Logger;
import vietqtran.model.Order;
import vietqtran.model.User;
import vietqtran.services.CategoryDAO;
import vietqtran.services.OrderDAO;
import vietqtran.services.UserDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "Account", urlPatterns = {"/account"})
public class Account extends HttpServlet {

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
	    out.println("<title>Servlet Account</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet Account at " + request.getContextPath() + "</h1>");
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
	CategoryDAO categoryDao = new CategoryDAO();
	String tab = request.getParameter("tab") != null ? request.getParameter("tab").trim() : "account";
	try {
	    request.setAttribute("categories", categoryDao.getAll());
	    categoryDao.closeConnection();
	} catch (SQLException e) {
	}

	if (tab.equals("orders")) {
	    try {
		List<Order> orders;
		OrderDAO orderDao = new OrderDAO();
		String status = request.getParameter("status") != null ? request.getParameter("status") : "all";
		switch (status) {
		    case "all":
			orders = orderDao.getAll();
			break;
		    case "waitForConfirmation":
		    case "waitingForDelivery":
		    case "delivering":
		    case "delivered":
		    case "canceled":
			orders = orderDao.getAllByStatus(status, user.getId());
			break;
		    default:
			response.sendRedirect("not-found");
			return;
		}
		request.setAttribute("orders", orders);

	    } catch (SQLException ex) {
		Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}

	request.setAttribute("tab", tab);
	request.getRequestDispatcher("account.jsp").forward(request, response);
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
	User user = (User) session.getAttribute("user");
	String oldPassword = request.getParameter("password").trim();

	if (!oldPassword.equals(user.getPassword())) {
	    session.setAttribute("error", "Old Password not match!");
	    response.sendRedirect("account?tab=password");
	    return;
	} else {
	    session.removeAttribute("error");
	}

	String newPassword = request.getParameter("new_password").trim();
	if (newPassword.length() < 8) {
	    session.setAttribute("error", "Password length must be greater than 8 characters!");
	    response.sendRedirect("account?tab=password");
	    return;
	} else {
	    session.removeAttribute("error");
	}

	if (newPassword.equals(oldPassword)) {
	    session.setAttribute("error", "New Password must be different with Old Password!");
	    response.sendRedirect("account?tab=password");
	    return;
	} else {
	    session.removeAttribute("error");
	}

	String confirmPassword = request.getParameter("confirm_password").trim();
	if (!newPassword.equals(confirmPassword)) {
	    session.setAttribute("error", "Confirm Password not match!");
	    response.sendRedirect("account?tab=password");
	    return;
	} else {
	    session.removeAttribute("error");
	}

	user.setPassword(newPassword);
	UserDAO userDao = new UserDAO();
	userDao.update(user);
	session.setAttribute("user", userDao.get(user.getId()));
	try {
	    userDao.closeConnection();
	} catch (SQLException ex) {
	    Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
	}
	response.sendRedirect("account?tab=password");
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
