/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vietqtran.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vietqtran.model.User;
import vietqtran.services.UserDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

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
	    out.println("<title>Servlet RegisterServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
	request.getRequestDispatcher("register.jsp").forward(request, response);
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
	UserDAO dao = new UserDAO();

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String confirm = request.getParameter("confirm_password");
	String remember = request.getParameter("remember");
	String msg = "";

	if (dao.isExisted(email)) {
	    msg = "Email already exists!";
	    request.setAttribute("message", msg);
	    request.setAttribute("email", email);
	    request.setAttribute("password", password);
	    request.getRequestDispatcher("register.jsp").forward(request, response);
	} else {
	    if (!(password.length() >= 8)) {
		msg = "Password lenght must be greater than 8 characters!";
		request.setAttribute("message", msg);
		request.setAttribute("email", email);
		request.setAttribute("password", password);
		request.getRequestDispatcher("register.jsp").forward(request, response);
	    } else {
		if (!password.equals(confirm)) {
		    msg = "Password and confirm password must match!";
		    request.setAttribute("message", msg);
		    request.setAttribute("email", email);
		    request.setAttribute("password", password);
		    request.getRequestDispatcher("register.jsp").forward(request, response);
		} else {
		    HttpSession session = request.getSession();
		    Cookie emailCookie = new Cookie("email", email);
		    Cookie passwordCookie = new Cookie("password", password);
		    String username = email.split("@")[0];
		    User user = new User(username, password, "", email, "", 5, "", "");
		    long userId = dao.addToGetIndex(user);
		    if (remember != null) {
			emailCookie.setMaxAge(60 * 60 * 24);
			passwordCookie.setMaxAge(60 * 60 * 24);
			response.addCookie(emailCookie);
			response.addCookie(passwordCookie);
		    } else {
			emailCookie.setMaxAge(0);
			passwordCookie.setMaxAge(0);
			response.addCookie(emailCookie);
			response.addCookie(passwordCookie);
		    }
		    session.setAttribute("user", user);
		    response.sendRedirect("home");
		}
	    }
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
