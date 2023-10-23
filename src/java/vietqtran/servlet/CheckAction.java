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
import vietqtran.services.ProductDAO;
import vietqtran.services.ShopDAO;
import vietqtran.services.UserDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "CheckAction", urlPatterns = {"/check"})
public class CheckAction extends HttpServlet {

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
	    out.println("<title>Servlet CheckAction</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet CheckAction at " + request.getContextPath() + "</h1>");
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
	String action = (request.getParameter("action") != null) ? request.getParameter("action").trim() : "";
	switch (action) {
	    case "logout": {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		response.sendRedirect("home");
		break;
	    }
	    case "deleteUser": {
		long id = Long.parseLong(request.getParameter("id"));
		try {
		    UserDAO userDao = new UserDAO();
		    userDao.delete(id);
		    userDao.closeConnection();
		} catch (SQLException ex) {
		    Logger.getLogger(CheckAction.class.getName()).log(Level.SEVERE, null, ex);
		}
		response.sendRedirect("admin");
		break;
	    }
	    case "deleteShop": {
		long id = Long.parseLong(request.getParameter("id"));
		try {
		    ShopDAO shopDao = new ShopDAO();
		    shopDao.delete(id);
		    shopDao.closeConnection();
		} catch (SQLException ex) {
		    Logger.getLogger(CheckAction.class.getName()).log(Level.SEVERE, null, ex);
		}
		response.sendRedirect("admin?tab=shops");
		break;
	    }
	    case "disableShop": {
		long id = Long.parseLong(request.getParameter("id"));
		try {
		    ShopDAO shopDao = new ShopDAO();
		    shopDao.disbleShop(id);
		    shopDao.closeConnection();
		} catch (SQLException ex) {
		    Logger.getLogger(CheckAction.class.getName()).log(Level.SEVERE, null, ex);
		}
		response.sendRedirect("admin?tab=shops");
		break;
	    }
	    case "enableShop": {
		long id = Long.parseLong(request.getParameter("id"));
		try {
		    ShopDAO shopDao = new ShopDAO();
		    shopDao.enableShop(id);
		    shopDao.closeConnection();
		} catch (SQLException ex) {
		    Logger.getLogger(CheckAction.class.getName()).log(Level.SEVERE, null, ex);
		}
		response.sendRedirect("admin?tab=shops");
		break;
	    }
	    case "logoutShop": {
		HttpSession session = request.getSession();
		session.removeAttribute("shop");
		response.sendRedirect("shopLogin");
		break;
	    }
	    case "deleteProduct": {
		long id = Long.parseLong(request.getParameter("id").trim());
		ProductDAO dao = new ProductDAO();
		try {
		    dao.delete(id);
		    dao.closeConnection();
		} catch (SQLException ex) {
		    Logger.getLogger(CheckAction.class.getName()).log(Level.SEVERE, null, ex);
		}
		response.sendRedirect("shop-dashboard?tab=products");
		break;
	    }
	    default:
		response.sendRedirect("not-found");
		break;
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
