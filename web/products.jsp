<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vietqtran.model.Product" %>
<%@page import="java.text.DecimalFormat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru | Products</title>
        <link rel="icon" href="./static/logo/icon-logo.png" type="image/png" sizes="32x32">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
	<%@include file="./components/header.jsp" %>
	<div class="bg-slate-200 pb-10  border-b-4 border-blue-500">
	    <div class="container mx-auto max-w-[1250px] px-2">
		<form  id="filter" action="products" method="GET" class="container mx-auto grid grid-cols-10">
		    <div class="col-span-10 sm:col-span-3 lg:col-span-2">
			<div>
			    <div class="py-4 pr-3">
				<div class="text-primary flex items-center text-sm font-semibold">
				    <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="mr-3 h-4 w-3 fill-current stroke-current">
				    <g><polyline fill="none" points="5.5 13.2 5.5 5.8 1.5 1.2 13.5 1.2 9.5 5.8 9.5 10.2" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10"></polyline></g>
				    </svg>
				    BỘ LỌC TÌM KIẾM
				</div>
				<div class="border-b-[1px] border-slate-300 pb-5">
				    <span class="mb-2 mt-5 block">Theo Danh Mục</span>
				    <c:forEach items="${requestScope.categories}" var="category">
					<div class="flex items-center justify-start pb-2">
					    <input onchange="handleCheckCid(this)" ${requestScope.cid==category.id?'checked':''} type="checkbox" value="${category.id}" name="cid" class="mr-2 category" id="category${category.id}"/>
					    <label for="category${category.id}">${category.name}</label>
					</div>
				    </c:forEach>
				</div>

				<div class="border-b-[1px] border-slate-300 pb-5">
				    <span class="mb-2 mt-5 block">Màu Sắc</span>
				    <c:forEach items="${requestScope.colors}" var="color">
					<div class="flex items-center justify-start pb-2">
					    <input onchange="handleCheckClid(this)" ${requestScope.clid==color.id?'checked':''} type="checkbox" value="${color.id}" name="clid" class="mr-2 color" id="color${color.id}"/>
					    <label for="color${color.id}">${color.name}</label>
					</div>
				    </c:forEach>
				</div>

				<div class="border-b-[1px] border-slate-300 pb-8 pt-3">
				    <span class="mb-2 mt-2 block">Khoảng Giá</span>
				    <div class="flex items-center">
					<div class="grow">
					    <input type="text" placeholder="₫ TỪ" class="w-full rounded-sm border border-gray-300 p-1 text-sm outline-none focus:border-gray-500 focus:shadow-sm" name="min" value="${requestScope.min}" />
					    <div class="hidden"></div>
					</div>
					<div class="mx-2 shrink-0">-</div>
					<div class="grow">
					    <input type="text" placeholder="₫ ĐẾN" class="w-full rounded-sm border border-gray-300 p-1 text-sm outline-none focus:border-gray-500 focus:shadow-sm" name="max" value="${requestScope.max}" />
					    <div class="hidden"></div>
					</div>
				    </div>
				    <div class="mt-1 min-h-[24px] py-4 text-center text-xs text-red-600">Vui lòng điền khoảng giá phù hợp</div>
				    <div><button type="button" class="bg-primary bg-primary hover:bg-primary/80 flex w-full items-center justify-center bg-[#0261d6] py-2 text-center text-xs text-white hover:bg-blue-600">ÁP DỤNG</button></div>
				</div>
				<input type="text" name="name" value="${requestScope.search}" class="hidden">
				<div class="border-b-[1px] border-slate-300 pb-6 pt-5">
				    <div class="pb-3">Đánh giá</div>
				    <input id="starInput" type="text" class="hidden" name="star" value="${requestScope.rate}">
				    <button type="button" onclick="changeStar(5)" class="flex items-center justify-start">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
				    </button>
				    <button type="button" onclick="changeStar(4)" class="flex items-center justify-start">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
					</svg>
					<span class="ml-1 text-sm">trở lên</span>
				    </button>
				    <button type="button" onclick="changeStar(3)" class="flex items-center justify-start">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
					</svg>
					<span class="ml-1 text-sm">trở lên</span>
				    </button>
				    <button type="button" onclick="changeStar(2)" class="flex items-center justify-start">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
					</svg>
					<span class="ml-1 text-sm">trở lên</span>
				    </button>
				    <button type="button" onclick="changeStar(1)" class="flex items-center justify-start">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-[2px] h-4 w-4 text-yellow-500">
					<path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
					</svg>
					<span class="ml-1 text-sm">trở lên</span>
				    </button>
				</div>
				<div><button type="submit" class="bg-primary bg-primary hover:bg-primary/80 mt-5 flex w-full items-center justify-center bg-[#0261d6] py-2 text-center text-xs text-white hover:bg-blue-600">XÓA TẤT CẢ</button></div>
			    </div>
			</div>
		    </div>

		    <div class="col-span-10 mt-5 sm:col-span-7 lg:col-span-8">
			<div class="bg-gray-300/40 py-4 px-3 mb-5">
			    <div class="flex items-center justify-between gap-2 flex-wrap">
				<div class="flex items-center flex-wrap gap-2">
				    <div>Sắp xếp theo</div>
				    <input type="text" name="sortby" class="hidden" value="${requestScope.sortby}" id="sortby">
				    <span onclick="setOrder('rate')" class="h-8 px-4 text-center text-sm capitalize  flex items-center ${param.sort.equals('rate')?'bg-blue-500 text-white hover:bg-blue-600':'hover:bg-primary/80 text-black hover:bg-slate-100 bg-white'}">
					Đánh Giá</span>
				    <span onclick="setOrder('newest')" class="h-8 px-4 text-center text-sm capitalize  flex items-center ${param.sort.equals('newest')?'bg-blue-500 text-white hover:bg-blue-600':'hover:bg-primary/80 text-black hover:bg-slate-100 bg-white'}">
					Mới nhất</span>
				    <span onclick="setOrder('sellWell')" class="h-8 px-4 text-center text-sm capitalize  flex items-center ${param.sort.equals('sellWell')?'bg-blue-500 text-white hover:bg-blue-600':'hover:bg-primary/80 text-black hover:bg-slate-100 bg-white'}">
					Bán chạy</span>
				    <div class="before:content-[''] before:absolute before:w-full before:py-4 before:bg-black before:top-[50%] before:opacity-0 before:z-0 before:left-0 group h-8 px-4 text-left text-sm capitalize outline-none bg-white text-black hover:bg-slate-100 relative w-[200px] flex items-center">
					<div class="flex items-center justify-between w-full">
					    <span class="text-left">
						<c:if test="${param.sortby.equals('descPrice')}">
						    Giá: Cao đến thấp
						</c:if>
						<c:if test="${param.sortby.equals('ascPrice')}">
						    Giá: Thấp đến cao
						</c:if>
						<c:if test="${!param.sortby.equals('ascPrice') && !param.sort.equals('descPrice')}">
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
					    <span onclick="setOrder('ascPrice')" class="bg-white text-black hover:bg-slate-100 block px-4 h-8 flex items-center">Giá: Thấp đến cao</span>
					    <span onclick="setOrder('descPrice')" class="bg-white text-black hover:bg-slate-100 block px-4 h-8 flex items-center">Giá: Cao đến thấp</span>
					</div>
				    </div>
				</div>
			    </div>
			</div>
			<div class="grid w-full grid-cols-2 gap-3 md:grid-cols-3 lg:grid-cols-5">
			    <c:forEach items="${requestScope.products}" var="product">
				<div class="col-span-1">
				    <a href="productDetail?id=${product.id}">
					<div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
					    <div class="relative w-full pt-[100%]">
						<img src="${product.url}" alt="" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
					    <div class="overflow-hidden p-2">
						<div class="line-clamp-2 min-h-[2rem] text-xs">${product.name}</div>
						<div class="mt-3 flex items-center justify-start gap-x-1">
						    <c:if test="${product.salePrice!=0}">
							<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">
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
						    <div class="flex gap-x-1 text-xs"><span>${product.boughtQuantity}</span><span>Đã bán</span></div>
						</div>
						<div class="flex gap-x-1 text-xs mt-2"><span>${product.city}</span></div>
					    </div>
					</div>
				    </a>
				</div>
			    </c:forEach>
			</div>

			<div class="mt-6 flex flex-wrap justify-center">
			    <c:if test="${requestScope.currentPage>1}">
				<a href="?page=${requestScope.currentPage-1}&cid=${param.cid}&clid=${param.clid}&min=${param.min}&max=${param.max}&star=${param.star}">Previous</a>
			    </c:if>

			    <c:if test="${requestScope.currentPage<Math.ceil(requestScope.productsSize/60)}">
				<a href="?page=${requestScope.currentPage+1}&cid=${param.cid}&clid=${param.clid}&min=${param.min}&max=${param.max}&star=${param.star}">Next</a>
			    </c:if>
			</div>
		    </div>
		</form>
	    </div>
	</div>
	<%@include file="./components/footer.jsp" %>

	<script>

	    const form = document.getElementById("filter")
	    function submitForm() {
		form.submit()
	    }

	    const categories = document.getElementsByClassName("category")
	    function handleCheckCid(c) {
		if (!c.checked == true) {
		    c.checked = false
		    submitForm()
		} else {
		    for (var i = 0; i < categories.length; i++) {
			categories[i].checked = false
		    }
		    c.checked = true
		    submitForm()
		}
	    }
	    const colors = document.getElementsByClassName("color")
	    function handleCheckClid(c) {
		if (!c.checked == true) {
		    c.checked = false
		    submitForm()
		} else {
		    for (var i = 0; i < colors.length; i++) {
			colors[i].checked = false
		    }
		    c.checked = true
		    submitForm()
		}
	    }


	    const starInput = document.getElementById("starInput")
	    function changeStar(value) {
		starInput.value = value
		submitForm()
	    }

	    const sortInput = document.getElementById("sortby")
	    function setOrder(value) {
		sortInput.value = value;
		submitForm()
	    }

	</script>
    </body>
</html>
