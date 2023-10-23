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
@WebServlet(name = "ShopRegister", urlPatterns = {"/shopRegister"})
public class ShopRegister extends HttpServlet {

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
	    out.println("<title>Servlet ShopRegister</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ShopRegister at " + request.getContextPath() + "</h1>");
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
	request.getRequestDispatcher("shopRegister.jsp").forward(request, response);
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
	String pasword = request.getParameter("password").trim();
	String confirm = request.getParameter("confirm_password").trim();
	String shopName = request.getParameter("shop_name").trim();
	String city = request.getParameter("city").trim();
	String district = request.getParameter("district").trim();
	String ward = request.getParameter("ward").trim();
	String detail = request.getParameter("detail").trim();
	String address = detail + ", " + ward + ", " + district + ", " + city + ".";
	String avatar = request.getParameter("avatar").trim();
	ShopDAO shopDao = new ShopDAO();

	boolean check = false;
	try {
	    if (shopDao.getShopId(email) != 0) {
		request.setAttribute("loginMessage", "This email already exist!");
	    } else {
		request.removeAttribute("loginMessage");
		if (!pasword.equals(confirm)) {
		    request.setAttribute("loginMessage", "Confirm password not match!");
		} else {
		    request.removeAttribute("loginMessage");
		    if (shopDao.checkShopName(shopName)) {
			request.setAttribute("inforMessage", "This shop name already exist!");
		    } else {
			request.removeAttribute("inforMessage");
			Shop shop = new Shop(email, pasword, shopName, address, true, avatar);
			shopDao.add(shop);
			HttpSession session = request.getSession();
			session.setAttribute("shop", shop);
			check = true;
		    }
		}
	    }
	    shopDao.closeConnection();
	} catch (SQLException ex) {
	    Logger.getLogger(ShopRegister.class.getName()).log(Level.SEVERE, null, ex);
	}
	if (check) {
	    response.sendRedirect("shop-dashboard");
	} else {
	    request.setAttribute("email", email);
	    request.setAttribute("pasword", pasword);
	    request.setAttribute("shopName", shopName);
	    request.getRequestDispatcher("shopRegister.jsp").forward(request, response);
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
