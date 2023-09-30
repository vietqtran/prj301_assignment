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
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
	    out.println("<title>Servlet Login</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
	request.getRequestDispatcher("login.jsp").forward(request, response);
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
	String remember = request.getParameter("remember");
	String msg = "";
	if (!dao.isExisted(email)) {
	    msg = "Couldn't find your Mooru account!";
	    request.setAttribute("message", msg);
	    request.setAttribute("email", email);
	    request.setAttribute("password", password);
	    request.getRequestDispatcher("login.jsp").forward(request, response);
	} else {
	    User user = dao.getLoginUser(email, password);
	    if (user != null) {
		HttpSession session = request.getSession();
		Cookie emailCookie = new Cookie("email", email);
		Cookie passwordCookie = new Cookie("password", password);
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
		if (user.getRole() == 1) {
		    response.sendRedirect("admin");
		} else {
		    response.sendRedirect("home");
		}
	    } else {
		msg = "Sorry, your password is incorrect!";
		request.setAttribute("message", msg);
		request.setAttribute("email", email);
		request.setAttribute("password", password);
		request.getRequestDispatcher("login.jsp").forward(request, response);
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
