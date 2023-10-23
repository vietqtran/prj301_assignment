<%-- 
    Document   : cart
    Created on : Sep 27, 2023, 8:32:12 PM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vietqtran.model.Product" %>
<%@page import="vietqtran.model.SizeProduct" %>
<%@page import="vietqtran.model.CartProduct" %>
<%@page import="vietqtran.services.ProductDAO" %>
<%@page import="vietqtran.services.SizeProductDAO" %>
<%@page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru | Cart</title>
	<link rel="icon" href="./static/logo/icon-logo.png" type="image/png" sizes="32x32">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
	<div class=" bg-[#0261d6] text-white ">
	    <div class="container mx-auto flex justify-between text-sm max-w-[1250px] py-2 px-2 lg:px-0">
		<div class="flex items-center gap-x-3">
		    <a class="capitalize hover:text-white/70" href="shop">Kênh Người Bán</a>
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
			<c:if test="${sessionScope.user.name.equals('')}">
			    <span class="mr-2">${sessionScope.user.username}</span>
			</c:if>
			<c:if test="${!sessionScope.user.name.equals('')}">
			    <span class="mr-2">${sessionScope.user.name}</span>
			</c:if>
			<div class="rounded-full overflow-hidden">
			    <div>
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6">
				<path fill-rule="evenodd" d="M18.685 19.097A9.723 9.723 0 0021.75 12c0-5.385-4.365-9.75-9.75-9.75S2.25 6.615 2.25 12a9.723 9.723 0 003.065 7.097A9.716 9.716 0 0012 21.75a9.716 9.716 0 006.685-2.653zm-12.54-1.285A7.486 7.486 0 0112 15a7.486 7.486 0 015.855 2.812A8.224 8.224 0 0112 20.25a8.224 8.224 0 01-5.855-2.438zM15.75 9a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z" clip-rule="evenodd" />
				</svg>
			    </div>
			</div>

			<div class="absolute hidden group-hover:block shadow-md top-[calc(100%+10px)] right-0 bg-white text-black z-50 min-w-[200px] ">
			    <div class="after:absolute after:contents-[] after:p-[6px] after:bg-white after:right-[5px] after:top-[-6px] after:rotate-45 before:absolute before:contents-[] before:w-full before:h-[20px] before:top-[-20px] before:bg-transparent before:right-0">
				<div class="hover:bg-slate-50 hover:text-blue-500 w-full text-base"><a class="block p-3 py-2 w-full" href="account">Tài Khoản Của Tôi</a></div>
				<div class="hover:bg-slate-50 hover:text-blue-500 w-full text-base"><a class="block p-3 py-2 w-full" href="orders">Đơn Mua</a></div>
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
	    <div class="bg-white py-6">
		<div class="container mx-auto max-w-[1250px]">
		    <nav class="flex flex-col items-center justify-center md:flex-row md:justify-between">
			<a class="flex flex-shrink-0 items-center text-blue-500" href="home">
			    <img src="./static/logo/text-logo.png" class="w-[100px]" alt="alt"/>
			    <div class="text-primary capitalize hidden md:block md:text-xl font-medium ml-5">Giỏ hàng</div></a
			>
			<form class="mt-3 w-full md:mt-0 md:w-[50%]">
			    <div class="flex rounded-sm border-2 border-blue-500">
				<input type="text" class="w-full flex-grow border-none bg-transparent px-3 py-1 text-black outline-none" placeholder="Free Ship Đơn Từ 0Đ" name="search" />
				<button class="flex-shrink-0 bg-blue-500 px-8 py-2 hover:opacity-90">
				    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-5 w-5 stroke-white">
				    <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"></path>
				    </svg>
				</button>
			    </div>
			</form>
		    </nav>
		</div>
	    </div>
	</div>
	<div class="bg-neutral-100 pt-5 pb-10 w-full border-b-4 border-blue-500">
	    <form id="productSelect" method="GET" action="createOrder" class="container mx-auto max-w-[1250px]">
		<div class="mb-3 w-full border-[1px] border-yellow-400 bg-[#fffefb] p-3 text-sm flex items-center">
		    <img src="./static/images/freeship.png" alt="" class="w-[30px] mr-3"/>
		    Nhấn vào mục Mã giảm giá ở cuối trang để hưởng miễn phí vận chuyển bạn nhé!
		</div>
		<div class="hidden grid-cols-12 rounded-sm bg-white px-9 py-5 text-sm capitalize text-gray-500 shadow lg:grid">
		    <div class="col-span-6">
			<div class="flex items-center">
			    <div class="text-black">Sản phẩm</div>
			</div>
		    </div>
		    <div class="col-span-6">
			<div class="grid grid-cols-5 text-center">
			    <div class="col-span-2">Đơn giá</div>
			    <div class="col-span-1">Số lượng</div>
			    <div class="col-span-1">Số tiền</div>
			    <div class="col-span-1">Thao tác</div>
			</div>
		    </div>
		</div>

		<c:forEach items="${requestScope.cart}" var="cart">
		    <c:set var="shop" value="${cart.key}"/>
		    <div class="my-3 rounded-sm bg-white shadow p-5">
			<div class="mb-5 flex items-center justify-start px-4">
			    <input type="checkbox" class="mr-3 h-5 w-5 shopCheckbox" onchange="checkAllInShop(this)"  />
			    <span class="text-sm text-blue-500">${shop.name}</span>
			    <button class="">
				<svg viewBox="0 0 16 16" class="">
				<g fill-rule="evenodd"><path d="M15 4a1 1 0 01.993.883L16 5v9.932a.5.5 0 01-.82.385l-2.061-1.718-8.199.001a1 1 0 01-.98-.8l-.016-.117-.108-1.284 8.058.001a2 2 0 001.976-1.692l.018-.155L14.293 4H15zm-2.48-4a1 1 0 011 1l-.003.077-.646 8.4a1 1 0 01-.997.923l-8.994-.001-2.06 1.718a.5.5 0 01-.233.108l-.087.007a.5.5 0 01-.492-.41L0 11.732V1a1 1 0 011-1h11.52zM3.646 4.246a.5.5 0 000 .708c.305.304.694.526 1.146.682A4.936 4.936 0 006.4 5.9c.464 0 1.02-.062 1.608-.264.452-.156.841-.378 1.146-.682a.5.5 0 10-.708-.708c-.185.186-.445.335-.764.444a4.004 4.004 0 01-2.564 0c-.319-.11-.579-.258-.764-.444a.5.5 0 00-.708 0z"></path></g>
				</svg>
			    </button>
			</div>
			<c:forEach items="${cart.value}" var="cartProduct">
			    <%
				ProductDAO dao = new ProductDAO();
				SizeProductDAO sizeDao = new SizeProductDAO();
				CartProduct cp = (CartProduct) pageContext.getAttribute("cartProduct");
				Product product = new Product();
				SizeProduct size = new SizeProduct();
				try {
				    long id = cp.getProductId();
				    product = dao.get(id);
				    long sizeId = cp.getSizeId();
				    size = sizeDao.get(sizeId);
				    dao.closeConnection();
				    sizeDao.closeConnection();
				} catch (SQLException ex) {
				}
				double totalPrice = 0;
				if(product.getSalePrice()==0){
				    totalPrice = cp.getQuantity()*product.getPrice();
				}else{
				    totalPrice = cp.getQuantity()*product.getSalePrice();
				}
			    %>
			    <div class="mb-5 flex items-center justify-between rounded-sm border border-gray-200 bg-white px-4 py-5 text-center text-sm text-gray-500 first:mt-0 lg:grid lg:grid-cols-12">
				<div class="flex items-center gap-x-3 lg:col-span-6 w-full">
				    <div class="flex items-center justify-center gap-x-3">
					<input onchange="handleCheckProduct()" type="checkbox" class="h-5 w-5 productCheckbox" name="productId" value="${cartProduct.id}"/>
					<a class="h-14 w-14 flex-shrink-0 sm:h-20 sm:w-20" href=""> 
					    <img alt="" src="<%=product.getUrl()%>" class="h-14 w-14 object-cover sm:h-20 sm:w-20" /> 
					</a>
				    </div>
				    <div class="flex flex-col flex-1 items-start gap-y-1 lg:flex-row lg:gap-y-0">
					<div class="flex items-center justify-between w-full">
					    <div class="text-left truncate block w-[200px]" href=""><%=product.getName()%></div>
					    <div>Loại: <%=size.getName()%></div>
					</div>
					<div class="flex items-center gap-x-3 lg:hidden">
					    <span class="text-gray-300 line-through">₫<%=Math.round(product.getPrice())%></span>
					    <span class="lg:block">₫<%=Math.round(product.getSalePrice())%></span>
					</div>
					<div class="flex items-center justify-between w-full lg:hidden">
					    <div class="flex items-center">
						<div class="flex items-center">
						    <a href="cartProductQuantity?action=decrease&id=${cartProduct.id}" class="block flex h-6 w-6 items-center justify-center px-2 rounded-l-sm border border-gray-300 text-gray-600 sm:h-8 sm:w-8">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-3 w-3 sm:h-4 sm:w-4">
							<path stroke-linecap="round" stroke-linejoin="round" d="M19.5 12h-15"></path></svg>
						    </a>
						    <div class="">
							<input type="text" id="quantityInput('<%=size.getInventory()%>')" placeholder="" class="h-6 w-9 rounded-none px-2 border-b border-t border-gray-300 p-1 text-center outline-none sm:h-8 sm:w-14" value="${cartProduct.quantity}" />
						    </div>
						    <a href="cartProductQuantity?action=increase&id=${cartProduct.id}" onclick="increaseQuantity('${cartProduct.id}')" class="block flex h-6 w-6 items-center justify-center rounded-r-sm border border-gray-300 text-gray-600 sm:h-8 sm:w-8">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-3 w-3 sm:h-4 sm:w-4">
							<path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15"></path></svg>
						    </a>
						</div>
						<span class="text-primary block lg:hidden ml-3">₫<%=Math.round(totalPrice)%></span>
					    </div>
					    <a href="deleteCartProduct?id=${cartProduct.id}" class="block text-primary bg-none py-1 px-2 rounded-sm text-white bg-red-500">Xóa khỏi giỏ</a>
					</div>
				    </div>
				</div>
				<div class="col-span-6">
				    <div class="grid grid-cols-5 items-center">
					<div class="col-span-2">
					    <div class="hidden items-center justify-center gap-x-3 lg:flex">
						<span class="text-gray-300 line-through">₫
						    <span class="price"><%=Math.round(product.getPrice())%></span>
						</span>
						<span class="hidden lg:block">₫
						    <span class="salePrice"><%=Math.round(product.getSalePrice())%></span>
						</span>
						<span class="text-primary block lg:hidden">₫
						    <span class="total"><%=Math.round(totalPrice)%></span>
						</span>
					    </div>
					</div>
					<div class="col-span-1 hidden lg:block">
					    <div class="flex flex items-center items-center">
						<a href="cartProductQuantity?action=decrease&id=${cartProduct.id}" class="block flex h-6 w-6 items-center px-2 justify-center rounded-l-sm border border-gray-300 text-gray-600 sm:h-8 sm:w-8">
						    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-3 w-3 sm:h-4 sm:w-4">
						    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 12h-15"></path></svg>
						</a>
						<div class="">
						    <input type="text" placeholder="" class="quantity h-6 w-9 rounded-none border-b border-t border-gray-300 p-1 text-center outline-none sm:h-8 sm:w-14" value="${cartProduct.quantity}" />
						</div>
						<a href="cartProductQuantity?action=increase&id=${cartProduct.id}" onclick="increaseQuantity('${cartProduct.id}')" class="block px-2 flex h-6 w-6 items-center justify-center rounded-r-sm border border-gray-300 text-gray-600 sm:h-8 sm:w-8">
						    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-3 w-3 sm:h-4 sm:w-4">
						    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15"></path></svg>
						</a>
					    </div>
					</div>
					<div class="col-span-1 hidden lg:block"><span class="text-primary">₫<%=Math.round(totalPrice)%></span></div>
					<div class="col-span-1 hidden lg:flex justify-center">
					    <a href="deleteCartProduct?id=${cartProduct.id}" class="block w-fit text-right text-primary bg-none py-1 px-2 rounded-sm text-white bg-red-500">Xóa</a>
					</div>
				    </div>
				</div>
			    </div>
			</c:forEach>
		    </div>
		</c:forEach>
		<div class="sticky bottom-0 z-10 mt-8 flex flex-col rounded-sm border border-gray-100 bg-white px-8 py-3 shadow lg:flex-row lg:items-center">
		    <div class="flex items-center">
			<div class="flex flex-shrink-0 items-center justify-center pr-3">
			    <input id="selectAll" onchange="checkAll(this)" type="checkbox" class="accent-primary h-5 w-5" />
			</div>
			<label for="selectAll" class="mx-3 border-none bg-none">Chọn tất cả <span id="productsQuantity"></span></label>
			<button type="button" class="mx-3 border-none bg-none p-2 py-1 text-white text-sm bg-red-600 hover:bg-red-500">Xóa tất cả</button>
		    </div>
		    <div class="mt-5 flex flex-col lg:ml-auto lg:mt-0 lg:flex-row lg:items-center">
			<div>
			    <div class="flex items-center lg:justify-end">
				<div>Tổng thanh toán (<span id="totalChecked">0</span> sản phẩm):</div>
				<div class="text-primary ml-2 text-2xl">₫<span id="totalPrice" class="pl-1">0</span></div>
			    </div>
			    <div class="flex items-center text-sm lg:justify-end">
				<div class="text-gray-500">Tiết kiệm</div>
				<div class="text-primary ml-6">₫<span id="savePrice">0</span></div>
			    </div>
			</div>
			<div>
			    <button type="button" onclick="handleSubmit()" class="bg-primary mt-5 flex h-10 w-full items-center justify-center bg-blue-500 px-10 py-2 text-center text-sm uppercase text-white hover:bg-blue-600 lg:ml-4 lg:mt-0">
				Mua hàng
			    </button>
			</div>
		    </div>
		</div>
	    </form>
	    <div  class="container mx-auto max-w-[1250px] p-2 md:p-0">
		<div class="w-full flex items-center justify-between mt-10 mb-5">
		    <h1>CÓ THỂ BẠN CŨNG THÍCH</h1>
		    <a href="url" class="flex items-center text-blue-600">Xem Tất Cả <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
			<path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
			</svg>
		    </a>
		</div>
		<div class="grid lg:grid-cols-6 gap-3 md:grid-cols-5 sm:grid-cols-4 grid-cols-2">
		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>
		</div>
	    </div>
	</div>

	<%@include file="./components/footer.jsp" %>
	<script src="./static/js/cart.js"></script>
    </body>
</html>
