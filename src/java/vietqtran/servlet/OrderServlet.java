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
import vietqtran.model.Address;
import vietqtran.model.CartProduct;
import vietqtran.model.Order;
import vietqtran.model.OrderProduct;
import vietqtran.model.Product;
import vietqtran.model.SizeProduct;
import vietqtran.model.User;
import vietqtran.services.AddressDAO;
import vietqtran.services.CartProductDAO;
import vietqtran.services.OrderDAO;
import vietqtran.services.OrderProductDAO;
import vietqtran.services.ProductDAO;
import vietqtran.services.SizeProductDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "Order", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

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
	    out.println("<title>Servlet Order</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet Order at " + request.getContextPath() + "</h1>");
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
	try {
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");
	    if (user == null) {
		response.sendRedirect("login");
		return;
	    }

	    OrderProductDAO orderProductDao = new OrderProductDAO();
	    AddressDAO addressDao = new AddressDAO();
	    OrderDAO orderDao = new OrderDAO();
	    CartProductDAO cartProductDao = new CartProductDAO();
	    ProductDAO productDao = new ProductDAO();
	    SizeProductDAO sizeProductDao = new SizeProductDAO();

	    int shopQuantity;
	    long addressId;
	    try {
		shopQuantity = Integer.parseInt(request.getParameter("shopQuantity").trim());
	    } catch (NumberFormatException e) {
		shopQuantity = -1;
	    }

	    try {
		addressId = Long.parseLong(request.getParameter("addressId").trim());
	    } catch (NumberFormatException e) {
		addressId = -1;
	    }

	    Address address = addressDao.get(addressId);
	    String a = address.getDetail() + ", " + address.getTown() + ", " + address.getDistrict() + ", " + address.getCity();

	    for (int i = 1; i <= shopQuantity; i++) {
		long shopId = request.getParameter("shopId" + i) != null ? Long.parseLong(request.getParameter("shopId" + i).trim()) : -1;
		String note = request.getParameter("note" + i) != null ? request.getParameter("note" + i).trim() : "";
		long shipCompanyId = request.getParameter("shipCompanyId" + i) != null ? Long.parseLong(request.getParameter("shipCompanyId" + i).trim()) : -1;
		double totalPrice = request.getParameter("totalPrice" + i) != null ? Double.parseDouble(request.getParameter("totalPrice" + i).trim()) : -1;
		String[] productIds = request.getParameterValues("productId" + i);
		if (shopId == -1 || shipCompanyId == -1 || addressId == -1 || totalPrice == -1) {
		    response.sendRedirect("not-found");
		    return;
		}
		Order order = new Order(user.getId(), shopId, shipCompanyId, totalPrice, 0, null, address.getPhone(), a, 0, note, "");
		long orderId = orderDao.addToGetIndex(order);
		for (String productId : productIds) {
		    long pid = Long.parseLong(productId);
		    CartProduct cartProduct = cartProductDao.get(pid);
		    Product product = productDao.get(cartProduct.getProductId());
		    if (cartProduct.getSizeId() != -1) {
			SizeProduct size = sizeProductDao.get(cartProduct.getSizeId());
			size.setInventory(size.getInventory() - cartProduct.getQuantity());
			sizeProductDao.update(size);
		    }
		    cartProductDao.delete(pid);
		    double price = product.getSalePrice() > 0 ? product.getSalePrice() : product.getPrice();
		    OrderProduct orderProduct = new OrderProduct(orderId, product.getId(), product.getPrice(), cartProduct.getQuantity(), cartProduct.getQuantity() * price, product.getSalePrice(), product.getUrl(), cartProduct.getSizeId());
		    orderProductDao.add(orderProduct);
		}
	    }
	    orderProductDao.closeConnection();
	    addressDao.closeConnection();
	    orderDao.closeConnection();
	    cartProductDao.closeConnection();
	    productDao.closeConnection();
	    sizeProductDao.closeConnection();
	    response.sendRedirect("account?tab=orders&status=waitForConfirmation");
	} catch (SQLException | NumberFormatException ex) {
	    response.sendRedirect("not-found");
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
