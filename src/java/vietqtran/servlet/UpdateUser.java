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
import validate.Validate;
import vietqtran.model.User;
import vietqtran.services.UserDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "UpdateUser", urlPatterns = {"/updateUser"})
public class UpdateUser extends HttpServlet {

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
	    out.println("<title>Servlet UpdateUser</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet UpdateUser at " + request.getContextPath() + "</h1>");
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
	UserDAO userDao = new UserDAO();
	User userSession = (User) session.getAttribute("user");

	String name = request.getParameter("name") != null ? request.getParameter("name").trim() : "";
	String username = request.getParameter("username") != null ? request.getParameter("username").trim() : "";
	if (userDao.isUsernameExisted(username) && !username.equals(userSession.getUsername())) {
	    session.setAttribute("error", "Username was existed!!");
	    response.sendRedirect("admin?tab=profile");
	    return;
	} else {
	    session.removeAttribute("error");
	}
	String phone = request.getParameter("phone") != null ? request.getParameter("phone").trim() : "";
	if (!Validate.checkPhone(phone)) {
	    session.setAttribute("error", "Invalid Phone Number");
	    response.sendRedirect("admin?tab=profile");
	    return;
	} else {
	    session.removeAttribute("error");
	}
	String city = request.getParameter("city") != null ? request.getParameter("city").trim() : "";
	String district = request.getParameter("district") != null ? request.getParameter("district").trim() : "";
	String ward = request.getParameter("ward") != null ? request.getParameter("ward").trim() : "";
	String detail = request.getParameter("detail") != null ? request.getParameter("detail").trim() : "";
	String address = detail + ", " + ward + ", " + district + ", " + city + ".";
	userSession.setName(name);
	userSession.setUsername(username);
	userSession.setPhone(phone);
	if (city.equals("") && district.equals("") && ward.equals("") && detail.equals("")) {
	} else {
	    userSession.setAddress(address);
	}
	userDao.update(userSession);
	session.setAttribute("user", userDao.get(userSession.getId()));
	try {
	    userDao.closeConnection();
	} catch (SQLException ex) {
	    Logger.getLogger(UpdateUser.class.getName()).log(Level.SEVERE, null, ex);
	}
	session.removeAttribute("error");
	response.sendRedirect("admin?tab=profile");
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
