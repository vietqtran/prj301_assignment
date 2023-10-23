<%-- 
    Document   : shop
    Created on : Oct 6, 2023, 11:29:26 AM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="vietqtran.model.OrderProduct" %>
<%@ page import="vietqtran.model.Order" %>
<%@ page import="vietqtran.model.Shop" %>
<%@ page import="vietqtran.model.ShipCompany" %>
<%@ page import="vietqtran.model.Product" %>
<%@ page import="vietqtran.services.OrderProductDAO" %>
<%@ page import="vietqtran.services.ProductDAO" %>
<%@ page import="vietqtran.services.ShopDAO" %>
<%@ page import="vietqtran.services.ShipCompanyDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru | Shop Dashboard</title>
        <link rel="icon" href="./static/logo/icon-logo.png" type="image/png" sizes="32x32">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
    </head>
    <body class="flex">

	<aside id="sidebar" class="hide md:sticky fixed top-0 left-0 h-screen w-[300px] bg-[#0261d6] z-40">
	    <div id="navHeader" class="p-6">
		<a href="shop-dashboard" class="text-white font-semibold flex items-center justify-center uppercase hover:text-gray-300">
		    <img class="w-[50px] rounded-md mr-3 " src="./static/logo/white-logo.png" alt="alt"/>
		    <span class="text-xl">Shop</span>
		</a>
	    </div>
	    <div id="avatar" class="w-full flex items-center justify-center flex-col">
		<img src="${sessionScope.shop.avatar}" class="aspect-square w-[50%] object-cover rounded-full border-white border-[1px]" alt="alt"/>   
		<span class="mt-3 text-white font-medium">${sessionScope.shop.name}</span>
	    </div>
	    <nav id="nav" class="text-white text-base font-semibold pt-3 overflow-hidden">
		<a href="shop-dashboard?tab=dashboard" class="${requestScope.tab.equals('dashboard')?'text-[#0261d6] bg-white':''} flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V8.625zM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V4.125z" />
			</svg>
		    </div>
		    <div>
			<div>Dashboard</div>
		    </div>
		</a>
		<a href="shop-dashboard?tab=products" class="${requestScope.tab.equals('products')?'text-[#0261d6] bg-white':''} flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M6.429 9.75L2.25 12l4.179 2.25m0-4.5l5.571 3 5.571-3m-11.142 0L2.25 7.5 12 2.25l9.75 5.25-4.179 2.25m0 0L21.75 12l-4.179 2.25m0 0l4.179 2.25L12 21.75 2.25 16.5l4.179-2.25m11.142 0l-5.571 3-5.571-3" />
			</svg>
		    </div>
		    <div>
			<span>Products</span>
		    </div>
		</a>
		<a href="shop-dashboard?tab=orders"
		   class="${requestScope.tab.equals('orders')?'text-[#0261d6] bg-white':''} flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M3.75 12h16.5m-16.5 3.75h16.5M3.75 19.5h16.5M5.625 4.5h12.75a1.875 1.875 0 010 3.75H5.625a1.875 1.875 0 010-3.75z" />
			</svg>
		    </div>
		    <div>
			<span>Orders</span>
		    </div>
		</a>
		<a href="shop-dashboard?tab=profile"
		   class="${requestScope.tab.equals('profile')?'text-[#0261d6] bg-white':''} flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
			     stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"/>
			</svg>
		    </div>
		    <div>
			<span>Profile</span>
		    </div>
		</a>
		<a href="shop-dashboard?tab=changePassword"
		   class="${requestScope.tab.equals('changePassword')?'text-[#0261d6] bg-white':''} flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
			     stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z"/>
			</svg>
		    </div>
		    <div>
			<span>Change Password</span>
		    </div>
		</a>
		<a href="check?action=logoutShop" class="flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9" />
			</svg>
		    </div>
		    <div>
			<span>Logout</span>
		    </div>
		</a>
	    </nav>
	    <div onclick="toggleSidebar()" class="absolute p-3 drop-shadow-lg cursor-pointer rounded-full right-[-16px] top-[50px] translate-y-[-50%] bg-slate-100 ">
		<div id="arrow-left">
		    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-3 h-3">
		    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
		    </svg>
		</div>
		<div id="arrow-right">
		    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-3 h-3">
		    <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
		    </svg>
		</div>
	    </div>
	</aside>



	<c:if test="${requestScope.tab.equals('dashboard')}">
	    <div class="container mx-auto p-10">
		<div class="rounded-sm bg-white px-2 pb-10 md:px-7 md:pb-20 container mx-auto">
		    <div class="grid lg:grid-cols-6 md:grid-cols-3 gap-4 grid-cols-2">
			<div class="col-span-1 p-5 shadow-lg rounded-md">
			    <h1 class="font-bold text-xl">Profit</h1>
			    <span class="text-xl pt-3 block">100</span>
			</div>
			<div class="col-span-1 p-5 shadow-lg rounded-md">
			    <h1 class="font-bold text-xl">Revenue</h1>
			    <span class="text-xl pt-3 block">100</span>
			</div>
			<div class="col-span-1 p-5 shadow-lg rounded-md">
			    <h1 class="font-bold text-xl">Expense</h1>
			    <span class="text-xl pt-3 block">100</span>
			</div>
			<div class="col-span-1 p-5 shadow-lg rounded-md">
			    <h1 class="font-bold text-xl">Orders</h1>
			    <span class="text-xl pt-3 block">100</span>
			</div>
			<div class="col-span-1 p-5 shadow-lg rounded-md">
			    <h1 class="font-bold text-xl">Products</h1>
			    <span class="text-xl pt-3 block">100</span>
			</div> 
			<div class="col-span-1 p-5 shadow-lg rounded-md">
			    <h1 class="font-bold text-xl">Vouchers</h1>
			    <span class="text-xl pt-3 block">100</span>
			</div>
		    </div>
		    <div class="mt-10 grid md:grid-cols-3 gap-4">
			<div class="col-span-1">
			    <canvas id="soldChart"></canvas>
			</div>
			<div class="col-span-2">
			    <canvas id="myChart"></canvas>
			</div>
		    </div>
		</div>
	    </div>
	</c:if>
	<!--product-->
	<c:if test="${requestScope.tab.equals('products')}">
	    <div class="p-5 w-full flex flex-col">
		<div class="border-b-[1px] border-gray-500 pb-5 flex items-center justify-between">
		    <form action="shopProduct" method="GET" class="flex w-fit items-center justify-start p-3 border-slate-400 border-[1px] rounded-md">
			<div class="mr-2">
			    <input name="id" type="text" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-[100px] p-2" placeholder="ID">
			</div> 
			<div class="mr-2">
			    <input name="name" type="text" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" placeholder="Product Name">
			</div>
			<div class="mr-2 flex">
			    <input name="min" type="number" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full w-[100px] p-2 mr-2" placeholder="Min Price">
			    <input name="max" type="number" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full w-[100px] p-2" placeholder="Max Price">			
			</div> 
			<div class="mr-2">
			    <input name="date" type="date" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" placeholder="Create From">
			</div>			
			<div class="mr-2">
			    <select name="color" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" >
				<option value="" class="py-2" selected disabled>Color</option>
				<c:forEach items="${requestScope.colors}" var="color">
				    <option value="${color.id}">${color.name}</option>
				</c:forEach>
			    </select>
			</div>  
			<div class="mr-2">
			    <select name="category" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" >
				<option value="" class="py-2" selected disabled>Category</option>
				<c:forEach items="${requestScope.categories}" var="category">
				    <option value="${category.id}">${category.name}</option>
				</c:forEach>
			    </select>
			</div>  
			<button type="submit" class="py-2 px-3 bg-blue-500 hover:bg-blue-600 text-white rounded-md flex items-center justify-center">
			    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
			    <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
			    </svg>
			    <span class="ml-2">Search</span>
			</button>
		    </form>
		    <div>
			<button onclick="toggleAdduserModal()" type="button" class="py-2 px-3 bg-blue-500 hover:bg-blue-600 text-white rounded-md flex items-center justify-center">
			    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
			    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
			    </svg>
			    <span class="ml-2">Add Product</span>
			</button>
		    </div>
		</div>
		<div class="w-full relative overflow-x-auto mt-10">
		    <table class="table-auto w-full divide-y divide-x divide-gray-200 border-collapse text-sm whitespace-normal">
			<thead class="sticky top-0 bg-white">
			    <tr class="border border-gray-200">
				<th scope="col" class="border border-gray-200 p-2 truncate">ID</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Name</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Price</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Sale Price</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Rate</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Create Date</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Color</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Category</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Sold</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Image</th>
			    </tr>
			</thead>
			<tbody>
			    <c:forEach items="${requestScope.products}" var="product">
				<tr class="border border-gray-200" 
				    data-product-id="${product.id}"
				    data-product-name="${product.name}"
				    data-product-price="${product.price}"
				    data-product-salePrice="${product.salePrice}"
				    data-product-rate="${product.rate}"
				    data-product-createDate="${product.createDate}"
				    data-product-color="${product.color}"
				    data-product-salePrice="${product.salePrice}"
				    data-product-categoryId="${product.categoryId}"
				    data-product-url="${product.url}"
				    data-product-shop="${product.shopId}"
				    > 
				    <td class="border border-gray-200 p-2 w-auto truncate">${product.id}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${product.name} </td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${Math.round(product.price)}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${Math.round(product.salePrice)}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${product.rate}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${product.createDate}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">
					<c:forEach items="${requestScope.colors}" var="color">
					    <c:if test="${product.color==color.id}">
						${color.name} <span class="w-[20px] h-[20px] border-[1px] border-slate-200 block bg-[${color.code}]"></span>
					    </c:if>
					</c:forEach>
				    </td>
				    <td class="border border-gray-200 p-2 w-auto truncate">
					<c:forEach items="${requestScope.categories}" var="category">
					    <c:if test="${product.categoryId==category.id}">
						${category.name}
					    </c:if>
					</c:forEach>
				    </td>
				    <td>${product.boughtQuantity}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">
					<c:if test="${!product.url.equals('')}">
					    <img src="${product.url}" class="w-[100px] h-[100px] object-cover" alt="alt"/>
					</c:if>
				    </td>
				    <td class=" p-2 h-full w-auto flex flex-col items-center justify-center"">
					<a href="check?action=deleteProduct&id=${product.id}" class="block truncate text-xs flex items-center py-2 text-white hover:bg-red-600 px-3 bg-red-500 w-fit rounded-md mx-1">
					    <span>
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
						<path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
						</svg>
					    </span>
					    <span class="hidden md:block ml-2">Delete</span>					    
					</a>
					<button
					    onclick="handleViewProduct(this)"
					    class=" truncate text-xs flex items-center py-2 text-white hover:bg-blue-600 px-3 bg-blue-500 w-fit rounded-md mx-1 mt-2">
					    <span>
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
						<path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
						<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
						</svg>
					    </span>
					    <span class="hidden md:block ml-2">View</span>
					</button>
					<a
					    href="edit-product?sid=${sessionScope.shop.id}&id=${product.id}"
					    target="_blank"
					    class=" truncate text-xs flex items-center py-2 text-white hover:bg-green-600 px-3 bg-green-500 w-fit rounded-md mx-1 mt-2">
					    <span>
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-5">
						<path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" />
						</svg>
					    </span>
					    <span class="hidden md:block ml-2">Edit</span>
					</a>
				    </td>
				</tr>
			    </c:forEach>
			</tbody>
		    </table>
		</div>
	    </div>
	</c:if>
<!--

	<c:if test="${requestScope.tab.equals('orders')}">
	    <div id="orders" class="tab w-full bg-white py-5 md:px-0 px-10">
		<div class="container mx-auto w-full">
		    <div class="w-full">
			<h1 class="flex items-center justify-start py-2">
			    <span>
				<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 mr-3">
				<path stroke-linecap="round" stroke-linejoin="round" d="M10.5 6h9.75M10.5 6a1.5 1.5 0 11-3 0m3 0a1.5 1.5 0 10-3 0M3.75 6H7.5m3 12h9.75m-9.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-3.75 0H7.5m9-6h3.75m-3.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-9.75 0h9.75" />
				</svg>
			    </span>
			    <span>Filter orders</span>
			</h1>
			<form action="search-order" method="GET" class="flex flex-wrap w-fit items-center justify-between w-full p-3 border-slate-400 border-[1px] rounded-md">
			    <div class="mr-5 flex items-center">
				<label class="mr-3">ID: </label>
				<input value="${requestScope.id}" name="id" type="text" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-[100px] p-2" placeholder="ID">
			    </div> 
			    <div class="mr-5 flex items-center">
				<label class="mr-3 whitespace-nowrap">Total price: </label>
				<input value="${requestScope.min}" name="min" type="number" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full max-w-[150px] block p-2 mr-2" placeholder="Min Price">
				<input value="${requestScope.max}" name="max" type="number" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full max-w-[150px] block p-2" placeholder="Max Price">			
			    </div> 
			    <div class="mr-5 flex items-center">
				<label class="mr-3 whitespace-nowrap">Order from: </label>
				<input name="date" value="${requestScope.date}" type="date" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" placeholder="Create From">
			    </div>			
			    <div class="mr-2 flex items-center mr-5">
				<label class="mr-3">Status: </label>
				<select name="status" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" >
				    <option value="" class="py-2" selected>All Orders</option>
				    <option ${requestScope.status.equals('waitForConfirmation')?'selected':''} value="waitForConfirmation" class="py-2">Wait For Confirmation</option>
				    <option ${requestScope.status.equals('waitingForDelivery')?'selected':''} value="waitingForDelivery" class="py-2">Wait For Delivery</option>
				    <option ${requestScope.status.equals('delivering')?'selected':''} value="delivering" class="py-2">Delivering</option>
				    <option ${requestScope.status.equals('delivered')?'selected':''} value="delivered" class="py-2">Delivered</option>
				    <option ${requestScope.status.equals('canceled')?'selected':''} value="canceled" class="py-2">Canceled</option>
				</select>
			    </div>  
			    <div class="mr-2 flex items-center mr-5">
				<label class="mr-3 whitespace-nowrap">Ship Unit: </label>
				<select name="ship" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" >
				    <option value="" class="py-2" selected>All</option>
				    <c:forEach items="${requestScope.ships}" var="s">
					<option ${requestScope.ship==s.id?'selected':''} value="${s.id}" class="py-2">${s.name}</option>
				    </c:forEach>
				</select>
			    </div>  
			    <button type="submit" class="py-2 px-3 bg-blue-500 hover:bg-blue-600 text-white rounded-md flex items-center justify-center">
				<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
				<path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
				</svg>
				<span class="ml-2">Search</span>
			    </button>
			</form>
		    </div>
		    <c:if test="${requestScope.orders.size()>0}">
			<c:forEach items="${requestScope.orders}" var="o">
			    <%
				Order order = (Order) pageContext.getAttribute("o");
				OrderProductDAO orderProductDao = new OrderProductDAO();
				List<OrderProduct> products = orderProductDao.getByOrderId(order.getId());
			    %>
			    <div class="mt-4 rounded-sm v-dropshadow bg-white text-gray-800">
				<div class="text-sm py-4 px-6 v-dropshadow">
				    ID: ${o.id}
				</div>
				<c:forEach items="<%=products%>" var="p">
				    <%
					OrderProduct orderProduct = (OrderProduct) pageContext.getAttribute("p");
					ProductDAO productDao = new ProductDAO();
					Product product = productDao.get(orderProduct.getProductId());
				    %>
				    <div class="flex p-6">
					<div class="flex-shrink-0">
					    <img class="h-20 w-20 object-cover" src="${p.imageUrl}" alt="Điện Thoại Realme C11 (2GB/32GB) - Hàng Chính Hãng" />
					</div>
					<div class="ml-3 flex-grow overflow-hidden">
					    <div class="">ID: <%=product.getId()%></div>
					    <div class="truncate mt-1"><%=product.getName()%></div>
					    <div class="mt-1">x${p.quantity}</div>
					</div>
					<c:if test="${p.salePrice>0}">
					    <div class="ml-3 flex-shrink-0">
						<span class="truncate text-gray-500 line-through">₫${p.productPrice}</span>
						<span class="text-primary ml-2 truncate">₫${p.salePrice}</span>
					    </div>
					</c:if>
					<c:if test="${p.salePrice<=0}">
					    <div class="ml-3 flex-shrink-0">
						<span class="text-primary ml-2 truncate">₫${p.productPrice}</span>
					    </div>
					</c:if>
				    </div>
				</c:forEach>
				<%
				    ShipCompanyDAO shipDao = new ShipCompanyDAO();
				    ShipCompany ship = shipDao.get(order.getShipperId());
				%>
				<div class="flex items-start justify-between p-6 border-t-[1px] bg-[#fffefb]">
				    <div class="w-[50%]">
					<c:if test="${!o.note.equals('')}">
					    Lưu ý: ${o.note}
					</c:if>
				    </div>
				    <div class="flex items-end flex-col ">
					<div class="w-fit">
					    <div class="text-sm w-full flex items-center justify-between mb-3">
						<span>Đơn vị vận chuyển: </span>
						<span class="text-primary ml-4"><%=ship.getName()%></span>
					    </div>
					    <div class="text-sm w-full flex items-center justify-between mb-3">
						<span>Phí ship: </span>
						<span class="text-primary ml-4">₫<%=ship.getPrice()%></span>
					    </div>
					    <div class="w-full flex items-center justify-between">
						<span>Tổng giá tiền</span>
						<span class="text-blue-500 ml-4 text-xl">₫${o.totalPrice}</span>
					    </div>
					</div>
					<div class="pt-5">
					    <c:if test="${o.status.equals('waitForConfirmation')}">
						<button>
						    <a href="order-status?orderId=${o.id}&status=waitingForDelivery" class="py-2 rounded-sm px-5 block bg-blue-600 text-xs hover:bg-blue-500 text-white">Confirm</a>
						</button>
					    </c:if>
					    <c:if test="${o.status.equals('waitingForDelivery')}">
						<button>
						    <a href="order-status?orderId=${o.id}&status=delivering" class="py-2 rounded-sm px-5 block bg-blue-600 text-xs hover:bg-blue-500 text-white">Delivery</a>
						</button>
					    </c:if>
					    <c:if test="${o.status.equals('delivering')}">
						<span class="text-red-500">Delivering...</span>
					    </c:if>
					    <c:if  test="${o.status.equals('delivered')}">
						<span class="text-blue-500">Successful</span>
					    </c:if>
					</div>
				    </div>
				</div>
			    </div>
			</c:forEach>
		    </c:if>
		</div>
	    </div>
	</c:if>
-->


	<c:if test="${requestScope.tab.equals('profile')}">
	    <div class="container mx-auto px-10">
		<div class="container mx-auto">
		    <div class="border-b border-b-gray-200 py-6">
			<h1 class="text-lg font-medium capitalize text-gray-900">My Profile</h1>
		    </div>
		    <div class="mt-8 flex flex-col-reverse md:flex-row md:items-start">
			<form method="POST" action="shop-dashboard" class="mt-6 flex-grow md:mt-0 md:pr-12 pb-10">
			    <input type="text" name="tab" value="profile" class="hidden"> 
			    <div class="flex flex-col flex-wrap sm:flex-row">
				<div class="truncate pt-3 capitalize sm:w-[20%] sm:text-right">Email</div>
				<div class="sm:w-[80%] sm:pl-5">
				    <div class="pt-3 text-gray-700">${sessionScope.shop.email}</div>
				</div>
			    </div>
			    <div class="mt-6 flex flex-col flex-wrap sm:flex-row">
				<div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">Name</div>
				<div class="sm:w-[80%] sm:pl-5">
				    <div class="">
					<input type="text" value="${sessionScope.shop.name}" placeholder="Name"
					       class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm"
					       name="name">
					<div class="mt-1 text-red-600 min-h-[1.25rem] text-sm"></div>
				    </div>
				</div>
			    </div>
			    <c:if test="${!sessionScope.shop.address.equals('')}">
				<div class="mt-2 flex items-center sm:flex-row">
				    <div class="truncate capitalize sm:w-[20%] sm:text-right sm:pr-0 pr-3">Current Address
				    </div>
				    <div class="sm:w-[80%] sm:pl-5">
                                        ${sessionScope.shop.address}
				    </div>
				</div>
			    </c:if>
			    <div class="mt-5 flex flex-col flex-wrap sm:flex-row">
				<div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">Update Address</div>
				<div class="sm:w-[80%] sm:pl-5">
				    <div class=" flex items-center justify-between">
					<select id="city" name="city"
						class="w-[32%] rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm">
					</select>
					<select id="district" name="district"
						class="w-[32%] rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm">
					</select>
					<select id="ward" name="ward"
						class="w-[32%] rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm">
					</select>
				    </div>
				    <input type="text" placeholder="Detail Address"
					   class="w-full mt-2 rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm"
					   name="detail">
				</div>
			    </div>
			    <c:if test="${sessionScope.error!=null}">
				<div class="mt-5 flex flex-col flex-wrap sm:flex-row">
				    <div class="sm:w-[20%]"></div>
				    <div class="sm:w-[80%] sm:pl-5 text-red-500">
                                        ${sessionScope.error}
				    </div>
				</div>
			    </c:if>
			    <div class="mt-5 flex flex-col flex-wrap sm:flex-row">
				<div class="truncate pt-3 capitalize sm:w-[20%] sm:text-right">
				</div>
				<div class="sm:w-[80%] sm:pl-5">
				    <div>
					<button type="submit"
						class="w-full bg-blue-500 py-3 px-2 text-center text-sm uppercase text-white hover:bg-blue-600 rounded-sm">
					    Update
					</button>
				    </div>
				</div>
			    </div>
			</form>
			<div class="flex justify-center md:w-72 md:border-l md:border-l-gray-200">
			    <div class="flex flex-col items-center">
				<div class="my-5 flex h-24 w-24 items-center justify-center overflow-hidden">
				    <c:if test="${sessionScope.shop.avatar.equals('')}">
					<img id="avatarPreview" src="./static/images/smug-pepe.jpg" alt=""
					     class="h-full w-full rounded-full object-cover">
				    </c:if>
				    <c:if test="${!sessionScope.shop.avatar.equals('')}">
					<img id="avatarPreview" src="${sessionScope.shop.avatar}" alt=""
					     class="h-full w-full rounded-full object-cover">
				    </c:if>
				</div>
				<div>
				    <form id="changeAvatarForm" action="avatar" method="GET"
					  class="flex items-center justify-center">
					<input onchange="submitChangeAvatar()" type="text" class="hidden" id="avatarUrl"
					       name="avatarUrl">
					<input id="fileInput" type="file" class="hidden" accept=".jpg,.jpeg,.png">
					<button type="submit" id="buttonSubmitForm"
						class="hidden h-10 items-center justify-end rounded-sm border bg-white px-6 text-sm text-gray-600 shadow-sm">
					    Change
					</button>
				    </form>
				    <button id="buttonOpenFile" onclick="changeAvatarButton()"
					    class=" h-10 items-center justify-end rounded-sm border bg-white px-6 text-sm text-gray-600 shadow-sm">
					Select Avatar
				    </button>
				</div>
			    </div>
			</div>
		    </div>
		</div>
	    </div>
	</c:if>
	<c:if test="${requestScope.tab.equals('changePassword')}">
	    <div class="container mx-auto p-10">
		<div class="rounded-sm bg-white px-2 pb-10 shadow md:px-7 md:pb-20 container mx-auto">
		    <div class="border-b border-b-gray-200 py-6">
			<h1 class="text-lg font-medium capitalize text-gray-900">Change Password</h1>
		    </div>
		    <div class="mr-auto mt-8 max-w-[800px]">
			<form action="password" method="POST" class="mt-6 flex-grow md:mt-0 md:pr-12">
			    <div class="mt-2 flex flex-col flex-wrap sm:flex-row">
				<div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">Old Password</div>
				<div class="sm:w-[80%] sm:pl-5">
				    <div class="undefined relative">
					<input required type="password" placeholder="Old Password"
					       class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm"
					       name="password"/>
				    </div>
				    <div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
				</div>
			    </div>
			    <div class="mt-2 flex flex-col flex-wrap sm:flex-row">
				<div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">New Password</div>
				<div class="sm:w-[80%] sm:pl-5">
				    <div class="undefined relative">
					<input required type="password" placeholder="New Password"
					       class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm"
					       name="new_password"/>
				    </div>
				    <div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
				</div>
			    </div>
			    <div class="mt-2 flex flex-col flex-wrap sm:flex-row">
				<div class="capitalize sm:w-[20%] sm:pt-3 sm:text-right">Confirm Password</div>
				<div class="sm:w-[80%] sm:pl-5">
				    <div class="undefined relative">
					<input required type="password" placeholder="Confirm New Password"
					       class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm"
					       name="confirm_password"/>
				    </div>
				    <div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
				</div>
			    </div>

			    <c:if test="${sessionScope.error!=null}">
				<div class=" flex flex-col flex-wrap sm:flex-row">
				    <div class="sm:w-[20%] sm:pt-3"></div>
				    <div class="sm:w-[80%] sm:pl-5 text-red-500">${sessionScope.error}</div>
				</div>
			    </c:if>
			    <div class="mt-2 flex flex-col flex-wrap sm:flex-row">
				<div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right"></div>
				<div class="sm:w-[80%] sm:pl-5">
				    <div>
					<button type="submit"
						class="bg-blue-500 w-full rounded-sm px-2 py-3 text-center text-sm uppercase text-white hover:bg-blue-600">
					    Change Password
					</button>
				    </div>
				</div>
			    </div>
			</form>
		    </div>
		</div>
	    </div>
	</c:if>

	<div id="cover"
	     onclick="closeModal()"
	     class="fixed w-[100%] hidden items-center justify-center h-[100%] top-0 right-0 left-0 bg-black bg-opacity-70 z-50 p-5">
	    <div  id="modal_content" class="p-3 max-w-[580px] bg-white w-full m-5 mx-auto rounded-md" onclick="handleClickContent(event)">
		<div class="w-full flex items-center justify-end">
		    <button onclick="closeModal()" class="p-2 cursor-pointer hover:bg-slate-100 rounded-md">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
			</svg>
		    </button>
		</div>
		<div class="w-full flex flex-col items-start items-center justify-center">
		    <c:if test="${requestScope.tab.equals('products')}">
			<div class=" flex items-start justify-center p-5">
			    <img id="productImage" class="w-[150px] h-[150px] object-cover" src="" alt="alt"/>
			</div>
			<div class=" flex items-center justify-center">
			    <div>
				<table border="1">
				    <thead>
					<tr>
					    <th class="p-2 text-left">Field</th>
					    <th class="p-2 text-left">Value</th>
					</tr>
				    </thead>
				    <tbody>
					<tr>
					    <th class="p-2 text-left ">ID</th>
					    <td class="p-2 text-left " id="modal_productId"></td>
					</tr>
					<tr>
					    <th class="p-2 text-left ">Name</th>
					    <td class="p-2 text-left " id="modal_productName"></td>
					</tr>
					<tr>
					    <th class="p-2 text-left ">Price</th>
					    <td class="p-2 text-left " id="modal_productPrice"></td>
					</tr>
					<tr>
					    <th class="p-2 text-left ">Rate</th>
					    <td class="p-2 text-left " id="modal_productRate"></td>
					</tr>
					<tr>
					    <th class="p-2 text-left ">Create Date</th>
					    <td class="p-2 text-left " id="modal_productCreateDate"></td>
					</tr>
					<tr>
					    <th class="p-2 text-left ">Color</th>
					    <td class="p-2 text-left " id="modal_productColor"></td>
					</tr>
					<tr>
					    <th class="p-2 text-left ">Category</th>
					    <td class="p-2 text-left " id="modal_productCategory"></td>
					</tr>
				    </tbody>
				</table>
			    </div>
			</div>
		    </c:if>
		</div>
	    </div>
	</div>
	<div onclick="toggleAdduserModal()" id="add_user" style="display: none" class="fixed py-20 w-[100%] items-center justify-center h-[100vh] top-0 right-0 left-0 bg-black bg-opacity-70 z-50 p-2">
	    <div onclick="handleClickContent(event)" class="p-5 grid gap-4 gap-y-2 text-sm grid-cols-1 lg:grid-cols-3 bg-white rounded-md max-w-[1250px]  overflow-y-auto h-fit max-h-[100%]">
		<div class="w-full flex items-center justify-end col-span-1 lg:col-span-3">
		    <button onclick="closeModal()" class="p-2 cursor-pointer hover:bg-slate-100 rounded-md">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
			</svg>
		    </button>
		</div>
		<div class="lg:col-span-3">
		    <c:if test="${requestScope.tab.equals('products')}">
			<form action="shopProduct" method="POST" class="grid gap-4 text-sm grid-cols-1 md:grid-cols-5">
			    <div class="md:col-span-5">
				<label for="name">Product Name<span class="text-red-500">*</span></label>
				<input type="text" name="name" id="name" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
			    </div>
			    <div class="grid grid-cols-2 gap-x-4 w-full col-span-1 md:col-span-5">
				<div class="w-full col-span-1">
				    <label for="price">Price<span class="text-red-500">*</span></label>
				    <input type="number" name="price" id="price" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
				</div>
				<div class="w-full col-span-1">
				    <label for="salePrice">Sale Price <span class="text-red-500">*</span></label>
				    <input type="number" name="salePrice" id="salePrice" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
				</div>
			    </div>
			    <div class="w-full col-span-1 md:col-span-5">
				<label for="description">Description <span class="text-red-500 mb-1">*</span></label>
				<textarea name="description" id="editor" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" requireds></textarea>
			    </div>
			    <div class="grid grid-cols-2 gap-x-4 w-full col-span-1 md:col-span-5">
				<div class="w-full col-span-1">
				    <select name="color" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required>
					<option value="" class="py-2" selected disabled>Color</option>
					<c:forEach items="${requestScope.colors}" var="color">
					    <option value="${color.id}">${color.name}</option>
					</c:forEach>
				    </select>
				</div>
				<div class="w-full col-span-1">
				    <select name="category" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required>
					<option value="" class="py-2" selected disabled>Category</option>
					<c:forEach items="${requestScope.categories}" var="category">
					    <option value="${category.id}">${category.name}</option>
					</c:forEach>
				    </select>
				</div>
			    </div>
			    <div class="w-full col-span-1 gap-y-4 md:col-span-5 grid grid-cols-1 md:grid-cols-2">
				<div class="col-span-1 md:pt-5 pt-0">
				    <div>
					<label for="mainImage">Main Image<span class="text-red-500 mb-1">*</span></label>
					<br/>
					<input id="mainImageValue" class="hidden" type="text" name="mainImage">
					<input id="mainImage" class="block" type="file" required/>
				    </div>
				    <div id="mainImagePreviewContainer" class="mt-2" style="display: none">
					<img id="mainImagePreview" class="w-[150px] h-[250px] object-cover" src="" alt="alt"/>
				    </div>
				    <div id="subImages" class="mt-5 w-full col-span-1 md:col-span-5">

				    </div>
				    <button id="addImageButton" type="button" class="w-fit text-sm rounded-sm py-1 px-2 text-white bg-blue-500">Add Image</button>
				</div>
				<div class="col-span-1 md:pt-5 pt-0">
				    <div id="sizeContainer">
					<div class="flex items-center justify-start w-full mb-2">
					    <div class="flex items-center justify-start">
						<div class="mr-2">
						    <label>Size<span class="text-red-500">*</span></label>
						    <input type="text" name="sizeName" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
						</div>
						<div class="ml-2">
						    <label for="inventory">Inventory<span class="text-red-500">*</span></label>
						    <input type="number" name="inventory" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
						</div>
					    </div>
					</div>
				    </div>
				    <button id="addSizeButton" type="button" class="w-fit mt-3 text-sm rounded-sm py-1 px-2 text-white bg-blue-500">Add Size</button>
				</div>
			    </div>
			    <div class="md:col-span-5 text-center mt-3">
				<div class="inline-flex items-center">
				    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-5 rounded">Submit</button>
				</div>
			    </div>
			</form>
		    </c:if>
		</div>
	    </div>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
	<script src="./static/js/cityAPI.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js"></script>
	<script src="./static/js/shop.js"></script>
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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script>
			const revenueChart = document.getElementById('myChart');
			new Chart(revenueChart, {
			    type: 'bar',
			    data: {
				labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
				datasets: [{
					label: 'Revenue',
					data: [1001221, 1331441, 3123, 13131, 3, 1313131, 313, 31, 313, 13, 213.34234],
					borderWidth: 1
				    }]
			    },
			    options: {
				scales: {
				    y: {
					beginAtZero: true
				    }
				}
			    }
			});

			const soldChart = document.getElementById('soldChart');
			new Chart(soldChart, {
			    type: 'doughnut',
			    data: {
				labels: [
				    'Red',
				    'Blue',
				    'Yellow'
				],
				datasets: [{
					label: 'My First Dataset',
					data: [300, 50, 100],
					backgroundColor: [
					    'rgb(255, 99, 132)',
					    'rgb(54, 162, 235)',
					    'rgb(255, 205, 86)'
					],
					hoverOffset: 4
				    }]
			    }
			});

	</script>
    </body>
</html>
