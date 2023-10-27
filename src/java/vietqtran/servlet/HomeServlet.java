package vietqtran.servlet;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import vietqtran.model.Product;
import vietqtran.services.ProductDAO;

/**
 *
 * @author ADMIN
 */
@WebServlet(urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
	ProductDAO productDao = new ProductDAO();
	String sort = request.getParameter("sort") != null ? request.getParameter("sort") : "";
	try {
	    List<Product> products = productDao.getAll();
	    if (!sort.isEmpty()) {
		if (sort.equals("rate")) {
		    Collections.sort(products, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
			    return Double.compare(p2.getRate(), p1.getRate());
			}
		    });
		}
		if (sort.equals("newest")) {
		    Collections.sort(products, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
			    return Long.compare(p2.getId(), p1.getId());
			}
		    });
		}
		if (sort.equals("sellWell")) {
		    Collections.sort(products, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
			    return Integer.compare(p2.getBoughtQuantity(), p1.getBoughtQuantity());
			}
		    });
		}
		if (sort.equals("descPrice")) {
		    Collections.sort(products, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
			    return Double.compare(p2.getPrice(), p1.getPrice());
			}
		    });
		}
		if (sort.equals("ascPrice")) {
		    Collections.sort(products, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
			    return Double.compare(p1.getPrice(), p2.getPrice());
			}
		    });
		}
	    }
	    request.setAttribute("products", products);
	    productDao.closeConnection();
	    request.getRequestDispatcher("home.jsp").forward(request, response);
	} catch (SQLException ex) {
	    Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
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
