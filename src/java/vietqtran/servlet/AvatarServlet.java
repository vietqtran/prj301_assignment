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
@WebServlet(name = "AvatarServlet", urlPatterns = {"/avatar"})
public class AvatarServlet extends HttpServlet {

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
	    out.println("<title>Servlet AvatarServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet AvatarServlet at " + request.getContextPath() + "</h1>");
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
	String avatar = request.getParameter("avatarUrl").trim();
	if (session.getAttribute("user") != null) {
	    User user = (User) session.getAttribute("user");
	    user.setAvatar(avatar);
	    UserDAO userDao = new UserDAO();
	    userDao.update(user);
	    session.setAttribute("user", user);
	    try {
		userDao.closeConnection();
	    } catch (SQLException ex) {
		Logger.getLogger(AvatarServlet.class.getName()).log(Level.SEVERE, null, ex);
	    }
	    session.setAttribute("url", avatar);
	    response.sendRedirect("admin?tab=profile");
	}
	if (session.getAttribute("shop") != null) {
	    Shop shop = (Shop) session.getAttribute("shop");
	    shop.setAvatar(avatar);
	    ShopDAO shopDao = new ShopDAO();
	    try {
		shopDao.update(shop);
		shopDao.closeConnection();
	    } catch (SQLException ex) {
		Logger.getLogger(AvatarServlet.class.getName()).log(Level.SEVERE, null, ex);
	    }
	    response.sendRedirect("shop-dashboard?tab=profile");
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
