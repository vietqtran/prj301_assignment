<%-- 
    Document   : admin
    Created on : Sep 29, 2023, 2:18:01 PM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru | Admin</title>
        <link rel="icon" href="./static/logo/icon-logo.png" type="image/png" sizes="32x32">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
    <body class=" flex">

	<aside id="sidebar" class="hide md:sticky fixed top-0 left-0 h-screen w-[300px] bg-[#0261d6] z-40">
	    <div id="navHeader" class="p-6">
		<a href="admin" class="text-white font-semibold flex items-center justify-center uppercase hover:text-gray-300">
		    <img class="w-[50px] rounded-md mr-3 " src="./static/logo/white-logo.png" alt="alt"/>
		    <span class="text-xl">Admin</span>
		</a>
	    </div>
	    <div id="avatar" class="w-full flex items-center justify-center flex-col">
		<c:if test="${sessionScope.user.avatar.equals('')}">
		    <img src="./static/images/smug-pepe.jpg" class="aspect-square w-[50%] object-cover rounded-full border-white border-[1px]" alt="alt"/>   
		</c:if>
		<c:if test="${!sessionScope.user.avatar.equals('')}">
		    <img src="${sessionScope.user.avatar}" class="aspect-square w-[50%] object-cover rounded-full border-white border-[1px]" alt="alt"/>   
		</c:if>
		<span class="mt-3 text-white font-medium">${sessionScope.user.username}</span>
	    </div>
	    <nav id="nav" class="text-white text-base font-semibold pt-3 overflow-hidden">
		<a href="admin?tab=accounts" class="${requestScope.tab.equals('accounts')?'text-[#0261d6] bg-white':''} flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" />
			</svg>
		    </div>
		    <div>
			<div>Users</div>
		    </div>
		</a>
		<a href="admin?tab=shops" class="${requestScope.tab.equals('shops')?'text-[#0261d6] bg-white':''} flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" />
			</svg>
		    </div>
		    <div>
			<span>Shops</span>
		    </div>
		</a>
		<a href="admin?tab=products" class="${requestScope.tab.equals('products')?'text-[#0261d6] bg-white':''} flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M6.429 9.75L2.25 12l4.179 2.25m0-4.5l5.571 3 5.571-3m-11.142 0L2.25 7.5 12 2.25l9.75 5.25-4.179 2.25m0 0L21.75 12l-4.179 2.25m0 0l4.179 2.25L12 21.75 2.25 16.5l4.179-2.25m11.142 0l-5.571 3-5.571-3" />
			</svg>
		    </div>
		    <div>
			<span>Products</span>
		    </div>
		</a>
		<a href="check?action=logout" class="flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
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

	<!--//account-->
	<c:if test="${requestScope.tab.equals('accounts')}">
	    <div class="p-5 w-full flex flex-col">
		<div class="border-b-[1px] border-gray-500 pb-5 flex items-center justify-between">
		    <form action="user" method="GET" class="flex w-fit items-center justify-start p-3 border-slate-400 border-[1px] rounded-md">
			<div class="mr-2">
			    <input name="id" type="text" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" placeholder="ID">
			</div> 
			<div class="mr-2">
			    <input name="username" type="text" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" placeholder="Username">
			</div> 
			<div class="mr-2">
			    <input name="email" type="text" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" placeholder="Email">
			</div> 
			<div class="mr-2">
			    <select name="role" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" >
				<option value="" class="py-2" selected disabled>Role</option>
				<option value="4">User</option>
				<option value="2">Staff</option>
				<option value="1">Admin</option>
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
			    <span class="ml-2">Add new</span>
			</button>
		    </div>
		</div>
		<div class="w-full relative overflow-x-auto mt-10">
		    <table class="table-auto w-full divide-y divide-x divide-gray-200 border-collapse">
			<thead class="sticky top-0 bg-white">
			    <tr class="border border-gray-200">
				<th scope="col" class="border border-gray-200 p-2 truncate">ID</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Username</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Email</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Name</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Phone</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Address</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Role</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Actions</th>
			    </tr>
			</thead>
			<tbody>
			    <c:forEach items="${requestScope.users}" var="user">
				<c:if test="${user.id!=sessionScope.user.id}">
				    <tr class="border border-gray-200" 
					data-user-id="${user.id}"
					data-user-username="${user.username}"
					data-user-email="${user.email}"
					data-user-name="${user.name}"
					data-user-phone="${user.phone}"
					data-user-address="${user.address}"
					data-user-avatar="${user.avatar}"
					data-user-role="${user.role}"
					> 
					<td class="border border-gray-200 p-2 w-auto truncate">${user.id}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">${user.username}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">${user.email}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">${user.name}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">${user.phone}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">${user.address}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">
					    <c:if test="${user.role==1}">
						Admin
					    </c:if>
					    <c:if test="${user.role==2}">
						Staff
					    </c:if>
					    <c:if test="${user.role==4}">
						User
					    </c:if>
					</td>
					<td class="border border-gray-200 p-2 w-auto flex flex-col items-center justify-center"">
					    <a href="check?action=deleteUser&id=${user.id}" class=" truncate text-xs flex items-center py-2 text-white hover:bg-red-600 px-3 bg-red-500 w-fit rounded-md mx-1">
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 mr-3">
						<path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
						</svg>
						Delete
					    </a>
					    <button 
						onclick="handleView(this)"
						class=" truncate text-xs mt-2 flex items-center py-2 text-white hover:bg-blue-600 px-3 bg-blue-500 w-fit rounded-md mx-1">
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 mr-3">
						<path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
						<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
						</svg>
						View
					    </button>
					</td>
				    </tr>
				</c:if>
			    </c:forEach>
			</tbody>
		    </table>
		</div>
	    </div>
	</c:if>
	<!--shop-->
	<c:if test="${requestScope.tab.equals('shops')}">
	    <div class="p-5 w-full flex flex-col">
		<div class="border-b-[1px] border-gray-500 pb-5 flex items-center justify-between">
		    <form action="shop" method="GET" class="flex w-fit items-center justify-start p-3 border-slate-400 border-[1px] rounded-md">
			<div class="mr-2">
			    <input name="id" type="text" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" placeholder="ID">
			</div> 
			<div class="mr-2">
			    <input name="name" type="text" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" placeholder="Shop Name">
			</div> 
			<div class="mr-2">
			    <input name="email" type="text" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" placeholder="Email">
			</div> 
			<div class="mr-2">
			    <input name="date" type="date" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" placeholder="Create From">
			</div>			
			<div class="mr-2">
			    <select name="active" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" >
				<option value="" class="py-2" selected disabled>Is Active</option>
				<option value="0">false</option>
				<option value="1">true</option>
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
			    <span class="ml-2">Add new</span>
			</button>
		    </div>
		</div>
		<div class="w-full relative overflow-x-auto mt-10">
		    <table class="table-auto w-full divide-y divide-x divide-gray-200 border-collapse">
			<thead class="sticky top-0 bg-white">
			    <tr class="border border-gray-200">
				<th scope="col" class="border border-gray-200 p-2 truncate">ID</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Email</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Name</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Address</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Create Date</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Active</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Avatar</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Actions</th>
			    </tr>
			</thead>
			<tbody>
			    <c:forEach items="${requestScope.shops}" var="shop">
				<tr class="border border-gray-200" 
				    data-shop-id="${shop.id}"
				    data-shop-email="${shop.email}"
				    data-shop-name="${shop.name}"
				    data-shop-address="${shop.address}"
				    data-shop-createDate="${shop.createDate}"
				    data-shop-active="${shop.active}"
				    data-shop-avatar="${shop.avatar}"
				    > 
				    <td class="border border-gray-200 p-2 w-auto truncate">${shop.id}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${shop.email}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${shop.name}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${shop.address}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${shop.createDate}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${shop.active}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">
					<c:if test="${!shop.avatar.equals('')}">
					    <img src="${shop.avatar}" class="w-[150px] h-[150px] object-cover" alt="alt"/>
					</c:if>
				    </td>
				    <td class=" p-2 h-full w-auto flex flex-col items-center justify-center"">
					<c:if test="${shop.active==true}">
					    <a href="check?action=disableShop&id=${shop.id}" class=" truncate text-xs flex items-center py-2 text-white hover:bg-red-600 px-3 bg-red-500 w-fit rounded-md mx-1">
						<span>
						    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
						    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
						    </svg>
						</span>
						<span class="hidden md:block ml-2">Disable</span>
					    </a>
					</c:if>
					<c:if test="${shop.active==false}">
					    <a href="check?action=enableShop&id=${shop.id}" class=" truncate text-xs flex items-center py-2 text-white hover:bg-green-600 px-3 bg-green-500 w-fit rounded-md mx-1">
						<span>
						    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
						    <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
						    </svg>
						</span>
						<span class="hidden md:block ml-2">Enable</span>
					    </a>
					</c:if>
					<button 
					    onclick="handleViewShop(this)"
					    class=" truncate text-xs flex items-center mt-2 py-2 text-white hover:bg-blue-600 px-3 bg-blue-500 w-fit rounded-md mx-1">
					    <span>
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
						<path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
						<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
						</svg>
					    </span>
					    <span class="hidden md:block ml-2">View</span>
					</button>
				    </td>
				</tr>
			    </c:forEach>
			</tbody>
		    </table>
		</div>
	    </div>
	</c:if>
	<!--product-->
	<c:if test="${requestScope.tab.equals('products')}">
	    <div class="p-5 w-full flex flex-col">
		<div class="border-b-[1px] border-gray-500 pb-5 flex items-center justify-between">
		    <form action="product" method="GET" class="flex w-fit items-center justify-start p-3 border-slate-400 border-[1px] rounded-md">
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
				    <<option value="${color.id}">${color.name}</option>
				</c:forEach>
			    </select>
			</div>  
			<div class="mr-2">
			    <select name="category" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" >
				<option value="" class="py-2" selected disabled>Category</option>
				<c:forEach items="${requestScope.categories}" var="category">
				    <<option value="${category.id}">${category.name}</option>
				</c:forEach>
			    </select>
			</div>  
			<div class="mr-2">
			    <select name="shop" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" >
				<option value="" class="py-2" selected disabled>Shop</option>
				<c:forEach items="${requestScope.shops}" var="shop">
				    <<option value="${shop.id}">${shop.name}</option>
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
			    <span class="ml-2">Add new</span>
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
				<th scope="col" class="border border-gray-200 p-2 truncate">Category ID</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Shop ID</th>
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
				    data-product-description="${product.description}"
				    data-product-salePrice="${product.salePrice}"
				    data-product-categoryId="${product.categoryId}"
				    data-product-url="${product.url}"
				    > 
				    <td class="border border-gray-200 p-2 w-auto truncate">${product.id}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${product.name} </td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${product.price}</td>
				    <td class="border border-gray-200 p-2 w-auto truncate">${product.salePrice}</td>
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
				    <td class="border border-gray-200 p-2 w-auto truncate">
					<c:forEach items="${requestScope.shops}" var="shop">
					    <c:if test="${product.shopId==shop.id}">
						${shop.name}
					    </c:if>
					</c:forEach>
				    </td>
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
					    onclick="handleViewShop(this)"
					    class=" truncate text-xs flex items-center py-2 text-white hover:bg-blue-600 px-3 bg-blue-500 w-fit rounded-md mx-1 mt-2">
					    <span>
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
						<path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
						<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
						</svg>
					    </span>
					    <span class="hidden md:block ml-2">View</span>
					</button>
				    </td>
				</tr>
			    </c:forEach>
			</tbody>
		    </table>
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
		    <!--account-->
		    <c:if test="${requestScope.tab.equals('accounts')}">
			<div id="viewUserImageContainer" class=" items-start justify-center p-5">
			    <img id="viewUserImage" src="" class="w-[200px] h-[200px] object-cover" alt="alt"/>
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
					    <th class="p-2">ID</th>
					    <td class="p-2" id="modal_userId"></td>
					</tr>
					<tr>
					    <th class="p-2">Username</th>
					    <td class="p-2" id="modal_username"></td>
					</tr>
					<tr>
					    <th class="p-2">Email</th>
					    <td class="p-2" id="modal_email"></td>
					</tr>
					<tr>
					    <th class="p-2">Name</th>
					    <td class="p-2" id="modal_name"></td>
					</tr>
					<tr>
					    <th class="p-2">Phone</th>
					    <td class="p-2" id="modal_phone"></td>
					</tr>
					<tr>
					    <th class="p-2">Address</th>
					    <td class="p-2" id="modal_address"></td>
					</tr>
					<tr>
					    <th class="p-2">Role</th>
					    <td class="p-2" id="modal_role"></td>
					</tr>
				    </tbody>
				</table>
			    </div>
			</div>
			<div class="my-5 w-full text-center flex items-center justify-center">
			    <a id="delete_link" class="py-2 px-3 bg-red-500 hover:bg-red-600 text-white rounded-md mt-3" href="">Delete User</a>
			</div>
		    </c:if>
		    <!--shop--> 
		    <c:if test="${requestScope.tab.equals('shops')}">
			<div class=" flex items-start justify-center p-5">
			    <img id="shopAvatar" class="w-[150px] h-[150px] object-cover" src="" alt="alt"/>
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
					    <th class="p-2">ID</th>
					    <td class="p-2" id="modal_shopId"></td>
					</tr>
					<tr>
					    <th class="p-2">Name</th>
					    <td class="p-2" id="modal_shopName"></td>
					</tr>
					<tr>
					    <th class="p-2">Email</th>
					    <td class="p-2" id="modal_shopEmail"></td>
					</tr>
					<tr>
					    <th class="p-2">Address</th>
					    <td class="p-2" id="modal_shopAddress"></td>
					</tr>
					<tr>
					    <th class="p-2">Create Date</th>
					    <td class="p-2" id="modal_shopCreateDate"></td>
					</tr>
					<tr>
					    <th class="p-2">Active</th>
					    <td class="p-2" id="modal_shopActive"></td>
					</tr>
				    </tbody>
				</table>
			    </div>
			</div>
			<div id="disable_shop_btn" style="display: none" class="my-5 w-full text-center flex items-center justify-center">
			    <a id="disable_link" class="py-2 px-3 bg-red-500 hover:bg-red-600 text-white rounded-md mt-3" href="">Disable Shop</a>
			</div>
			<div id="enable_shop_btn" style="display: none" class="my-5 w-full text-center flex items-center justify-center">
			    <a id="enable_link" class="py-2 px-3 bg-green-500 hover:bg-green-600 text-white rounded-md mt-3" href="">Enable Shop</a>
			</div>
		    </c:if>
		</div>
	    </div>
	</div>

	<div onclick="toggleAdduserModal()" id="add_user" style="display: none" class="fixed w-[100%] items-center justify-center h-[100%] top-0 right-0 left-0 bg-black bg-opacity-70 z-50 p-2">
	    <div onclick="handleClickContent(event)" class="p-5 grid gap-4 gap-y-2 text-sm grid-cols-1 lg:grid-cols-3 bg-white rounded-md max-w-[1250px]">
		<div class="w-full flex items-center justify-end col-span-1 lg:col-span-3">
		    <button onclick="closeModal()" class="p-2 cursor-pointer hover:bg-slate-100 rounded-md">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
			</svg>
		    </button>
		</div>
		<div class="lg:col-span-3">
		    <c:if test="${requestScope.tab.equals('accounts')}">
			<form action="user" method="POST" class="grid gap-4 text-sm grid-cols-1 md:grid-cols-5">
			    <div class="md:col-span-5">
				<label for="name">Name</label>
				<input type="text" name="name" id="name" class="outline-none h-10 border mt-1 rounded px-4 w-full bg-gray-50" />
			    </div>
			    <div class="grid grid-cols-2 gap-x-4 w-full col-span-1 md:col-span-5">
				<div class="w-full col-span-1">
				    <label for="username">Username <span class="text-red-500">*</span></label>
				    <input type="text" name="username" id="username" class=" outline-none h-10 border mt-1 rounded px-4 w-full bg-gray-50" required/>
				</div>
				<div class="w-full col-span-1">
				    <label for="password">Password <span class="text-red-500">*</span></label>
				    <input type="password" name="password" id="password" class=" outline-none h-10 border mt-1 rounded px-4 w-full bg-gray-50" required/>
				</div>
			    </div>
			    <div class="grid grid-cols-2 gap-x-4 w-full col-span-1 md:col-span-5">
				<div class="w-full col-span-1">
				    <label for="email">Email <span class="text-red-500">*</span></label>
				    <input type="email" name="email" id="email" class="  outline-none h-10 border mt-1 rounded px-4 w-full bg-gray-50" required/>
				</div>
				<div class="w-full col-span-1">
				    <label for="phone">Phone</label>
				    <input type="text" name="phone" id="phone" class=" outline-none h-10 border mt-1 rounded px-4 w-full bg-gray-50" />
				</div>
			    </div>
			    <div class="grid grid-cols-2 gap-4 w-full col-span-1 md:col-span-5">
				<div class="w-full col-span-1">
				    <label class="block text-sm font-medium text-gray-900" for="fileInput">Avatar</label>
				    <input class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 p-2" id="fileInput" type="file">
				    <input id="avatarUrl" type="text" name="avatar" class="hidden">
				    <div id="avatarPreviewContainer" style="display: none" class="w-[150px] h-[150px] p-3">
					<img id="avatarPreview" src="" class="w-full h-full object-cover" alt="alt"/>
				    </div>
				</div>
				<div class="w-full col-span-1 ">
				    <label for="role">Role <span class="text-red-500">*</span></label>
				    <select id="role" name="role" class="w-full bg-gray-50 h-10 outline-none border rounded" required>
					<option value="" checked disable></option>
					<option value="1">Admin</option>
					<option value="3">Staff</option>
					<option value="4">User</option>
				    </select>
				</div>
			    </div>
			    <div class="w-full md:col-span-5">
				<label>Address</label>
				<div class="grid grid-cols-3 gap-4">
				    <select id="city" name="city" class="w-full bg-gray-50 h-10 outline-none border rounded col-span-1">
					<option value="" class="py-2" selected></option>
				    </select>
				    <select id="district" name="district" class="w-full bg-gray-50 h-10 outline-none border rounded col-span-1">
					<option value="" selected></option>
				    </select>
				    <select id="ward" name="ward" class="w-full bg-gray-50 h-10 outline-none border rounded col-span-1">
					<option value=""  selected></option>
				    </select>
				</div>
				<input type="text" placeholder="Detail Address" class=" outline-none h-10 border mt-3 rounded px-4 w-full bg-gray-50" name="detail" />
			    </div>
			    <div class="md:col-span-5 text-center mt-3">
				<div class="inline-flex items-center">
				    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-5 rounded">Submit</button>
				</div>
			    </div>
			</form>
		    </c:if>
		    <c:if test="${requestScope.tab.equals('shops')}">
			<form action="shop" method="POST" class="grid gap-4 text-sm grid-cols-1 md:grid-cols-5">
			    <div class="md:col-span-5">
				<label for="shopName">Shop Name<span class="text-red-500">*</span></label>
				<input type="text" name="shopName" id="shopName" class="outline-none h-10 border mt-1 rounded px-4 w-full bg-gray-50" required/>
			    </div>
			    <div class="grid grid-cols-2 gap-x-4 w-full col-span-1 md:col-span-5">
				<div class="w-full col-span-1">
				    <label for="email">Email<span class="text-red-500">*</span></label>
				    <input type="email" name="email" id="email" class=" outline-none h-10 border mt-1 rounded px-4 w-full bg-gray-50" required/>
				</div>
				<div class="w-full col-span-1">
				    <label for="password">Password <span class="text-red-500">*</span></label>
				    <input type="password" name="password" id="password" class=" outline-none h-10 border mt-1 rounded px-4 w-full bg-gray-50" required/>
				</div>
			    </div>
			    <div class="w-full md:col-span-5">
				<label>Address<span class="text-red-500">*</span></label>
				<div class="grid grid-cols-3 gap-4">
				    <select id="city" name="city" class="w-full bg-gray-50 h-10 outline-none border rounded col-span-1" required>
					<option value="" class="py-2" selected></option>
				    </select>
				    <select id="district" name="district" class="w-full bg-gray-50 h-10 outline-none border rounded col-span-1" required>
					<option value="" selected></option>
				    </select>
				    <select id="ward" name="ward" class="w-full bg-gray-50 h-10 outline-none border rounded col-span-1" required>
					<option value=""  selected></option>
				    </select>
				</div>
				<input type="text" placeholder="Detail Address" class=" outline-none h-10 border mt-3 rounded px-4 w-full bg-gray-50" name="detail" required/>
			    </div>
			    <div class="grid grid-cols-2 gap-x-4 w-full col-span-1 md:col-span-5">
				<div class="w-full col-span-1">
				    <label class="block text-sm font-medium text-gray-900" for="fileInput">Avatar<span class="text-red-500">*</span></label>
				    <input class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 p-2" id="fileInput" type="file" required>
				    <input id="avatarUrl" type="text" name="avatar" class="hidden">
				    <div id="avatarPreviewContainer" style="display: none" class="w-[150px] h-[150px] p-3">
					<img id="avatarPreview" src="" class="w-full h-full object-cover" alt="alt"/>
				    </div>
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
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script src="./static/js/admin.js"></script>
    <script src="./static/js/cityAPI.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js"></script>
    <script src="static/js/uploadFirebase.js"></script>
</body>
</body>
</html>
