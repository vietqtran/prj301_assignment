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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import vietqtran.model.Product;
import vietqtran.services.CategoryDAO;
import vietqtran.services.ColorDAO;
import vietqtran.services.ProductDAO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "ProductsServlet", urlPatterns = {"/products"})
public class ProductsServlet extends HttpServlet {

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
	    out.println("<title>Servlet ProductsServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ProductsServlet at " + request.getContextPath() + "</h1>");
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
	//Call DAO
	CategoryDAO categoryDao = new CategoryDAO();
	ColorDAO colorDao = new ColorDAO();
	ProductDAO productDao = new ProductDAO();
	try {
	    //Init
	    String filterQuery = "WITH i AS (\n"
		    + "  SELECT p.*\n"
		    + "  FROM products AS p \n"
		    + "  INNER JOIN shops AS s ON p.shopId = s.id\n"
		    + "  LEFT JOIN sizesProduct AS sp ON p.id = sp.productId\n"
		    + "  WHERE s.active = 1 AND sp.inventory > 0\n";

	    //Logic
	    String name = request.getParameter("name") != null ? request.getParameter("name") : "";
	    String categoryID = request.getParameter("cid") != null ? request.getParameter("cid").trim() : "";
	    String colorId = request.getParameter("clid") != null ? request.getParameter("clid").trim() : "";
	    String min = request.getParameter("min") != null ? request.getParameter("min").trim() : "";
	    String max = request.getParameter("max") != null ? request.getParameter("max").trim() : "";
	    String star = request.getParameter("star") != null ? request.getParameter("star").trim() : "";
	    if (!categoryID.isEmpty()) {
		filterQuery += " AND p.categoryId = " + Long.parseLong(categoryID);
		request.setAttribute("cid", categoryID);
	    }
	    if (!colorId.isEmpty()) {
		filterQuery += " AND p.color = " + Long.parseLong(colorId);
		request.setAttribute("clid", colorId);
	    }
	    if (!min.isEmpty()) {
		filterQuery += " AND p.price >= " + Double.parseDouble(min);
		request.setAttribute("min", min);
	    }
	    if (!max.isEmpty()) {
		filterQuery += " AND p.price <= " + Double.parseDouble(max);
		request.setAttribute("max", max);
	    }
	    if (!star.isEmpty()) {
		filterQuery += " AND p.rate >= " + Double.parseDouble(star);
		request.setAttribute("rate", star);
	    }
	    if (!name.isEmpty()) {
		filterQuery += " AND p.name like N'%" + name + "%'";
		request.setAttribute("search", name);
	    }

	    filterQuery += ")\n"
		    + "\n"
		    + "SELECT DISTINCT *\n"
		    + "FROM i";

	    int itemsPerPage = 60;
	    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
	    int startIndex = (currentPage - 1) * itemsPerPage;
	    List<Product> filterProducts = productDao.getAll(filterQuery);
	    String sort = request.getParameter("sortby") != null ? request.getParameter("sortby") : "";
	    if (!sort.isEmpty()) {
		if (sort.equals("rate")) {
		    Collections.sort(filterProducts, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
			    return Double.compare(p2.getRate(), p1.getRate());
			}
		    });
		}
		if (sort.equals("newest")) {
		    Collections.sort(filterProducts, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
			    return Long.compare(p2.getId(), p1.getId());
			}
		    });
		}
		if (sort.equals("sellWell")) {
		    Collections.sort(filterProducts, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
			    return Integer.compare(p2.getBoughtQuantity(), p1.getBoughtQuantity());
			}
		    });
		}
		if (sort.equals("descPrice")) {
		    Collections.sort(filterProducts, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
			    return Double.compare(p2.getPrice(), p1.getPrice());
			}
		    });
		}
		if (sort.equals("ascPrice")) {
		    Collections.sort(filterProducts, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
			    return Double.compare(p1.getPrice(), p2.getPrice());
			}
		    });
		}
		request.setAttribute("sortby", sort);
	    }
	    int endIndex = Math.min(startIndex + itemsPerPage, filterProducts.size());

	    //Set Attribute
	    request.setAttribute("categories", categoryDao.getAll());
	    request.setAttribute("colors", colorDao.getAll());
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("productsSize", filterProducts.size());
	    request.setAttribute("products", filterProducts);

	    //Close Connection
	    categoryDao.closeConnection();
	    colorDao.closeConnection();
	    productDao.closeConnection();

	    //Redirect
	    request.getRequestDispatcher("products.jsp").forward(request, response);
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
