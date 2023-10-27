<%-- 
    Document   : header
    Created on : Sep 26, 2023, 7:56:13 PM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="vietqtran.services.CategoryDAO" %>
<%@page import="vietqtran.model.Category" %>
<%@page import="java.sql.SQLException" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="vietqtran.services.CartProductDAO" %>
<%@page import="vietqtran.services.ProductDAO" %>
<%@page import="vietqtran.model.User" %>
<%@page import="vietqtran.model.Product" %>
<%@page import="vietqtran.model.CartProduct" %>
<%@page import="java.text.DecimalFormat" %>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

        <div class="w-full bg-[#0261d6]">
            <div class="container mx-auto max-w-[1250px] pt-2 px-2 pr-5 md:pr-2 text-white">
                <div class="container mx-auto">
                    <div class="flex justify-between gap-x-6 text-sm">
                        <div class="flex items-center gap-x-3">
                            <a class="capitalize hover:text-white/70" href="shop-dashboard">Kênh Người Bán</a>
                            <div class="h-4 border-r-[1px] border-r-white/40"></div>
			    <div class="flex items-center">
				Kết nối
				<a class="capitalize hover:text-white/70 px-1 pl-3" href="https://www.facebook.com/khong.phai.quoc.viet/">
				    <img class="w-[16px] h-[16px]" src="./static/icons/facebook.png" alt="alt"/>
				</a>
				<a class="capitalize hover:text-white/70 px-1" href="https://www.instagram.com/vietq.tran/">
				    <img class="w-[16px] h-[16px]" src="./static/icons/instagram.png" alt="alt"/>
				</a>
			    </div>
                        </div>
			<c:if test="${sessionScope.user!=null}">
			    <div class="flex group items-center justify-between cursor-pointer relative">
				<c:if test="${!sessionScope.user.name.equals('')}">
				    <span class="mr-2">${sessionScope.user.name}</span>
				    <c:if test="${sessionScope.user.avatar.equals('')}">
					<div class="rounded-full overflow-hidden bg-white relative p-10 border-[1px] border-blue-500 mb-5">
					    <div class="absolute font-medium text-[#0261d6] text-2xl top-[50%] left-[50%] translate-x-[-50%] translate-y-[-50%] w-[25px] h-[25px]">${sessionScope.user.name.toUpperCase().charAt(0)}</div>
					</div>
				    </c:if>
				    <c:if test="${!sessionScope.user.avatar.equals('')}">
					    <div class="bg-cover bg-center bg-[url('${sessionScope.user.avatar}')] rounded-full overflow-hidden border-[1px] border-blue-500 w-[25px] h-[25px] box-content"></div>
				    </c:if>	
				</c:if>
				<c:if test="${sessionScope.user.name.equals('')}">
				    <span class="mr-2">${sessionScope.user.username}</span>
				    <c:if test="${sessionScope.user.avatar.equals('')}">
					<div class="rounded-full overflow-hidden bg-white relative p-3 border-[1px] border-blue-500 w-[25px] h-[25px]">
					    <div class="absolute font-medium text-[#0261d6] top-[50%] left-[50%] translate-x-[-50%] translate-y-[-50%]">${sessionScope.user.username.toUpperCase().charAt(0)}</div>
					</div>
				    </c:if>
				    <c:if test="${!sessionScope.user.avatar.equals('')}">
					<div class="bg-cover bg-center bg-[url('${sessionScope.user.avatar}')] rounded-full overflow-hidden border-[1px] border-blue-500 w-[25px] h-[25px] box-content"></div>
				    </c:if>	
				</c:if>
				<div class="absolute hidden group-hover:block shadow-md top-[calc(100%+10px)] right-0 bg-white text-black z-50 min-w-[200px] ">
				    <div class="after:absolute after:contents-[] after:p-[6px] after:bg-white after:right-[5px] after:top-[-6px] after:rotate-45 before:absolute before:contents-[] before:w-full before:h-[20px] before:top-[-20px] before:bg-transparent before:right-0">
					<div class="hover:bg-slate-50 hover:text-blue-500 w-full text-base"><a class="block p-3 py-2 w-full" href="account">Tài Khoản Của Tôi</a></div>
					<div class="hover:bg-slate-50 hover:text-blue-500 w-full text-base"><a class="block p-3 py-2 w-full" href="account?tab=orders">Đơn Mua</a></div>
					<div class="hover:bg-slate-50 hover:text-blue-500 w-full text-base"><a class="block p-3 py-2 w-full" href="check?action=logout">Đăng Xuất</a></div>
				    </div>
				</div>
			    </div>
			</c:if>
			<c:if test="${sessionScope.user==null}">
			    <div class="flex items-center gap-x-3">
				<a class="capitalize hover:text-white/70" href="register">Đăng ký</a>
				<div class="h-4 border-r-[1px] border-r-white/40"></div>
				<a class="capitalize hover:text-white/70" href="login">Đăng nhập</a>
			    </div>
			</c:if>
                    </div>
                    <div class="mt-4 flex items-center gap-x-4">
                        <div class="col-span-1 justify-self-end">
                            <div class="rounded-lg overflow-hidden h-[50px] w-[50px] md:w-[100px]">
                                <a class="relative" href="home">
                                    <img class="w-full h-full fill-white object-cover md:block hidden" src="./static/logo/blue-text-logo.png" alt="alt"/>
                                    <img class="w-full h-full object-cover md:hidden block" src="./static/logo/white-logo.png" alt="alt"/>
                                </a>
                            </div>
                        </div>
                        <form class="w-full overflow-hidden px-3" method="POST" action="searchProduct">
			    <div class="flex rounded-sm bg-white p-1">
				<input value="${requestScope.search}" type="text" class="w-full flex-grow-0 border-none bg-transparent px-3 py-2 text-black outline-none" placeholder="Free Ship Đơn Từ 0Đ" name="search" />
				<button class="rounded-sm bg-[#0261d6] px-4 py-2 text-white hover:opacity-90 lg:px-6">
				    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="h-6 w-6"><path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"></path></svg>
				</button>
			    </div>
			    <%
				CategoryDAO categoryDao = new CategoryDAO();
				List<Category> categories = categoryDao.getAll();
				try {
				    categoryDao.closeConnection();
				} catch (SQLException ex) {
				}
			    %>
			    <ul class="justufy-start my-2 flex w-full items-center text-[13px]">
				<c:forEach items="<%=categories%>" var="category">
				    <li>
					<a class="mr-2 w-full overflow-hidden truncate py-1" href="products?cid=${category.id}">${category.name}</a>
				    </li>
				</c:forEach>
			    </ul>
			</form>
			<%
				HttpSession session2 = request.getSession();
				User user = (User) session2.getAttribute("user");
				long quantity = 0;
				List<Product> top5Product = new ArrayList<>();
				if(user!=null){
				    CartProductDAO cartProductDao = new CartProductDAO();
				    ProductDAO productDao = new ProductDAO();
				    List<CartProduct> top5;
				    try {
					quantity = cartProductDao.getAllByUserId(user.getId()).size();
					if (quantity > 0) {
					    top5 = cartProductDao.getTop5ByUserId(user.getId());
					    for (CartProduct cartProduct : top5) {
						top5Product.add(productDao.get(cartProduct.getProductId()));
					    }
					}
					cartProductDao.closeConnection();
					productDao.closeConnection();
				    } catch (SQLException ex) {
				    }
				}
			%>
                        <div class="group relative col-span-1 justify-self-end">
			    <div class="cursor-pointer">
				<a class="relative" href="cart">
				    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-8 w-8"><path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z"></path></svg>
				    <span class="absolute right-[-15px] top-[-10px] flex h-[6px] max-w-[10px] items-center justify-center rounded-lg border-[1px] border-[#0261d6] bg-white px-4 py-2 text-sm font-bold text-[#0261d6]"><%=quantity%></span>
				</a>
			    </div>
			    <c:if test="${sessionScope.user!=null}">
				<div class="z-50 cart-shadow before:contents-[] after:contents-[] after:bg-tra absolute right-[-15px] top-[50px] hidden max-h-[450px] w-[395px] rounded-sm bg-white text-black drop-shadow-md duration-500 ease-linear before:absolute before:right-[17px] before:top-[-10px] before:rotate-45 before:bg-white before:p-3 after:absolute after:right-0 after:top-[-30px] after:h-[30px] after:w-full group-hover:block group-hover:opacity-100">
				    <c:if test="<%=top5Product.size()==0%>">
					<img src="./static/images/empty-cart.png" alt="alt" /> 
				    </c:if>
				    <c:if test="<%=top5Product.size()>0%>">
					<div>
					    <div>
						<div class="p-3 text-sm opacity-70">Sản Phẩm Mới Thêm</div>
					    </div>
					    <ul>
						<c:forEach items="<%=top5Product%>" var="p">
						    <li class="hover:bg-slate-100">
							<a href="" class="block p-2">
							    <div class="flex items-start justify-between">
								<img src="${p.url}" alt="" class="h-[40px] w-[40px] object-cover" />
								<div class="flex-1">
								    <p class="max-w-[250px] truncate px-2 leading-4">${p.name}</p>
								</div>
								<div class="flex items-center justify-center text-sm text-[#0261d6]">
								    <span class="block translate-y-[-2px]">₫</span>
								    <span>${DecimalFormat("###.###").format(p.price)}</span>
								</div>
							    </div>
							</a>
						    </li>
						</c:forEach>
					    </ul>
					    <div class="w-full items-center justify-end">
						<a href="cart" class="float-right m-2 block w-fit cursor-pointer bg-[#0261d6] px-4 rounded-sm hover:bg-blue-600 py-2 text-sm text-white">Xem Giỏ Hàng</a>
					    </div>
					</div>
				    </c:if>
				</div>
			    </c:if>
			</div>
		    </div>
		</div>
	    </div>
	</div>
    </body>
</html>
