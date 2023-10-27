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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import vietqtran.model.Order;
import vietqtran.model.OrderProduct;
import vietqtran.model.Product;
import vietqtran.model.Shop;
import vietqtran.services.CategoryDAO;
import vietqtran.services.ColorDAO;
import vietqtran.services.OrderDAO;
import vietqtran.services.OrderProductDAO;
import vietqtran.services.ProductDAO;
import vietqtran.services.ShipCompanyDAO;
import vietqtran.services.ShopCategoryDAO;
import vietqtran.services.ShopDAO;
import vietqtran.services.ShopReportDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "ShopServlet", urlPatterns = {"/shop-dashboard"})
public class ShopServlet extends HttpServlet {

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
	    out.println("<title>Servlet ShopServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ShopServlet at " + request.getContextPath() + "</h1>");
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
	try {
	    String tab = (request.getParameter("tab") != null) ? request.getParameter("tab") : "dashboard";
	    HttpSession session = request.getSession();
	    Shop shop = (Shop) session.getAttribute("shop");
	    boolean check = false;
	    long shopId;
	    switch (tab) {
		case "dashboard":
		    Shop shopjs = (Shop) session.getAttribute("shop");
		    OrderDAO orderDaojs = new OrderDAO();
		    List<Double> datajs = new ArrayList<>();
		    for (int i = 0; i < 12; i++) {
			datajs.add(orderDaojs.getMonthRevenue(i, shopjs.getId()));
		    }

		    ShopReportDAO shopReportDAO = new ShopReportDAO();
		    shopId = shop.getId();
		    request.setAttribute("report", shopReportDAO.getByShopId(shopId));
		    request.setAttribute("revenueData", datajs);
		    shopReportDAO.closeConnection();
		    orderDaojs.closeConnection();
		    check = true;
		    break;
		case "products":
		    shopId = shop.getId();
		    ProductDAO productDao = new ProductDAO();
		    ColorDAO colorDao = new ColorDAO();
		    CategoryDAO categoryDao = new CategoryDAO();
		    ShopCategoryDAO shopCategoryDao = new ShopCategoryDAO();
		    request.setAttribute("products", productDao.getShopProducts(shopId));
		    request.setAttribute("colors", colorDao.getAll());
		    request.setAttribute("categories", categoryDao.getAll());
		    request.setAttribute("shopCategories", shopCategoryDao.getAll());
		    productDao.closeConnection();
		    colorDao.closeConnection();
		    categoryDao.closeConnection();
		    shopCategoryDao.closeConnection();
		    check = true;
		    break;
		case "profile":
		    check = true;
		    break;
		case "changePassword":
		    check = true;
		    break;
		case "orders":
		    OrderDAO orderDao = new OrderDAO();
		    ShipCompanyDAO shipDao = new ShipCompanyDAO();
		    request.setAttribute("ships", shipDao.getAll());
		    request.setAttribute("orders", orderDao.getAllByShop(shop.getId()));
		    shipDao.closeConnection();
		    orderDao.closeConnection();
		    check = true;
		    break;
		default:
		    break;
	    }
	    if (check) {
		request.setAttribute("tab", tab);
		request.getRequestDispatcher("shop.jsp").forward(request, response);
	    } else {
		request.getRequestDispatcher("not-found").forward(request, response);
	    }
	} catch (SQLException ex) {
	    response.sendRedirect("not-found");
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
	HttpSession session = request.getSession();
	switch (request.getParameter("tab")) {
	    case "profile":
		String name = request.getParameter("name").trim();
		String city = request.getParameter("city") != null ? request.getParameter("city").trim() : "";
		String district = request.getParameter("district") != null ? request.getParameter("district").trim() : "";
		String ward = request.getParameter("ward") != null ? request.getParameter("ward").trim() : "";
		String detail = request.getParameter("detail") != null ? request.getParameter("detail").trim() : "";
		if (city.isEmpty() || district.isEmpty() || ward.isEmpty() || detail.isEmpty()) {
		    session.setAttribute("error", "Please fill all field of address");
		} else {
		    session.removeAttribute("error");
		    Shop shop = (Shop) session.getAttribute("shop");
		    shop.setName(name);
		    shop.setAddress(detail + ", " + ward + ", " + district + ", " + city + ".");
		    ShopDAO shopDao = new ShopDAO();
		    try {
			shopDao.update(shop);
			shopDao.closeConnection();
		    } catch (SQLException ex) {
			Logger.getLogger(ShopServlet.class.getName()).log(Level.SEVERE, null, ex);
		    }
		}
		response.sendRedirect("shop-dashboard?tab=profile");
		break;
	    case "password":
		break;
	    default:
		response.sendRedirect("not-found");
		break;
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
