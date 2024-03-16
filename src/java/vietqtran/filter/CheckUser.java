/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package vietqtran.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vietqtran.model.Shop;
import vietqtran.model.User;

/**
 *
 * @author tranq
 */
@WebFilter(filterName = "CheckUser", urlPatterns = {"/not-found"})
public class CheckUser implements Filter {

    private static final boolean DEBUG = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured.
    private FilterConfig filterConfig = null;

    public CheckUser() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
	    throws IOException, ServletException {
	if (DEBUG) {
	    log("CheckUser:DoBeforeProcessing");
	}

	// Write code here to process the request and/or response before
	// the rest of the filter chain is invoked.
	// For example, a logging filter might log items on the request object,
	// such as the parameters.

    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
	    throws IOException, ServletException {
	if (DEBUG) {
	    log("CheckUser:DoAfterProcessing");
	}

	// Write code here to process the request and/or response after
	// the rest of the filter chain is invoked.
	// For example, a logging filter might log the attributes on the
	// request object after the request has been processed.
	// For example, a filter might append something to the response.
	/*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
	 */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
	    FilterChain chain)
	    throws IOException, ServletException {

	if (DEBUG) {
	    log("CheckUser:doFilter()");
	}

	doBeforeProcessing(request, response);

	HttpServletRequest req = (HttpServletRequest) request;
	HttpServletResponse res = (HttpServletResponse) response;
	HttpSession session = req.getSession();
	User user = (User) session.getAttribute("user");
	Shop shop = (Shop) session.getAttribute("shop");
	if (user == null) {
	    res.sendRedirect("login");
	} else {
	    if (user.getRole() == 1) {
		res.sendRedirect("admin");
	    }
	    if (user.getRole() == 5) {
		res.sendRedirect("home");
	    }
	}

	Throwable problem = null;
	try {
	    chain.doFilter(request, response);
	} catch (Throwable t) {
	    // If an exception is thrown somewhere down the filter chain,
	    // we still want to execute our after processing, and then
	    // rethrow the problem after that.
	    problem = t;
	    t.printStackTrace();
	}

	doAfterProcessing(request, response);

	// If there was a problem, we want to rethrow it if it is
	// a known type, otherwise log it.
	if (problem != null) {
	    if (problem instanceof ServletException) {
		throw (ServletException) problem;
	    }
	    if (problem instanceof IOException) {
		throw (IOException) problem;
	    }
	    sendProcessingError(problem, response);
	}
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
	return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
	this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
	this.filterConfig = filterConfig;
	if (filterConfig != null) {
	    if (DEBUG) {
		log("CheckUser:Initializing filter");
	    }
	}
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
	if (filterConfig == null) {
	    return ("CheckUser()");
	}
	StringBuffer sb = new StringBuffer("CheckUser(");
	sb.append(filterConfig);
	sb.append(")");
	return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
	String stackTrace = getStackTrace(t);

	if (stackTrace != null && !stackTrace.equals("")) {
	    try {
		response.setContentType("text/html");
		PrintStream ps = new PrintStream(response.getOutputStream());
		PrintWriter pw = new PrintWriter(ps);
		pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

		// PENDING! Localize this for next official release
		pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
		pw.print(stackTrace);
		pw.print("</pre></body>\n</html>"); //NOI18N
		pw.close();
		ps.close();
		response.getOutputStream().close();
	    } catch (Exception ex) {
return
	    }
	} else {
	    try {
		PrintStream ps = new PrintStream(response.getOutputStream());
		t.printStackTrace(ps);
		ps.close();
		response.getOutputStream().close();
	    } catch (Exception ex) {
return
	    }
	}
    }

    public static String getStackTrace(Throwable t) {
	String stackTrace = null;
	try {
	    StringWriter sw = new StringWriter();
	    PrintWriter pw = new PrintWriter(sw);
	    t.printStackTrace(pw);
	    pw.close();
	    sw.close();
	    stackTrace = sw.getBuffer().toString();
	} catch (Exception ex) {
	}
	return stackTrace;
    }

    public void log(String msg) {
	filterConfig.getServletContext().log(msg);
    }

}
