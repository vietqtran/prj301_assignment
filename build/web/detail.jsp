<%-- 
    Document   : detail
    Created on : Oct 5, 2023, 8:49:43 AM
    Author     : tranq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru | Product</title>
        <link rel="icon" href="./static/logo/icon-logo.png" type="image/png" sizes="32x32">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/35.2.1/adapter-ckfinder/ckfinder.js"></script>
    </head>
    <body class="bg-slate-100">
	<%@include file="./components/header.jsp" %>
	<div class="container mx-auto my-5 bg-white p-5 bg-white max-w-[1250px]">
	    <div class="container mx-auto">
		<div class="lg:grid lg:grid-cols-12 lg:gap-9">
		    <div class="block w-full lg:col-span-5">
			<div class="flex items-center overflow-hidden justify-center">
			    <div class="w-full">
				<div class="w-full">
				    <div class="relative w-full overflow-hidden pt-[100%]">
					<img id="previewImage" src="${requestScope.images[0].imageUrl}" alt="" aria-hidden="true" class="absolute left-0 top-0 h-full w-full cursor-zoom-in bg-white object-cover" />
				    </div>
				</div>
			    </div>
			</div>
			<div class="mt-4 relative">
			    <div class="flex items-center justify-center relative ${requestScope.images.size()>=5?'autoplay':''}">
				<div class="border-blue-500 border-[3px] cursor-pointer" style="width: 91.8px; margin-right: 10px;">
				    <div class="relative w-full pt-[100%]">
					<img src="${requestScope.images[0].imageUrl}" alt="" class="previewImage absolute left-0 top-0 h-full w-full cursor-pointer bg-white object-cover" />
				    </div>
				</div>
				<c:if test="${requestScope.images.size()>1}">
				    <c:forEach items="${requestScope.images}" var="image" varStatus="loop">
					<c:if test="${loop.index!=0}">
					    <div class="border-[3px] border-white cursor-pointer" style="width: 91.8px; margin-right: 10px;">
						<div class="relative w-full pt-[100%]">
						    <img src="${image.imageUrl}" alt="" class="previewImage absolute left-0 top-0 h-full w-full cursor-pointer bg-white object-cover" />
						</div>
					    </div>
					</c:if>
				    </c:forEach>
				</c:if>
			    </div>
			    <c:if test="${requestScope.images.size()>=5}">
				<button class="text-white p-2 bg-slate-600 bg-opacity-60 left-[-10px] absolute top-[50%] translate-y-[-50%] custom-prev z-50">
				    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
				    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
				    </svg>
				</button>
				<button class="p-2 text-white bg-slate-600 bg-opacity-60 right-[-10px] absolute top-[50%] translate-y-[-50%] custom-next z-50">
				    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
				    <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
				    </svg>
				</button>
			    </c:if>
			</div>
		    </div>
		    <div class="mt-5 block lg:col-span-7">
			<h1 class="text-xl font-medium uppercase">${requestScope.product.name}</h1>
			<div class="mt-8 flex items-center">
			    <div class="flex items-center">
				<span class="border-b-blue-500 text-blue-500 mr-1 border-b">${requestScope.product.rate}</span>
				<div class="flex items-center relative w-[100px] ml-2">
				    <div class="flex items-center justify-start relative w-full">
                                        <img src="./static/images/stars-gray.png" alt="alt" class="w-full absolute z-40 left-0"/>
                                        <div class="overflow-hidden absolute z-50 left-0" style="width: ${(requestScope.product.rate/5)*100}%">
                                            <img src="./static/images/star-yellow.png" alt="alt" class="min-w-[100px]"/>
                                        </div>
                                    </div>
				</div>
			    </div>
			    <div class="mx-4 h-4 w-[1px] bg-gray-300"></div>
			    <div>
				<span class="border-b-black border-b">${requestScope.rates.size()}</span>
				<span class="ml-1 text-sm text-gray-500">Đánh Giá</span>
			    </div>
			    <div class="mx-4 h-4 w-[1px] bg-gray-300"></div>
			    <div>
				<span class="border-b-black border-b">${requestScope.product.boughtQuantity}</span>
				<span class="ml-1 text-sm text-gray-500">Đã bán</span>
			    </div>
			</div>
			<div class="mt-8 flex items-center gap-x-4 bg-gray-50 px-5 py-4">
			    <div class="text-gray-500 line-through">₫${DecimalFormat("###.###").format(requestScope.product.price)}</div>
			    <div class="text-blue-500 text-2xl font-medium sm:text-3xl">₫${DecimalFormat("###.###").format(requestScope.product.salePrice)}</div>
			    <!--<div class="bg-primary rounded-sm px-1 py-[2px] text-xs font-semibold uppercase text-white">50% giảm</div>-->
			</div>
			<form id="quantityForm" action="addToCart" method="POST">
			    <input type="text" name="productId" class="hidden" value="${requestScope.product.id}">
			    <c:if test="${requestScope.sizes.size()>0}">
				<div class="mt-8 flex items-start">
				    <div class="capitalize text-gray-500 p-1 pl-0">Loại: </div>
				    <div class="ml-10 flex items-center justify-start flex-wrap">
					<div onclick="setQuantity('${requestScope.sizes[0].inventory}')" class="productOption py-1 px-3 border-[1px] border-blue-500 text-blue-500 cursor-pointer mr-2 mb-2">
					    <span>${requestScope.sizes[0].name}</span>
					    <input type="checkbox" value="${requestScope.sizes[0].id}" class="productOptionInput hidden" checked name="size">
					</div>
					<c:if test="${requestScope.sizes.size()>1}">
					    <c:forEach items="${requestScope.sizes}" var="size" varStatus="loop">
						<c:if test="${loop.index!=0}">
						    <div onclick="setQuantity('${size.inventory}')" class="productOption py-1 px-3 border-[1px] border-gray-300 text-gray-500  cursor-pointer mr-2 mb-2">
							<span>${size.name}</span>
							<input type="checkbox" value="${size.id}" class="productOptionInput hidden" name="size">
						    </div>
						</c:if>
					    </c:forEach>
					</c:if>
				    </div>
				</div>
			    </c:if>

			    <div class="mt-8 flex items-center">
				<div class="capitalize text-gray-500">Số lượng</div>
				<div class="ml-10 flex items-center">
				    <button type="button" onclick="descreseQuantity()" class="flex h-6 w-6 items-center justify-center rounded-l-sm border border-gray-300 text-gray-900 sm:h-8 sm:w-8">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-3 w-3 sm:h-4 sm:w-4"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 12h-15"></path></svg>
				    </button>
				    <div class="">
					<input id="quantityInput" contenteditable="false" type="number" name="quantity" class="hidden" value="1" />
					<div id="quantityPreview" class="rounded-none border-b border-t border-gray-300 p-1 text-center outline-none h-8 w-14"></div>
				    </div>
				    <button type="button" onclick="increaseQuantity()" class="flex h-6 w-6 items-center justify-center rounded-r-sm border border-gray-300 text-gray-900 sm:h-8 sm:w-8">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-3 w-3 sm:h-4 sm:w-4"><path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15"></path></svg>
				    </button>
				</div>
				<c:if test="${requestScope.sizes.size()>0}">
				    <div class="ml-6 text-sm text-gray-500"><span id="quantity">${requestScope.sizes[0].inventory}</span> sản phẩm có sẵn</div>
				</c:if>
			    </div>
			    <div class="mt-8 sm:flex sm:items-center sm:gap-x-4">
				<button id="addcartBtn" class="mt-3 border-[1px] border-blue-500 text-sm bg-blue-100 hover:bg-blue-50 flex h-12 w-full items-center justify-center rounded-sm border px-5 capitalize shadow-sm sm:w-auto">
				    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
				    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
				    </svg>
				    <span class="ml-2">Thêm vào giỏ hàng</span>
				</button>
				<button id="" type="button" class="mt-3 border-[1px] border-blue-500 hover:bg-blue-600 text-sm bg-blue-500 text-white flex h-12 w-full items-center justify-center rounded-sm border px-16 capitalize shadow-sm sm:w-auto">
				    <span>Mua ngay</span>
				</button>
			    </div>
			</form>
		    </div>
		</div>
	    </div>
	</div>

	<div class="my-5 container mx-auto max-w-[1250px] bg-white px-5">
	    <a href="shopPage?id=${requestScope.shop.id}">
		<div class="container mx-auto px-4 flex items-center cursor-pointer">
		    <div class="w-[100px] h-[100px] rounded-full overflow-hidden">
			<img class="h-full w-full object-cover" src="${requestScope.shop.avatar}" alt="alt"/>
		    </div>
		    <div class="bg-white p-6">
			<h1 class="text-2xl mb-4">${requestScope.shop.name}</h1>
			<div class="flex space-x-4">
			    <button class="hover:bg-blue-100 text-sm bg-blue-50 border-blue-500 border-[1px] text-blue-500 flex items-center justify-center py-2 px-4 rounded">
				<span>
				    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 mr-3">
				    <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 8.511c.884.284 1.5 1.128 1.5 2.097v4.286c0 1.136-.847 2.1-1.98 2.193-.34.027-.68.052-1.02.072v3.091l-3-3c-1.354 0-2.694-.055-4.02-.163a2.115 2.115 0 01-.825-.242m9.345-8.334a2.126 2.126 0 00-.476-.095 48.64 48.64 0 00-8.048 0c-1.131.094-1.976 1.057-1.976 2.192v4.286c0 .837.46 1.58 1.155 1.951m9.345-8.334V6.637c0-1.621-1.152-3.026-2.76-3.235A48.455 48.455 0 0011.25 3c-2.115 0-4.198.137-6.24.402-1.608.209-2.76 1.614-2.76 3.235v6.226c0 1.621 1.152 3.026 2.76 3.235.577.075 1.157.14 1.74.194V21l4.155-4.155" />
				    </svg>
				</span>
				<span>Chat Ngay</span>
			    </button>
			    <button class="bg-white hover:bg-slate-300 border-slate-300 border-[1px] py-2 px-4 flex items-center justify-center rounded text-gray-700">
				<span>
				    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 mr-3">
				    <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" />
				    </svg>
				</span>
				<span>Xem Shop</span>
			    </button>
			</div>
		    </div>
		</div>
	    </a>
	</div>


	<div class="my-5 container mx-auto max-w-[1250px] bg-white p-5">
	    <h1 class="p-3 bg-slate-50 font-medium">CHI TIẾT SẢN PHẨM</h1>
	    <div class="p-5 pb-0">
		<table class="">
		    <tbody>
			<tr class="text-left">
			    <th class="p-2 pl-0">Màu sắc</th>
			    <td class="p-2">${requestScope.productColor.name}</td>
			</tr>
			<tr class="text-left">
			    <th class="p-2 pl-0">Danh mục</th>
			    <td class="p-2">${requestScope.productCategory.name}</td>
			</tr>
		    </tbody>
		</table>
	    </div>
	    <h1 class="p-3 mt-5 bg-slate-50 font-medium">MÔ TẢ SẢN PHẨM</h1>
	    <div class="p-5">
		${requestScope.product.description}
	    </div>
	</div>

	<div class="my-5 container mx-auto max-w-[1250px] bg-white p-5">
	    <h1 class="bg-white font-medium">ĐÁNH GIÁ SẢN PHẨM</h1>
	    <div class="p-6">
		<c:forEach items="${requestScope.rates}" var="rate">
		    <span>${rate.id}</span>
		</c:forEach>
	    </div>

	</div>

	<%@include file="./components/footer.jsp" %>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script>
					$('.autoplay').slick({
					    slidesToShow: 5,
					    slidesToScroll: 2,
					    autoplaySpeed: 2000,
					    prevArrow: $('.custom-prev'),
					    nextArrow: $('.custom-next')
					});
					fetch(url, {
					    method: 'POST',
					    cache: 'no-cache'
					});
	</script>
	<script src="./static/js/detail.js"></script>
	<script>
					if (document.querySelector('#editor') !== null) {
					    ClassicEditor
						    .create(document.querySelector('#editor'), {
							ckfinder: {
							    uploadUrl: '/upload-image'
							}
						    })
						    .catch(error => {
							console.error(error);
						    });
					}
	</script>
    </body>
</html>
