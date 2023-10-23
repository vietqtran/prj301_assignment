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
import vietqtran.services.ShopDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "ShopLogin", urlPatterns = {"/shopLogin"})
public class ShopLogin extends HttpServlet {

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
	    out.println("<title>Servlet ShopLogin</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ShopLogin at " + request.getContextPath() + "</h1>");
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
	request.getRequestDispatcher("shopLogin.jsp").forward(request, response);
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
	String password = request.getParameter("password").trim();
	ShopDAO shopDao = new ShopDAO();
	try {
	    if (shopDao.getShopId(email) == 0) {
		request.setAttribute("message", "Tài khoản không tồn tại, vui lòng Đăng Kí.");
		request.getRequestDispatcher("shopLogin.jsp").forward(request, response);
	    } else {
		Shop shop = shopDao.get(email, password);
		if (shop != null) {
		    HttpSession session = request.getSession();
		    session.setAttribute("shop", shop);
		    response.sendRedirect("shop-dashboard");
		} else {
		    request.setAttribute("message", "Sai mật khẩu!");
		    request.getRequestDispatcher("shopLogin.jsp").forward(request, response);
		}
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(ShopLogin.class.getName()).log(Level.SEVERE, null, ex);
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
