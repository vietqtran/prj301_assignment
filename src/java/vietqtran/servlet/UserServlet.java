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
import java.util.logging.Level;
import java.util.logging.Logger;
import vietqtran.model.User;
import vietqtran.services.UserDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
public class UserServlet extends HttpServlet {

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
	    out.println("<title>Servlet AddUser</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet AddUser at " + request.getContextPath() + "</h1>");
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
	UserDAO userDAO = new UserDAO();
	String searchQuery = "SELECT * FROM users WHERE 1=1";

	String id = request.getParameter("id") != null ? request.getParameter("id").trim() : "";
	String username = request.getParameter("username") != null ? request.getParameter("username").trim() : "";
	String email = request.getParameter("email") != null ? request.getParameter("email").trim() : "";
	String role = request.getParameter("role") != null ? request.getParameter("role").trim() : "";

	if (!id.isEmpty()) {
	    searchQuery += " AND id = " + Long.parseLong(id);
	}
	if (!username.isEmpty()) {
	    searchQuery += " AND username like '%" + username + "%'";
	}
	if (!email.isEmpty()) {
	    searchQuery += " AND email like '%" + email + "%'";
	}
	if (!role.isEmpty()) {
	    searchQuery += " AND role = " + Long.parseLong(role);
	}

	request.setAttribute("tab", "accounts");
	request.setAttribute("users", userDAO.getSearchUsers(searchQuery));

	try {
	    userDAO.closeConnection();
	} catch (SQLException ex) {
	    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
	}
	request.getRequestDispatcher("admin.jsp").forward(request, response);
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
	String email = request.getParameter("email").trim();
	String name = request.getParameter("name").trim();
	String username = request.getParameter("username") != null ? request.getParameter("username").trim() : email.split("@")[0];
	String password = request.getParameter("password").trim();
	String phone = request.getParameter("phone") != null ? request.getParameter("phone").trim() : "NULL";
	String avatar = request.getParameter("avatar") != null ? request.getParameter("avatar").trim() : "";
	int role = 4;
	try {
	    role = Integer.parseInt(request.getParameter("role").trim());
	} catch (NumberFormatException e) {
	    response.sendRedirect("not-found");
	}
	String city = !request.getParameter("city").equals("") ? request.getParameter("city") : "NULL City";
	String district = !request.getParameter("district").equals("") ? request.getParameter("district") : "NULL District";
	String ward = !request.getParameter("ward").equals("") ? request.getParameter("ward") : "NULL Ward";
	String detail = !request.getParameter("detail").equals("") ? request.getParameter("detail") : "NULL Detail";
	String address = detail + ", " + ward + ", " + district + ", " + city + ".";
	UserDAO userDao = new UserDAO();
	User user = new User(username, password, name, email, phone, role, avatar, address);
	userDao.add(user);
	try {
	    userDao.closeConnection();
	} catch (SQLException ex) {
	    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
	}
	response.sendRedirect("admin");
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
