<%-- 
    Document   : prepareOrder
    Created on : Oct 15, 2023, 9:05:18 AM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vietqtran.model.Product" %>
<%@page import="vietqtran.model.Shop" %>
<%@page import="vietqtran.model.ShipCompany" %>
<%@page import="vietqtran.model.SizeProduct" %>
<%@page import="vietqtran.model.CartProduct" %>
<%@page import="vietqtran.services.ProductDAO" %>
<%@page import="vietqtran.services.ShipCompanyDAO" %>
<%@page import="vietqtran.services.ShopDAO" %>
<%@page import="vietqtran.services.SizeProductDAO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru | Order</title>
        <link rel="icon" href="./static/logo/icon-logo.png" type="image/png" sizes="32x32">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-slate-50">
	<div class="w-full bg-[#0261d6]">
            <div class="container mx-auto max-w-[1250px] py-2 px-2 pr-5 md:pr-2 text-white">
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
			<div class="flex group items-center justify-between cursor-pointer relative">
			    <c:if test="${!sessionScope.user.name.equals('')}">
				<span class="mr-2">${sessionScope.user.name}</span>
				<c:if test="${sessionScope.user.avatar.equals('')}">
				    <div class="rounded-full overflow-hidden bg-white relative p-10 border-[1px] border-blue-500 mb-5">
					<div class="absolute font-medium text-[#0261d6] text-2xl top-[50%] left-[50%] translate-x-[-50%] translate-y-[-50%]">${sessionScope.user.name.toUpperCase().charAt(0)}</div>
				    </div>
				</c:if>
				<c:if test="${!sessionScope.user.avatar.equals('')}">
				    <div class="bg-cover bg-center bg-[url('https://scontent.fhan20-1.fna.fbcdn.net/v/t39.30808-6/379178696_791051569690767_4898055343665726787_n.jpg?stp=dst-jpg_p526x296&_nc_cat=108&ccb=1-7&_nc_sid=813123&_nc_ohc=NeAh2QdtcNEAX8CTiyx&_nc_ht=scontent.fhan20-1.fna&oh=00_AfALEDX3qqlO-hpw6C_zIrkfLPSmecwE5iW6jAoEN15Lww&oe=651AEE1D')] rounded-full overflow-hidden border-[1px] border-blue-500 w-[25px] h-[25px] box-content"></div>
				</c:if>	
			    </c:if>
			    <c:if test="${sessionScope.user.name.equals('')}">
				<span class="mr-2">${sessionScope.user.username}</span>
				<c:if test="${sessionScope.user.avatar.equals('')}">
				    <div class="rounded-full overflow-hidden bg-white relative p-3 border-[1px] border-blue-500">
					<div class="absolute font-medium text-[#0261d6] top-[50%] left-[50%] translate-x-[-50%] translate-y-[-50%]">${sessionScope.user.username.toUpperCase().charAt(0)}</div>
				    </div>
				</c:if>
				<c:if test="${!sessionScope.user.avatar.equals('')}">
				    <div class="bg-cover bg-center bg-[url('https://scontent.fhan20-1.fna.fbcdn.net/v/t39.30808-6/379178696_791051569690767_4898055343665726787_n.jpg?stp=dst-jpg_p526x296&_nc_cat=108&ccb=1-7&_nc_sid=813123&_nc_ohc=NeAh2QdtcNEAX8CTiyx&_nc_ht=scontent.fhan20-1.fna&oh=00_AfALEDX3qqlO-hpw6C_zIrkfLPSmecwE5iW6jAoEN15Lww&oe=651AEE1D')] rounded-full overflow-hidden border-[1px] border-blue-500 w-[25px] h-[25px] box-content"></div>
				</c:if>	
			    </c:if>
			    <div class="absolute hidden group-hover:block shadow-md top-[calc(100%+10px)] right-0 bg-white text-black z-50 min-w-[200px] ">
				<div class="after:absolute after:contents-[] after:p-[6px] after:bg-white after:right-[5px] after:top-[-6px] after:rotate-45 before:absolute before:contents-[] before:w-full before:h-[20px] before:top-[-20px] before:bg-transparent before:right-0">
				    <div class="hover:bg-slate-50 hover:text-blue-500 w-full text-base"><a class="block p-3 py-2 w-full" href="account">Tài Khoản Của Tôi</a></div>
				    <div class="hover:bg-slate-50 hover:text-blue-500 w-full text-base"><a class="block p-3 py-2 w-full" href="orders">Đơn Mua</a></div>
				    <div class="hover:bg-slate-50 hover:text-blue-500 w-full text-base"><a class="block p-3 py-2 w-full" href="check?action=logout">Đăng Xuất</a></div>
				</div>
			    </div>
			</div>
                    </div>
		</div>
	    </div>
	</div>
	<div class="bg-white w-full v-dropshadow">
	    <div class="w-full container mx-auto max-w-[1250px] px-4 py-8 flex items-center justify-start">
		<a href="home"><img class="w-[100px]" src="./static/logo/text-logo.png" alt="alt"/></a>
		<span class="block pl-5 text-blue-500 text-xl font-medium">Thanh toán</span>
	    </div>
	</div>

	<div class="w-full mt-5">
	    <div class="w-full container mx-auto max-w-[1250px] bg-white v-dropshadow">
		<div class="bgTop"></div>
		<div class=" px-4 py-8 pb-3 bg-white">
		    <div class="flex items-center justify-start text-sm text-blue-500 font-medium">
			<span class="block mr-2">
			    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6">
			    <path fill-rule="evenodd" d="M11.54 22.351l.07.04.028.016a.76.76 0 00.723 0l.028-.015.071-.041a16.975 16.975 0 001.144-.742 19.58 19.58 0 002.683-2.282c1.944-1.99 3.963-4.98 3.963-8.827a8.25 8.25 0 00-16.5 0c0 3.846 2.02 6.837 3.963 8.827a19.58 19.58 0 002.682 2.282 16.975 16.975 0 001.145.742zM12 13.5a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd" />
			    </svg>
			</span>
			<span>
			    Địa Chỉ Nhận Hàng
			</span>
		    </div>
		    <div class="w-full flex items-center justify-between mt-3">
			<c:if test="${requestScope.address.size()>0}">
			    <div>
				<div class="flex">
				    <span id="userPreview" class="font-semibold block mr-3">${requestScope.address[0].name} - ${requestScope.address[0].phone}</span>
				    <span id="addressPreview" class="">${requestScope.address[0].detail}, ${requestScope.address[0].town}, ${requestScope.address[0].district}, ${requestScope.address[0].city}.</span>
				</div>
			    </div>
			    <div>
				<button onclick="toggleChangeAddressModal()" class="p-2 px-3 text-sm border-[1px] border-slate-200 flex items-center justify-center">
				    <span>
					Thay Đổi Địa Chỉ
				    </span>				
				</button>
			    </div>
			</c:if>
			<c:if test="${requestScope.address.size()==0}">
			    <div>
				<button onclick="toggleModal()" class="p-2 px-3 text-sm border-[1px] border-slate-200 flex items-center justify-center">
				    <span>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
					<path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m6-6H6" />
					</svg>
				    </span>
				    <span>
					Thêm Địa Chỉ Mới
				    </span>				
				</button>
			    </div>
			</c:if>
		    </div>
		</div>
	    </div>
	</div>


	<div class="w-full mt-5">
	    <form action="order" method="POST" class="container mx-auto max-w-[1250px]">
		<input type="text" class="hidden" id="addressId" name="addressId" value="${requestScope.address[0].id}">
		<div class="grid grid-cols-10 p-5 bg-white w-full rounded-t-sm v-dropshadow">
		    <div class="col-span-4 justify-start text-lg flex items-center">Sản phẩm</div>
		    <div class="col-span-2"></div>
		    <div class="col-span-1 justify-center text-sm text-gray-700 flex items-center">Đơn giá</div>
		    <div class="col-span-1 justify-center text-sm text-gray-700 flex items-center">Số lượng</div>
		    <div class="col-span-2 justify-end text-sm text-gray-700 flex items-center">Thành tiền</div>
		</div>
		<%
		    ShipCompanyDAO shipCompanyDao = new ShipCompanyDAO();
		    List<ShipCompany> shipCompanies = new ArrayList<>();
		    try {
			shipCompanies = shipCompanyDao.getAll();
		    } catch (SQLException ex) {
		    }
		%>

		<%DecimalFormat df = new DecimalFormat("###,###,###");%>

		<input type="text" name="shopQuantity" class="hidden" value="${requestScope.data.size()}"> <!--Order Quantity-->
		<c:forEach items="${requestScope.data}" var="data" varStatus="loop">
		    <c:set var="shopIdRef" value="${data.key}"/>
		    <input type="text" name="shopId${loop.index+1}" class="hidden" value="${shopIdRef}">
		    <%
			Object shopIdObj = pageContext.getAttribute("shopIdRef");
			Long shopId = null;
			if(shopIdObj instanceof Long) {
			    shopId = (Long) shopIdObj;
			} else if(shopIdObj instanceof String) {
			    shopId = Long.parseLong((String) shopIdObj); 
			}
			ShopDAO shopDao = new ShopDAO();
			Shop shop = new Shop();
			try {
			    shop = shopDao.get(shopId);
			} catch (SQLException ex) {
			}
		    %>
		    <div class="w-full v-dropshadow shopBlock">
			<div class="p-4 bg-white mt-3 flex items-center justify-start">
			    <span class="pr-2">
				<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
				<path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" />
				</svg>
			    </span>
			    <span>
				<%=shop.getName()%>
			    </span>
			</div>
			<c:forEach items="${data.value}" var="product">
			    <input type="text" name="productId${loop.index+1}" value="${product.id}" class="hidden">
			    <div class="grid grid-cols-10 p-5 bg-white w-full rounded-sm">
				<%
				    ProductDAO dao = new ProductDAO();
				    SizeProductDAO sizeDao = new SizeProductDAO();
				    CartProduct cp = (CartProduct) pageContext.getAttribute("product");
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
				<div class="col-span-4 justify-start text-lg flex items-center">
				    <img src="<%=product.getUrl()%>" class="w-[40px] h-[40px] object-cover block mr-4" alt="alt"/>
				    <span class="text-sm truncate w-[80%]"><%=product.getName()%></span>
				</div>
				<div class="col-span-2 text-sm text-gray-700 flex items-center justify-start pl-2">Loại: <%=size.getName()%></div>
				<div class="col-span-1 justify-center text-sm text-gray-700 flex items-center">
				    <c:if test="<%=product.getSalePrice()==0%>">
					₫ <span class=""><%=df.format(product.getPrice())%></span>
				    </c:if>
				    <c:if test="<%=product.getSalePrice()!=0%>">
					₫ <span class=""><%=df.format(product.getSalePrice())%></span>
				    </c:if>
				</div>
				<div class="col-span-1 justify-center text-sm text-gray-700 flex items-center"><%=cp.getQuantity()%></div>
				<div class="col-span-2 justify-end text-sm text-gray-700 flex items-center">₫ <span class=" productPrice priceUnit"><%=df.format(totalPrice)%></span></div>
			    </div>
			</c:forEach>
			<div class="bg-[#fafdff] mb-10 v-dropshadow">
			    <div class="grid grid-cols-10 w-full">
				<div class="col-span-4 flex items-center justify-start border-r-[1px] p-8">
				    <label class="block whitespace-nowrap pr-5">Lời nhắn:</label>
				    <input type="text" name="note${loop.index+1}" 
					   placeholder="Lưu ý cho Người bán..." 
					   class="rounded-sm p-2 outline-none w-full block border-[1px] border-slate-200 focus:border-blue-500"
					   > <!--Note--> 
				</div>
				<div class="col-span-6 grid grid-cols-11 p-5 flex items-start">
				    <div class="col-span-3 text-sm text-[#00bfa5]">Đơn vị vận chuyển:</div>
				    <input type="text" name="shipCompanyId${loop.index+1}" class="shipCompanyId hidden" value="<%=shipCompanies.get(0).getId()%>">
				    <div class="col-span-4 font-semibold flex flex-col">
					<span class="previewShipName"><%=shipCompanies.get(0).getName()%></span>
					<span class="text-sm font-normal">Nhận hàng vào 
					    <span class="dateOfReceipt"></span>
					</span>
				    </div>
				    <div onclick="openChangeShipCompany(this)" class="col-span-2 text-blue-500 cursor-pointer">Thay đổi</div>
				    <div class="col-span-2 flex items-center justify-end text-sm">
					₫ <span class="priceUnit previewShipPrice shipPrice"><%=df.format(shipCompanies.get(0).getPrice())%></span>
				    </div>
				</div>
			    </div>
			    <div class="w-full p-5 flex items-center justify-end border-t-[1px]">
				Tổng số tiền (${data.value.size()} sản phẩm):
				<span class="text-blue-500 text-lg pl-5 block flex">
				    <span class="translate-y-[-1px] block">₫</span>
				    <span class="text-2xl font-medium total"></span>
				    <input type="text" class="totalInput hidden" name="totalPrice${loop.index+1}"> <!--Total price-->
				</span>
			    </div>
			</div>
		    </div>
		</c:forEach>
		<div class="v-dropshadow w-full bg-white mb-20">
		    <div class="w-full p-5 flex items-center justify-between">
			<span class="text-xl">Phương thức thanh toán</span>
			<div class="w-fit text-sm flex items-center">
			    <div class="p-2 border-[1px] border-blue-500 cursor-not-allowed mr-2 opacity-70">Thẻ Tín dụng/Ghi nợ</div>
			    <div class="p-2 border-[1px] border-blue-500 cursor-not-allowed mr-2 opacity-70">Apple Pay</div>
			    <div class="p-2 border-[1px] border-blue-500 cursor-pointer bg-blue-50">Thanh toán khi nhận hàng</div>
			</div>
		    </div>
		    <div class="bg-[#fffefb] p-5 border-t-[1px] border-b-[1px] w-full flex items-center justify-end">
			<div class="grid grid-cols-2 gap-4 text-sm">
			    <div>Tổng tiền hàng</div>
			    <div class="text-right">
				<span>₫<span id="totalPrice"></span></span>
			    </div>
			    <div>Phí vận chuyển</div>
			    <div class="text-right">
				<span>₫<span id="totalShip"></span></span>
			    </div>
			    <div class="flex items-center">Tổng thanh toán:</div>
			    <div class="text-right text-lg text-blue-500">
				<span class="flex items-start justify-end">
				    <span>₫</span>				
				    <span class="text-2xl" id="totalAll"></span>
				</span>
			    </div>
			</div>
		    </div>
		    <div class="flex p-5 items-center justify-end bg-[#fffefb]">
			<button type="submit" class="py-1 px-16 bg-blue-600 hover:bg-blue-500 text-white">Đặt hàng</button>
		    </div>
		</div>
	    </form>
	</div>
    </div>




    <div onclick="toggleModal()" id="cover" style="display: none" class="fixed w-[100%] items-center justify-center h-[100%] top-0 right-0 left-0 bg-black bg-opacity-70 z-50 p-2">
	<form id="addressForm" action="address" method="POST" onclick="handleClickContent(event)" class="p-5 grid gap-4 gap-y-2 text-sm grid-cols-1 lg:grid-cols-3 bg-white rounded-sm w-full max-w-[500px]">
	    <div class="w-full flex items-center justify-start text-lg mb-3 col-span-1 lg:col-span-3">
		Địa chỉ mới
	    </div>
	    <div class="grid grid-cols-2 lg:col-span-3 col-span-1 gap-4">
		<div class="col-span-1">
		    <input required type="text" name="name" placeholder="Họ và Tên" class="p-2 outline-none w-full block border-[1px] border-slate-200 focus:border-blue-500">
		</div>
		<div class="col-span-1">
		    <input required type="text" id="phoneInput" name="phone" placeholder="Số điện thoại" class="p-2 outline-none w-full block border-[1px] border-slate-200 focus:border-blue-500">
		</div>
		<div class="col-span-2 grid grid-cols-3 gap-4">
		    <select required id="city" name="city"
			    class="p-2 outline-none w-full block border-[1px] border-slate-200 focus:border-blue-500 col-span-1 w-full">
		    </select>
		    <select required id="district" name="district"
			    class="p-2 outline-none w-full block border-[1px] border-slate-200 focus:border-blue-500 col-span-1 w-full">
		    </select>
		    <select required id="ward" name="ward"
			    class="p-2 outline-none w-full block border-[1px] border-slate-200 focus:border-blue-500 col-span-1 w-full">
		    </select>
		</div>
		<div class="col-span-2">
		    <input required type="text" name="detail" placeholder="Địa chỉ cụ thể" class="p-2 outline-none w-full block border-[1px] border-slate-200 focus:border-blue-500">
		</div>
	    </div>
	    <div class="flex items-center justify-end col-span-1 lg:col-span-3 mt-5">
		<button onclick="toggleModal()" class="text-sm py-2 px-5 bg-white hover:bg-slate-100 mr-3 block">Trở Lại</button>		
		<button type="button" onclick="handleSubmit()" class="text-sm py-2 px-5 bg-blue-600 hover:bg-blue-500 text-white">Hoàn thành</button>
	    </div>
	</form>
    </div>

    <div onclick="toggleChangeAddressModal()" id="changeAddressCover" style="display: none" class="fixed flex-col w-[100%] items-center justify-center h-[100%] top-0 right-0 left-0 bg-black bg-opacity-70 z-50 p-2">
	<div onclick="handleClickContent(event)" class="text-sm bg-white rounded-sm w-full max-w-[500px]">
	    <div class="w-full p-4 border-[1px] border-b-slate-100">
		Địa Chỉ Của Tôi
	    </div>
	    <div class="h-[480px] overflow-y-auto">
		<c:forEach items="${requestScope.address}" var="a">
		    <div class="p-4 flex items-start justify-start border-[1px] border-b-slate-100">
			<div class="flex items-center mr-5">
			    <input onchange="handleSelectAddress(this)" id="${a.id}" type="checkbox" class="address" value="${a.id}">
			</div>
			<label for="${a.id}">
			    <div class="flex items-start flex-col">
				<div class="flex items-center justify-start">
				    <span class="font-semibold name">${a.name}</span>
				    <span class="mx-2">|</span>
				    <span class="phone">${a.phone}</span>
				</div>
				<div>
				    <span class="block detail">${a.detail}</span>
				    <span class="addressText">${a.town}, ${a.district}, ${a.city}</span>
				</div>
			    </div>
			</label>
		    </div>
		</c:forEach>
	    </div>
	    <div class="p-4 border-b-[1px] border-b-slate-100">
		<button onclick="showAddAddress()" class="p-2 px-3 text-sm border-[1px] border-slate-200 flex items-center justify-center">
		    <span>
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
			<path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m6-6H6" />
			</svg>
		    </span>
		    <span>
			Thêm Địa Chỉ Mới
		    </span>				
		</button>
	    </div>
	    <div class="p-4 flex items-center justify-end">
		<button onclick="toggleChangeAddressModal()" class="w-[140px] h-[40px] bg-slate-50 hover:bg-slate-100 flex items-center justify-center">Huỷ</button>
		<button onclick="changeAddressConfirm()" class="w-[140px] h-[40px] bg-blue-600 hover:bg-blue-500 text-white flex items-center justify-center ml-3">Xác nhận</button>
	    </div>
	</div>
    </div>

    <div onclick="toggleChangeShipCompany()" id="changeCompanyCover" style="display: none" class="fixed flex-col w-[100%] items-center justify-center h-[100%] top-0 right-0 left-0 bg-black bg-opacity-70 z-50 p-2">
	<div onclick="handleClickContent(event)" class="text-sm bg-white rounded-sm w-full max-w-[500px]">
	    <div class="w-full p-4 border-[1px] border-b-slate-100">
		Thay Đổi Đơn Vị Vận Chuyển
	    </div>
	    <div class="h-[510px] overflow-y-auto">
		<c:forEach items="${requestScope.shipCompanies}" var="shipCompany">
		    <div class="p-4 flex items-center justify-start border-[1px] border-b-slate-100">
			<div class="flex items-center mr-5">
			    <input onchange="handleSelectShipCompany(this)" id="shipCompany${shipCompany.id}" type="checkbox" class="shipCompanyCheckbox" value="${shipCompany.id}">
			</div>
			<label for="shipCompany${shipCompany.id}" class="block w-full">
			    <div class="flex items-start justify-between w-full">
				<div class="flex items-center justify-start">
				    <img src="./static/images/shipCompany/${shipCompany.image}" class="w-[40px] h-[40px] object-contain mr-5" alt="alt"/>
				    <span class="shipCompanyNameChange">${shipCompany.name}</span>
				</div>
				<div>				   
				    <span class="shipCompanyPriceChange">${DecimalFormat("###,###,###").format(shipCompany.price)}</span>
				</div>
			    </div>
			</label>
		    </div>
		</c:forEach>
	    </div>
	    <div class="p-4 flex items-center justify-end">
		<button onclick="toggleChangeShipCompany()" class="w-[140px] h-[40px] bg-slate-50 hover:bg-slate-100 flex items-center justify-center">Huỷ</button>
		<button onclick="changeShipCompany()" class="w-[140px] h-[40px] bg-blue-600 hover:bg-blue-500 text-white flex items-center justify-center ml-3">Xác nhận</button>
	    </div>
	</div>
    </div>


    <%@include file="./components/footer.jsp" %>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script src="./static/js/cityAPI.js"></script>
    <script src="./static/js/prepareOrder.js"></script>
</body>
</html>
