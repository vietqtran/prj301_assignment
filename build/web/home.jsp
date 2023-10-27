<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vietqtran.model.Product" %>
<%@page import="java.text.DecimalFormat" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru | Home</title>
        <link rel="icon" href="./static/logo/icon-logo.png" type="image/png" sizes="32x32">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>

	<%@include file="./components/header.jsp" %>

	<div class="bg-slate-200 py-10  border-b-4 border-blue-500">
	    <div class="container mx-auto max-w-[1250px] px-2">
		<div class="container mx-auto grid lg:grid-cols-6 gap-3 md:grid-cols-5 sm:grid-cols-4 grid-cols-2">

		    <div class="flex items-center justify-center slide w-full my-2 bg-white lg:col-span-6 md:col-span-5 sm:col-span-4 col-span-2">
			<div class="w-full h-full mx-2">
			    <img src="./static/images/bannerHome/banner1.jpg" class="h-full w-full cursor-pointer bg-white object-cover" alt="alt"/>
			</div>
			<div class="w-full h-full mx-2">
			    <img src="./static/images/bannerHome/banner2.jpg" class="h-full w-full cursor-pointer bg-white object-cover" alt="alt"/>
			</div>
			<div class="w-full h-full mx-2">
			    <img src="./static/images/bannerHome/banner3.jpg" class="h-full w-full cursor-pointer bg-white object-cover" alt="alt"/>
			</div>
			<div class="w-full h-full mx-2">
			    <img src="./static/images/bannerHome/banner4.jpg" class="h-full w-full cursor-pointer bg-white object-cover" alt="alt"/>
			</div>
			<div class="w-full h-full mx-2">
			    <img src="./static/images/bannerHome/banner5.jpg" class="h-full w-full cursor-pointer bg-white object-cover" alt="alt"/>
			</div>
			<div class="w-full h-full mx-2">
			    <img src="./static/images/bannerHome/banner6.jpg" class="h-full w-full cursor-pointer bg-white object-cover" alt="alt"/>
			</div>
			<div class="w-full h-full mx-2">
			    <img src="./static/images/bannerHome/banner7.jpg" class="h-full w-full cursor-pointer bg-white object-cover" alt="alt"/>
			</div>
			<div class="w-full h-full mx-2">
			    <img src="./static/images/bannerHome/banner8.jpg" class="h-full w-full cursor-pointer bg-white object-cover" alt="alt"/>
			</div>
			<div class="w-full h-full mx-2">
			    <img src="./static/images/bannerHome/banner9.jpg" class="h-full w-full cursor-pointer bg-white object-cover" alt="alt"/>
			</div>
			<div class="w-full h-full mx-2">
			    <img src="./static/images/bannerHome/banner10.jpg" class="h-full w-full cursor-pointer bg-white object-cover" alt="alt"/>
			</div>
		    </div>


		    <div class="bg-gray-300/40 w-full py-4 mb-5 px-3 lg:col-span-6 md:col-span-5 sm:col-span-4 col-span-2">
			<div class="flex flex-wrap items-center justify-between gap-2">
			    <div class="flex flex-wrap items-center gap-2">
				<div>Sắp xếp theo</div>
				<a href="?sort=rate" class="h-8 px-4 text-center text-sm capitalize  flex items-center ${param.sort.equals('rate')?'bg-blue-500 text-white hover:bg-blue-600':'hover:bg-primary/80 text-black hover:bg-slate-100 bg-white'}">Đánh Giá</a>
				<a href="?sort=newest" class="h-8 px-4 text-center text-sm capitalize  flex items-center ${param.sort.equals('newest')?'bg-blue-500 text-white hover:bg-blue-600':'hover:bg-primary/80 text-black hover:bg-slate-100 bg-white'}">Mới nhất</a>
				<a href="?sort=sellWell" class="h-8 px-4 text-center text-sm capitalize  flex items-center ${param.sort.equals('sellWell')?'bg-blue-500 text-white hover:bg-blue-600':'hover:bg-primary/80 text-black hover:bg-slate-100 bg-white'}">Bán chạy</a>
				<div class="before:content-[''] before:absolute before:w-full before:py-4 before:bg-black before:top-[50%] before:opacity-0 before:z-0 before:left-0 group h-8 px-4 text-left text-sm capitalize outline-none bg-white text-black hover:bg-slate-100 relative w-[200px] flex items-center">
				    <div class="flex items-center justify-between w-full">
					<span class="text-left">
					    <c:if test="${param.sort.equals('descPrice')}">
						Giá: Cao đến thấp
					    </c:if>
					    <c:if test="${param.sort.equals('ascPrice')}">
						Giá: Thấp đến cao
					    </c:if>
					    <c:if test="${!param.sort.equals('ascPrice') && !param.sort.equals('descPrice')}">
						Giá
					    </c:if>
					</span>
					<span class="text-left">
					    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
					    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
					    </svg>
					</span>
				    </div>
				    <div class="absolute top-[calc(100%+5px)] left-0 w-[200px] py-2 bg-white hidden group-hover:block z-50 shadow-md">
					<a href="?sort=ascPrice" class="bg-white text-black hover:bg-slate-100 block px-4 h-8 flex items-center">Giá: Thấp đến cao</a>
					<a href="?sort=descPrice" class="bg-white text-black hover:bg-slate-100 block px-4 h-8 flex items-center">Giá: Cao đến thấp</a>
				    </div>
				</div>
			    </div>
			</div>
		    </div>
		    <c:forEach items="${requestScope.products}" var="product">
			<div class="col-span-1">
			    <a href="productDetail?id=${product.id}">
				<div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				    <div class="relative w-full pt-[100%]">
					<img src="${product.url}" alt=""
					     class="absolute left-0 top-0 h-full w-full bg-white object-cover"/></div>
				    <div class="overflow-hidden p-2">
					<div class="line-clamp-2 min-h-[2rem] text-xs">${product.name}</div>
					<div class="mt-3 flex items-center justify-start gap-x-1">
					    <c:if test="${product.salePrice!=0}">
						<div class="max-w-[50%] truncate text-gray-500 line-through"><span
							class="text-xs">
							₫</span><span class="text-sm">${DecimalFormat("###,###").format(product.price)}</span>
						</div>
						<div class="text-primary truncate text-blue-500"><span class="text-xs">
							₫</span><span class="text-[16px] text-sm">${DecimalFormat("###,###").format(product.salePrice)}</span>
						</div>
					    </c:if>
					    <c:if test="${product.salePrice==0}">
						<div class="text-primary truncate text-blue-500"><span class="text-xs">
							₫</span><span class="text-[16px] text-sm">${DecimalFormat("###,###").format(product.price)}</span>
						</div>
					    </c:if>
					</div>
					<div class="mt-3 flex items-center justify-start gap-x-2">
					    <div class="flex items-center justify-start relative w-[50px]">
						<img src="./static/images/stars-gray.png" alt="alt" class="w-full absolute z-40 left-0"/>
						<%
						    Product product = (Product) pageContext.getAttribute("product");
						    double star = (product.getRate() / 5) * 100;
						    String starPercentage = star + "%";
						%>
						<div class="overflow-hidden absolute z-50 left-0" style="width: <%= starPercentage %>">
						    <img src="./static/images/star-yellow.png" alt="alt" class="min-w-[50px]"/>
						</div>
					    </div>
					    <div class="flex gap-x-1 text-xs">
						<span>${product.boughtQuantity}</span><span>Đã bán</span></div>
					</div>
				    </div>
				</div>
			    </a>
			</div>
		    </c:forEach>
		</div>
	    </div>
	</div>
	<%@include file="./components/footer.jsp" %>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script>
	    $('.slide').slick({
		autoplay: true,
		autoplaySpeed: 1500,
		arrows: true,
		centerMode: true,
		slidesToShow: 1,
		slidesToScroll: 1,
		prevArrow: false,
		nextArrow: false
	    });
	</script>
    </body>
</html>
