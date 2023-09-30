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

	<aside id="sidebar" class="hide md:sticky absolute top-0 left-0 h-screen w-[300px] bg-[#0261d6] z-50">
	    <div id="navHeader" class="p-6">
		<a href="admin" class="text-white font-semibold flex items-center justify-center uppercase hover:text-gray-300">
		    <img class="w-[50px] rounded-md mr-3 " src="./static/logo/white-logo.png" alt="alt"/>
		    <span class="text-xl">Admin</span>
		</a>
	    </div>
	    <div id="avatar" class="w-full flex items-center justify-center flex-col">
		<img src="./static/images/avatar.jpg" class="aspect-square w-[50%] object-cover rounded-full border-white border-[1px]" alt="alt"/>   
		<span class="mt-3 text-white font-medium">${sessionScope.user.username}</span>
	    </div>
	    <nav id="nav" class="text-white text-base font-semibold pt-3 overflow-hidden">
		<a href="?tab=accounts" class="flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" />
			</svg>
		    </div>
		    <div>
			<div>Users</div>
			<div>Staffs</div>
		    </div>
		</a>
		<a href="?tab=shops" class="flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
		    <div class="mr-3">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			<path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" />
			</svg>
		    </div>
		    <div>
			<span>Shops</span>
		    </div>
		</a>
		<a href="?tab=products" class="flex items-center justify-start p-3 cursor-pointer hover:bg-white hover:text-[#0261d6]">
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
		<div>Account</div>
		<div class="w-full relative overflow-x-auto mt-10">
		    <table class="table-fixed w-full divide-y divide-x divide-gray-200 border-collapse">
			<thead class="sticky top-0 bg-white">
			    <tr class="border border-gray-200">
				<th scope="col" class="border border-gray-200 p-2 truncate">ID</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Username</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Email</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Name</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Phone</th>
				<th scope="col" class="border border-gray-200 p-2 truncate">Address</th>
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
					> 
					<td class="border border-gray-200 p-2 w-auto truncate">${user.id}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">${user.username}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">${user.email}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">${user.name}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">${user.phone}</td>
					<td class="border border-gray-200 p-2 w-auto truncate">${user.address}</td>
					<td class="border border-gray-200 p-2 w-auto flex items-center justify-center"">
					    <a href="check?action=deleteUser&id=${user.id}" class=" truncate text-xs flex items-center py-2 text-white hover:bg-red-600 px-3 bg-red-500 w-fit rounded-md mx-1">
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 mr-3">
						<path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
						</svg>
						Delete
					    </a>
					    <button 
						onclick="handleView(this)"
						class=" truncate text-xs flex items-center py-2 text-white hover:bg-blue-600 px-3 bg-blue-500 w-fit rounded-md mx-1">
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
	<c:if test="${requestScope.tab.equals('shops')}">
	    <div class="p-5 w-full flex justify-between">
		<div>Shop</div>
	    </div>
	</c:if>
	<c:if test="${requestScope.tab.equals('products')}">
	    <div class="p-5 w-full flex justify-between">
		<div>Product</div>
	    </div>
	</c:if>

	<!--
		<div class="absolute w-[100vw] h-[100vh] top-0 right-0 bg-black">
	
		</div>-->
	<script>
	    function toggleSidebar() {
		const sidebar = document.getElementById("sidebar")
		const nav = document.getElementById("nav")
		const navHeader = document.getElementById("navHeader")
		if (sidebar.classList.contains('show')) {
		    sidebar.classList.remove('show')
		    sidebar.classList.add('hide')
		    sidebar.style.width = '20px'
		    nav.style.display = 'none'
		    navHeader.style.display = 'none'
		    document.getElementById('arrow-left').style.display = 'none'
		    document.getElementById('avatar').style.display = 'none'
		    document.getElementById('arrow-right').style.display = 'block'
		} else {
		    sidebar.classList.remove('hide')
		    sidebar.classList.add('show')
		    sidebar.style.width = '300px'
		    nav.style.display = 'block'
		    navHeader.style.display = 'block'
		    document.getElementById('arrow-right').style.display = 'none'
		    document.getElementById('avatar').style.display = 'flex'
		    document.getElementById('arrow-left').style.display = 'block'
		}
	    }
	    toggleSidebar()

	    function handleView(u) {
		var id = u.parentNode.parentNode.getAttribute('data-user-id');
		var username = u.parentNode.parentNode.getAttribute('data-user-username');
		var email = u.parentNode.parentNode.getAttribute('data-user-email');
		var name = u.parentNode.parentNode.getAttribute('data-user-name');
		var phone = u.parentNode.parentNode.getAttribute('data-user-phone');
		var address = u.parentNode.parentNode.getAttribute('data-user-address');
		var avatar = u.parentNode.parentNode.getAttribute('data-user-avatar');
		const user = {
		    id: id,
		    username: username,
		    email: email,
		    name: name,
		    phone: phone,
		    address: address,
		    avatar: avatar
		}
		console.log(user)
	    }
	</script>
    </body>
</body>
</html>
