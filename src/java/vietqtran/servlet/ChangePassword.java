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
import vietqtran.model.User;
import vietqtran.services.ShopDAO;
import vietqtran.services.UserDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/password"})
public class ChangePassword extends HttpServlet {

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
	    out.println("<title>Servlet ChangePassword</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
	HttpSession session = request.getSession();
	if (session.getAttribute("user") != null) {
	    User user = (User) session.getAttribute("user");
	    String oldPassword = request.getParameter("password").trim();
	    if (!oldPassword.equals(user.getPassword())) {
		session.setAttribute("error", "Old Password not match!");
		response.sendRedirect("admin?tab=changePassword");
		return;
	    } else {
		session.removeAttribute("error");
	    }
	    String newPassword = request.getParameter("new_password").trim();
	    if (newPassword.length() < 8) {
		session.setAttribute("error", "Password length must be greater than 8 characters!");
		response.sendRedirect("admin?tab=changePassword");
		return;
	    } else {
		session.removeAttribute("error");
	    }
	    if (newPassword.equals(oldPassword)) {
		session.setAttribute("error", "New Password must be different with Old Password!");
		response.sendRedirect("admin?tab=changePassword");
		return;
	    } else {
		session.removeAttribute("error");
	    }
	    String confirmPassword = request.getParameter("confirm_password").trim();
	    if (!newPassword.equals(confirmPassword)) {
		session.setAttribute("error", "Confirm Password not match!");
		response.sendRedirect("admin?tab=changePassword");
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
	    response.sendRedirect("admin?tab=changePassword");
	} else if (session.getAttribute("shop") != null) {
	    Shop shop = (Shop) session.getAttribute("shop");
	    ShopDAO shopDao = new ShopDAO();
	    String oldPassword = request.getParameter("password").trim();
	    if (!oldPassword.equals(shop.getPassword())) {
		session.setAttribute("error", "Old Password not match!");
		response.sendRedirect("shop-dashboard?tab=changePassword");
		return;
	    } else {
		session.removeAttribute("error");
	    }
	    String newPassword = request.getParameter("new_password").trim();
	    if (newPassword.length() < 8) {
		session.setAttribute("error", "Password length must be greater than 8 characters!");
		response.sendRedirect("shop-dashboard?tab=changePassword");
		return;
	    } else {
		session.removeAttribute("error");
	    }
	    if (newPassword.equals(oldPassword)) {
		session.setAttribute("error", "New Password must be different with Old Password!");
		response.sendRedirect("shop-dashboard?tab=changePassword");
		return;
	    } else {
		session.removeAttribute("error");
	    }
	    String confirmPassword = request.getParameter("confirm_password").trim();
	    if (!newPassword.equals(confirmPassword)) {
		session.setAttribute("error", "Confirm Password not match!");
		response.sendRedirect("shop-dashboard?tab=changePassword");
		return;
	    } else {
		session.removeAttribute("error");
	    }
	    shop.setPassword(newPassword);
	    session.setAttribute("shop", shop);
	    try {
		shopDao.update(shop);
		shopDao.closeConnection();
	    } catch (SQLException ex) {
		Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
	    }
	    response.sendRedirect("shop-dashboard?tab=changePassword");
	} else {
	    session.removeAttribute("error");
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
