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
import vietqtran.services.CategoryDAO;
import vietqtran.services.ColorDAO;
import vietqtran.services.ProductDAO;
import vietqtran.services.ShopDAO;
import vietqtran.services.UserDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {

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
	    out.println("<title>Servlet AdminServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet AdminServlet at " + request.getContextPath() + "</h1>");
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
	String tab = (request.getParameter("tab") != null) ? request.getParameter("tab") : "accounts";
	boolean check = false;
	try {
	    switch (tab) {
		case "accounts":
		    UserDAO userDao = new UserDAO();
		    request.setAttribute("users", userDao.getAll());
		    check = true;
		    userDao.closeConnection();
		    break;
		case "shops":
		    ShopDAO shopDao = new ShopDAO();
		    request.setAttribute("shops", shopDao.getAll());
		    check = true;
		    shopDao.closeConnection();
		    break;
		case "products":
		    ProductDAO productDao = new ProductDAO();
		    ColorDAO colorDao = new ColorDAO();
		    CategoryDAO categoryDao = new CategoryDAO();
		    ShopDAO shopDao2 = new ShopDAO();
		    request.setAttribute("products", productDao.getAll());
		    request.setAttribute("colors", colorDao.getAll());
		    request.setAttribute("categories", categoryDao.getAll());
		    request.setAttribute("shops", shopDao2.getAll());
		    check = true;
		    productDao.closeConnection();
		    colorDao.closeConnection();
		    categoryDao.closeConnection();
		    shopDao2.closeConnection();
		    break;
            case "profile":
                check = true;
                break;
            case "changePassword":
                check = true;
                break;
		default:
		    break;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
	}
	if (check) {
	    request.setAttribute("tab", tab);
	    request.getRequestDispatcher("admin.jsp").forward(request, response);
	} else {
	    request.getRequestDispatcher("not-found").forward(request, response);
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
