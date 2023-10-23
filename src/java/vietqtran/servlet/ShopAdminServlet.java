package vietqtran.servlet;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import vietqtran.model.Shop;
import vietqtran.model.ShopReport;
import vietqtran.services.ShopDAO;
import vietqtran.services.ShopReportDAO;

/**
 *
 * @author tranq
 */
@WebServlet(urlPatterns = {"/shop"})
public class ShopAdminServlet extends HttpServlet {

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
	    out.println("<title>Servlet SearchShop</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet SearchShop at " + request.getContextPath() + "</h1>");
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
	ShopDAO shopDAO = new ShopDAO();
	String searchQuery = "SELECT * FROM shops WHERE 1=1";

	String id = request.getParameter("id") != null ? request.getParameter("id").trim() : "";
	String username = request.getParameter("name") != null ? request.getParameter("name").trim() : "";
	String email = request.getParameter("email") != null ? request.getParameter("email").trim() : "";
	String createDate = request.getParameter("date") != null ? request.getParameter("date").trim() : "";
	String isActive = request.getParameter("active") != null ? request.getParameter("active").trim() : "";

	if (!id.isEmpty()) {
	    searchQuery += " AND id = " + Long.parseLong(id);
	}
	if (!username.isEmpty()) {
	    searchQuery += " AND name like '%" + username + "%'";
	}
	if (!email.isEmpty()) {
	    searchQuery += " AND email like '%" + email + "%'";
	}
	if (!createDate.isEmpty()) {
	    searchQuery += " AND createDate = '" + createDate + "'";
	}
	if (!isActive.isEmpty()) {
	    searchQuery += " AND active = " + Integer.parseInt(isActive);
	}
	request.setAttribute("tab", "shops");
	try {
	    request.setAttribute("shops", shopDAO.getSearchShops(searchQuery));
	    shopDAO.closeConnection();
	} catch (SQLException ex) {
	    Logger.getLogger(ShopAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
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
	String name = request.getParameter("shopName").trim();
	String email = request.getParameter("email").trim();
	String password = request.getParameter("password").trim();
	String city = request.getParameter("city").trim();
	String district = request.getParameter("district").trim();
	String ward = request.getParameter("ward").trim();
	String detail = request.getParameter("detail").trim();
	String address = detail + ", " + ward + ", " + district + ", " + city + ".";
	String avatar = request.getParameter("avatar").trim();
	Shop shop = new Shop(email, password, name, address, true, avatar);
	ShopDAO shopDao = new ShopDAO();
	ShopReportDAO shopReportDao = new ShopReportDAO();
	try {
	    shopDao.add(shop);
	    ShopReport shopReport = new ShopReport(shopDao.getShopId(email), 0, 0, 0, 0, 0);
	    shopReportDao.add(shopReport);

	    shopDao.closeConnection();
	    shopReportDao.closeConnection();
	} catch (SQLException ex) {
	    Logger.getLogger(ShopAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
	}
	response.sendRedirect("admin?tab=shops");
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
