<%-- 
    Document   : account
    Created on : Sep 27, 2023, 8:32:22 PM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="vietqtran.model.OrderProduct" %>
<%@ page import="vietqtran.model.Order" %>
<%@ page import="vietqtran.model.Shop" %>
<%@ page import="vietqtran.model.ShipCompany" %>
<%@ page import="vietqtran.model.Product" %>
<%@ page import="vietqtran.model.SizeProduct" %>
<%@ page import="vietqtran.services.OrderProductDAO" %>
<%@ page import="vietqtran.services.ProductDAO" %>
<%@ page import="vietqtran.services.SizeProductDAO" %>
<%@ page import="vietqtran.services.ShopDAO" %>
<%@ page import="vietqtran.services.ShipCompanyDAO" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru | Account</title>
        <link rel="icon" href="./static/logo/icon-logo.png" type="image/png" sizes="32x32">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/35.2.1/adapter-ckfinder/ckfinder.js"></script>
    </head>
    <body>
        <%@include file="./components/header.jsp" %>

	<div class="bg-neutral-100 py-16 text-sm text-gray-600  lg:px-0 px-3">
	    <div class="container mx-auto max-w-[1250px]">
		<div class="grid grid-cols-1 gap-6 md:grid-cols-12 container mx-auto">
		    <div class="md:col-span-3 lg:col-span-2">
			<aside>
			    <div class="flex items-center border-b border-b-gray-200 py-4">
				<c:if test="${!sessionScope.user.name.equals('')}">
				    <c:if test="${sessionScope.user.avatar.equals('')}">
					<div class="rounded-full overflow-hidden bg-white relative p-10 border-[1px] border-blue-500 mb-5">
					    <div class="absolute font-medium text-[#0261d6] text-2xl top-[50%] left-[50%] translate-x-[-50%] translate-y-[-50%]">${sessionScope.user.name.toUpperCase().charAt(0)}</div>
					</div>
				    </c:if>
				    <c:if test="${!sessionScope.user.avatar.equals('')}">
					<div class="bg-cover bg-center bg-[url('${sessionScope.user.avatar}')] rounded-full overflow-hidden border-[1px] border-blue-500 w-[25px] h-[25px] box-content"></div>
				    </c:if>	
				</c:if>
				<c:if test="${sessionScope.user.name.equals('')}">
				    <c:if test="${sessionScope.user.avatar.equals('')}">
					<div class="rounded-full overflow-hidden bg-white relative p-3 border-[1px] border-blue-500">
					    <div class="absolute font-medium text-[#0261d6] top-[50%] left-[50%] translate-x-[-50%] translate-y-[-50%]">${sessionScope.user.username.toUpperCase().charAt(0)}</div>
					</div>
				    </c:if>
				    <c:if test="${!sessionScope.user.avatar.equals('')}">
					<div class="bg-cover bg-center bg-[url('${sessionScope.user.avatar}')] rounded-full overflow-hidden border-[1px] border-blue-500 w-[25px] h-[25px] box-content"></div>
				    </c:if>	
				</c:if>				
				<div class="flex-grow pl-4">
				    <div class="mb-1 line-clamp-1 font-semibold text-gray-600">
					<c:if test="${!sessionScope.user.name.equals('')}">
					    <span>${sessionScope.user.name}</span>
					</c:if>
					<c:if test="${sessionScope.user.name.equals('')}">
					    <span>${sessionScope.user.username}</span>
					</c:if>
				    </div>
				    <a class="active flex items-center capitalize text-gray-500"
				       ><svg width="12" height="12" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" style="margin-right: 4px;"><path d="M8.54 0L6.987 1.56l3.46 3.48L12 3.48M0 8.52l.073 3.428L3.46 12l6.21-6.18-3.46-3.48" fill="#9B9B9B" fill-rule="evenodd"></path></svg>Sửa hồ sơ</a
				    >
				</div>
			    </div>
			    <div class="mt-7">
				<a href="account?tab=account" id="account_btn" class="${requestScope.tab.equals('account')?'text-blue-500':''} mb-3 tab_select flex items-center gap-x-3 capitalize transition-colors cursor-pointer" >
				    <div class="h-[22px] w-[22px]">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
					<path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
					</svg>
				    </div>
				    Tài khoản của tôi
				</a>
				<a href="account?tab=password" id="password_btn" class="${requestScope.tab.equals('password')?'text-blue-500':''} mb-3 mt-2 tab_select flex items-center gap-x-3 capitalize transition-colors cursor-pointer">
				    <div class="h-[22px] w-[22px]">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
					<path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z" />
					</svg>
				    </div>
				    Đổi mật khẩu
				</a>
				<a href="account?tab=orders" id="orders_btn" class="${requestScope.tab.equals('orders')?'text-blue-500':''} mb-3 mt-2 tab_select flex items-center gap-x-3 capitalize transition-colors cursor-pointer">
				    <div class="h-[22px] w-[22px]">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
					<path stroke-linecap="round" stroke-linejoin="round" d="M3.75 12h16.5m-16.5 3.75h16.5M3.75 19.5h16.5M5.625 4.5h12.75a1.875 1.875 0 010 3.75H5.625a1.875 1.875 0 010-3.75z" />
					</svg>
				    </div>
				    Đơn mua
				</a>
			    </div>
			</aside>
		    </div>


		    <div class="md:col-span-9 lg:col-span-10">
			<c:if test="${requestScope.tab.equals('account')}">
			    <div id="account" class="rounded-sm tab bg-white px-2 pb-10 shadow md:px-7 md:pb-20 px-3">
				<div class="border-b border-b-gray-200 py-6">
				    <h1 class="text-lg font-medium capitalize text-gray-900">Hồ Sơ Của Tôi</h1>
				    <div class="mt-1 text-sm text-gray-700">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
				</div>
				<div class="mt-8 flex flex-col-reverse md:flex-row md:items-start">
				    <form class="mt-6 flex-grow md:mt-0 md:pr-12" action="updateAccount" method="POST">
					<div class="flex flex-col flex-wrap sm:flex-row">
					    <div class="truncate pt-3 capitalize sm:w-[20%] sm:text-right">Email</div>
					    <div class="sm:w-[80%] sm:pl-5"><div class="pt-3 text-gray-700">${sessionScope.user.email}</div></div>
					</div>
					<div class="mt-6 flex flex-col flex-wrap sm:flex-row">
					    <div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">Tên</div>
					    <div class="sm:w-[80%] sm:pl-5">
						<div class="">
						    <input type="text" value="${sessionScope.user.name}" placeholder="Tên người dùng" class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm" name="name" />
						    <div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
						</div>
					    </div>
					</div>
					<div class="mt-2 flex flex-col flex-wrap sm:flex-row">
					    <div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">Số điện thoại</div>
					    <div class="sm:w-[80%] sm:pl-5">
						<div class="">
						    <input value="${sessionScope.user.phone}" type="text" placeholder="Số điện thoại" class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm" name="phone"/>
						    <div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
						</div>
					    </div>
					</div>
					<!--					<div class="mt-2 flex flex-col flex-wrap sm:flex-row">
										    <div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">Địa chỉ</div>
										    <div class="sm:w-[80%] sm:pl-5 mb-5">
											<div class="flex justify-between">
											    <select id="city" name="city"class="focus:border-primary h-10 w-[32%] cursor-pointer rounded-sm border border-black/10 px-3 outline-none">
												<option value="" class="py-2" selected></option>
											    </select>
											    <select id="district" name="district" class="focus:border-primary h-10 w-[32%] cursor-pointer rounded-sm border border-black/10 px-3 outline-none">
												<option value="" selected></option>
											    </select>
											    <select id="ward" name="ward" class="focus:border-primary h-10 w-[32%] cursor-pointer rounded-sm border border-black/10 px-3 outline-none">
												<option value=""  selected></option>
											    </select>
											</div>
											<input type="text" placeholder="Số nhà, tên đường" class="mt-3 w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm" name="detail" />
										    </div>
										</div>-->
					<div class="mt-2 flex flex-col flex-wrap sm:flex-row">
					    <div class="truncate pt-3 capitalize sm:w-[20%] sm:text-right"></div>
					    <div class="sm:w-[80%] sm:pl-5">
						<div>
						    <button type="submit" class="bg-blue-500 w-full rounded-sm px-2 py-3 text-center text-sm uppercase text-white hover:bg-blue-600">Cập nhật</button>
						</div>
					    </div>
					</div>
				    </form>
				    <div class="flex justify-center md:w-72 md:border-l md:border-l-gray-200">
					<div class="flex justify-center md:w-72 md:border-l md:border-l-gray-200">
					    <div class="flex flex-col items-center">
						<div class="my-5 flex h-24 w-24 items-center justify-center overflow-hidden">
						    <c:if test="${sessionScope.user.avatar.equals('')}">
							<img id="avatarPreview" src="./static/images/smug-pepe.jpg" alt=""
							     class="h-full w-full rounded-full object-cover">
						    </c:if>
						    <c:if test="${!sessionScope.user.avatar.equals('')}">
							<img id="avatarPreview" src="${sessionScope.user.avatar}" alt=""
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
							    class="flex h-10 items-center justify-end rounded-sm border bg-white px-6 text-sm text-gray-600 shadow-sm">
							Select Avatar
						    </button>
						</div>
					    </div>
					</div>
				    </div>
				</div>
			    </div>

			</c:if>


			<c:if test="${requestScope.tab.equals('password')}">
			    <div id="password" class="tab rounded-sm bg-white px-2 pb-10 shadow md:px-7 md:pb-20">
				<div class="border-b border-b-gray-200 py-6">
				    <h1 class="text-lg font-medium capitalize text-gray-900">Đổi mật khẩu</h1>
				    <div class="mt-1 text-sm text-gray-700">Để bảo mật tài khoản, vui lòng không chia sẻ mật khẩu cho người khác</div>
				</div>
				<div class="mt-8 mr-auto max-w-[800px]">
				    <form class="mt-6 flex-grow md:mt-0 md:pr-12" action="account" method="POST">
					<div class="mt-2 flex flex-col flex-wrap sm:flex-row">
					    <div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">Mật khẩu cũ</div>
					    <div class="sm:w-[80%] sm:pl-5">
						<div class="undefined relative">
						    <input required id="change_password_old" type="password" placeholder="Mật khẩu cũ" class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm" name="password">
						    <span onclick="showOldPass()">
							<span class="absolute top-1/2 right-5 -translate-y-1/2 cursor-pointer" aria-hidden="true">
							    <svg viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg" class="h-4 w-4">
							    <path d="M9.01194 4.20366C9.36253 4.14991 9.71673 4.12318 10.0714 4.12369C13.2498 4.12369 16.2384 6.41256 17.9775 10.1207C17.7115 10.685 17.4111 11.2325 17.0779 11.7599C16.9722 11.9236 16.9166 12.1147 16.918 12.3096C16.9203 12.5278 16.9938 12.7392 17.1274 12.9116C17.261 13.0841 17.4473 13.2081 17.658 13.2647C17.8687 13.3213 18.0921 13.3075 18.2941 13.2253C18.4962 13.1431 18.6658 12.997 18.7771 12.8094C19.2428 12.0777 19.6473 11.3088 19.9865 10.5105C20.0401 10.3858 20.0678 10.2515 20.0678 10.1157C20.0678 9.97998 20.0401 9.84564 19.9865 9.72093C17.9675 5.03325 14.1694 2.12468 10.0714 2.12468C9.60231 2.12232 9.13396 2.16246 8.6721 2.24462C8.54085 2.26694 8.41527 2.31489 8.30254 2.38573C8.18982 2.45658 8.09215 2.54893 8.01511 2.65752C7.93808 2.76611 7.88319 2.88881 7.85357 3.01862C7.82396 3.14842 7.8202 3.28279 7.84251 3.41405C7.86483 3.5453 7.91278 3.67088 7.98362 3.78361C8.05447 3.89633 8.14682 3.994 8.25541 4.07104C8.364 4.14807 8.4867 4.20296 8.61651 4.23258C8.74631 4.26219 8.88068 4.26595 9.01194 4.24364V4.20366ZM1.78551 0.415528C1.69232 0.322336 1.58168 0.248412 1.45992 0.197976C1.33816 0.147541 1.20765 0.121582 1.07586 0.121582C0.944067 0.121582 0.813563 0.147541 0.691802 0.197976C0.57004 0.248412 0.459404 0.322336 0.366212 0.415528C0.178001 0.603739 0.0722656 0.859007 0.0722656 1.12518C0.0722656 1.39135 0.178001 1.64662 0.366212 1.83483L3.46468 4.9233C2.05095 6.28415 0.925792 7.91581 0.156316 9.72093C0.10128 9.84703 0.0728721 9.98314 0.0728721 10.1207C0.0728721 10.2583 0.10128 10.3944 0.156316 10.5205C2.17532 15.2082 5.97344 18.1168 10.0714 18.1168C11.8676 18.1044 13.6214 17.5695 15.1189 16.5775L18.3573 19.8259C18.4502 19.9196 18.5608 19.994 18.6826 20.0447C18.8044 20.0955 18.935 20.1216 19.067 20.1216C19.1989 20.1216 19.3296 20.0955 19.4514 20.0447C19.5732 19.994 19.6837 19.9196 19.7766 19.8259C19.8703 19.733 19.9447 19.6225 19.9954 19.5007C20.0461 19.3789 20.0723 19.2482 20.0723 19.1163C20.0723 18.9843 20.0461 18.8537 19.9954 18.7319C19.9447 18.6101 19.8703 18.4995 19.7766 18.4066L1.78551 0.415528ZM8.14237 9.60099L10.5912 12.0498C10.4222 12.0982 10.2471 12.1218 10.0714 12.1197C9.54124 12.1197 9.03279 11.9091 8.6579 11.5342C8.28301 11.1594 8.0724 10.6509 8.0724 10.1207C8.07035 9.945 8.09392 9.76992 8.14237 9.60099ZM10.0714 16.1178C6.89298 16.1178 3.90446 13.8289 2.17532 10.1207C2.82109 8.69518 3.73762 7.40865 4.87398 6.3326L6.64311 8.12172C6.22756 8.88014 6.06913 9.75286 6.19159 10.6089C6.31405 11.465 6.71079 12.2583 7.3223 12.8698C7.93381 13.4814 8.72711 13.8781 9.5832 14.0006C10.4393 14.123 11.312 13.9646 12.0704 13.549L13.6596 15.1183C12.5713 15.7588 11.3342 16.1034 10.0714 16.1178Z" fill="gray">
							    </path
							    </svg>
							</span>
						    </span>
						</div>
						<div class="mt-1 text-red-600 min-h-[1.25rem] text-sm">
						</div>
					    </div>
					</div>
					<div class="mt-2 flex flex-col flex-wrap sm:flex-row">
					    <div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">Mật khẩu mới</div>
					    <div class="sm:w-[80%] sm:pl-5">
						<div class="undefined relative">
						    <input required id="change_password_new" type="password" placeholder="Mật khẩu mới" class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm" name="new_password">
						    <span onclick="showNewPass()">
							<span class="absolute top-1/2 right-5 -translate-y-1/2 cursor-pointer" aria-hidden="true">
							    <svg viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg" class="h-4 w-4">
							    <path d="M9.01194 4.20366C9.36253 4.14991 9.71673 4.12318 10.0714 4.12369C13.2498 4.12369 16.2384 6.41256 17.9775 10.1207C17.7115 10.685 17.4111 11.2325 17.0779 11.7599C16.9722 11.9236 16.9166 12.1147 16.918 12.3096C16.9203 12.5278 16.9938 12.7392 17.1274 12.9116C17.261 13.0841 17.4473 13.2081 17.658 13.2647C17.8687 13.3213 18.0921 13.3075 18.2941 13.2253C18.4962 13.1431 18.6658 12.997 18.7771 12.8094C19.2428 12.0777 19.6473 11.3088 19.9865 10.5105C20.0401 10.3858 20.0678 10.2515 20.0678 10.1157C20.0678 9.97998 20.0401 9.84564 19.9865 9.72093C17.9675 5.03325 14.1694 2.12468 10.0714 2.12468C9.60231 2.12232 9.13396 2.16246 8.6721 2.24462C8.54085 2.26694 8.41527 2.31489 8.30254 2.38573C8.18982 2.45658 8.09215 2.54893 8.01511 2.65752C7.93808 2.76611 7.88319 2.88881 7.85357 3.01862C7.82396 3.14842 7.8202 3.28279 7.84251 3.41405C7.86483 3.5453 7.91278 3.67088 7.98362 3.78361C8.05447 3.89633 8.14682 3.994 8.25541 4.07104C8.364 4.14807 8.4867 4.20296 8.61651 4.23258C8.74631 4.26219 8.88068 4.26595 9.01194 4.24364V4.20366ZM1.78551 0.415528C1.69232 0.322336 1.58168 0.248412 1.45992 0.197976C1.33816 0.147541 1.20765 0.121582 1.07586 0.121582C0.944067 0.121582 0.813563 0.147541 0.691802 0.197976C0.57004 0.248412 0.459404 0.322336 0.366212 0.415528C0.178001 0.603739 0.0722656 0.859007 0.0722656 1.12518C0.0722656 1.39135 0.178001 1.64662 0.366212 1.83483L3.46468 4.9233C2.05095 6.28415 0.925792 7.91581 0.156316 9.72093C0.10128 9.84703 0.0728721 9.98314 0.0728721 10.1207C0.0728721 10.2583 0.10128 10.3944 0.156316 10.5205C2.17532 15.2082 5.97344 18.1168 10.0714 18.1168C11.8676 18.1044 13.6214 17.5695 15.1189 16.5775L18.3573 19.8259C18.4502 19.9196 18.5608 19.994 18.6826 20.0447C18.8044 20.0955 18.935 20.1216 19.067 20.1216C19.1989 20.1216 19.3296 20.0955 19.4514 20.0447C19.5732 19.994 19.6837 19.9196 19.7766 19.8259C19.8703 19.733 19.9447 19.6225 19.9954 19.5007C20.0461 19.3789 20.0723 19.2482 20.0723 19.1163C20.0723 18.9843 20.0461 18.8537 19.9954 18.7319C19.9447 18.6101 19.8703 18.4995 19.7766 18.4066L1.78551 0.415528ZM8.14237 9.60099L10.5912 12.0498C10.4222 12.0982 10.2471 12.1218 10.0714 12.1197C9.54124 12.1197 9.03279 11.9091 8.6579 11.5342C8.28301 11.1594 8.0724 10.6509 8.0724 10.1207C8.07035 9.945 8.09392 9.76992 8.14237 9.60099ZM10.0714 16.1178C6.89298 16.1178 3.90446 13.8289 2.17532 10.1207C2.82109 8.69518 3.73762 7.40865 4.87398 6.3326L6.64311 8.12172C6.22756 8.88014 6.06913 9.75286 6.19159 10.6089C6.31405 11.465 6.71079 12.2583 7.3223 12.8698C7.93381 13.4814 8.72711 13.8781 9.5832 14.0006C10.4393 14.123 11.312 13.9646 12.0704 13.549L13.6596 15.1183C12.5713 15.7588 11.3342 16.1034 10.0714 16.1178Z" fill="gray">
							    </path
							    </svg>
							</span>
						    </span>
						</div>
					    </div>
					</div>
					<div class="mt-8 flex flex-col flex-wrap sm:flex-row">
					    <div class="capitalize sm:w-[20%] sm:pt-3 sm:text-right">Nhập lại mật khẩu mới</div>
					    <div class="sm:w-[80%] sm:pl-5">
						<div class="undefined relative">
						    <input required type="password" placeholder="Xác nhận mật khẩu mới" class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm" name="confirm_password">
						</div>
					    </div>
					</div>

					<div class="flex flex-col flex-wrap sm:flex-row mt-5">
					    <div class="truncate capitalize sm:w-[20%] sm:text-right">
					    </div>
					    <div class="sm:w-[80%] sm:pl-5">
						<c:if test="${sessionScope.error!=null}">
						    <div class="my-2 text-red-600 min-h-[1.25rem] text-sm">
							${sessionScope.error}
						    </div>
						</c:if>
						<div>
						    <button type="submit" class="w-full bg-blue-500 py-3 px-2 text-center text-sm uppercase text-white hover:bg-blue-600 rounded-sm">Cập nhật mật khẩu</button>
						</div>
					    </div>
					</div>
				    </form>
				</div>
			    </div>
			</c:if>


			<c:if test="${requestScope.tab.equals('orders')}">

			    <div id="orders" class="tab">
				<div class="overflow-x-auto">
				    <div class="min-w-[700px]">
					<div class="sticky top-0 flex rounded-t-sm shadow-sm">
					    <a class="flex flex-1 items-center justify-center bg-white py-4 relative ${param.status.equals('all') || param.status==null? 'text-blue-500':''}" href="?tab=orders&status=all">Tất cả</a>
					    <a class="flex flex-1 items-center justify-center bg-white py-4 relative ${param.status.equals('waitForConfirmation')? 'text-blue-500':''}" href="?tab=orders&status=waitForConfirmation">Chờ xác nhận</a>
					    <a class="flex flex-1 items-center justify-center bg-white py-4 relative ${param.status.equals('waitingForDelivery')? 'text-blue-500':''}" href="?tab=orders&status=waitingForDelivery">Chờ lấy hàng</a>
					    <a class="flex flex-1 items-center justify-center bg-white py-4 relative ${param.status.equals('delivering')? 'text-blue-500':''}" href="?tab=orders&status=delivering">Đang giao</a>
					    <a class="flex flex-1 items-center justify-center bg-white py-4 relative ${param.status.equals('delivered')? 'text-blue-500':''}" href="?tab=orders&status=delivered">Đã giao</a>
					    <a class="flex flex-1 items-center justify-center bg-white py-4 relative ${param.status.equals('canceled')? 'text-blue-500':''}" href="?tab=orders&status=canceled">Đã hủy</a>
					</div>
					<div>
					    <c:if test="${requestScope.orders.size()==0}">
						<div class="w-full mt-4">
						    <img src="./static/images/empty-order.png" class="w-full object-cover" alt="alt"/>
						</div>
					    </c:if>
					    <c:if test="${requestScope.orders.size()>0}">
						<c:forEach items="${requestScope.orders}" var="o">
						    <%
							Order order = (Order) pageContext.getAttribute("o");
							OrderProductDAO orderProductDao = new OrderProductDAO();
							List<OrderProduct> products = orderProductDao.getByOrderId(order.getId());
							ShopDAO shopDao = new ShopDAO();
							Shop shop = shopDao.get(order.getShopId());
						    %>
						    <div class="mt-4 rounded-sm v-dropshadow bg-white text-gray-800 shadow-sm">
							<div class="py-3 px-6 border-b-[1px] flex items-center justify-between">
							    <div class="flex items-center ">
								<span>
								    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 mr-3">
								    <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" />
								    </svg>
								</span>
								<span><%=shop.getName()%></span>
							    </div>
							    <div class="text-sm text-blue-500 py-2">
								<c:if test="${o.status.equals('waitForConfirmation')}">
								    <span>CHỜ THANH TOÁN</span>
								</c:if>
								<c:if test="${o.status.equals('waitingForDelivery')}">
								    <span>CHỜ VẬN CHUYỂN</span>
								</c:if>
								<c:if test="${o.status.equals('delivering')}">
								    <span>ĐANG VẬN CHUYỂN</span>
								</c:if>
								<c:if test="${o.status.equals('delivered')}">
								    <span>GIAO HÀNG THÀNH CÔNG</span>
								</c:if>
								<c:if test="${o.status.equals('canceled')}">
								    <span>ĐÃ HỦY</span>
								</c:if>
							    </div>
							</div>
							<c:forEach items="<%=products%>" var="p">
							    <%
								OrderProduct orderProduct = (OrderProduct) pageContext.getAttribute("p");
								ProductDAO productDao = new ProductDAO();
								Product product = productDao.get(orderProduct.getProductId());
								SizeProductDAO sizeDao = new SizeProductDAO();
								SizeProduct size = sizeDao.get(orderProduct.getSizeId());
							    %>
							    <div class="flex p-6">
								<div class="flex-shrink-0">
								    <img class="h-20 w-20 object-cover" src="${p.imageUrl}" alt="Điện Thoại Realme C11 (2GB/32GB) - Hàng Chính Hãng" />
								</div>
								<div class="ml-3 flex-grow overflow-hidden">
								    <div class="truncate"><%=product.getName()%></div>
								    <div class="mt-3"><%=size.getName()%></div>
								    <div class="mt-3">x${p.quantity}</div>
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
							<div class="flex items-end flex-col p-6 border-t-[1px] bg-[#fffefb]">
							    <div class="w-fit">
								<div class="text-sm w-full flex items-center justify-between mb-3">
								    <span>Phí ship: </span>
								    <span class="text-primary ml-4">₫<%=ship.getPrice()%></span>
								</div>
								<div class="w-full flex items-center justify-between mb-3">
								    <span>Tổng giá tiền</span>
								    <span class="text-blue-500 ml-4 text-xl">₫${o.totalPrice}</span>
								</div>
							    </div>
							    <div class="p-2">
								<c:if test="${o.status.equals('waitForConfirmation')}">
								    <a href="orderAction?status=canceled&id=${o.id}" class="block px-10 py-2 text-sm bg-red-600 hover:bg-red-500 text-white"><span>HỦY</span></a>
								</c:if>
								<c:if test="${o.status.equals('waitingForDelivery')}">
								    <a href="orderAction?status=canceled&id=${o.id}" class="block px-10 py-2 text-sm bg-red-600 hover:bg-red-500 text-white"><span>HỦY</span></a>
								</c:if>
								<c:if test="${o.status.equals('delivering')}">
								    <a href="orderAction?status=delivered&id=${o.id}" class="block px-10 py-2 text-sm bg-red-600 hover:bg-red-500 text-white"><span>ĐÃ NHẬN HÀNG</span></a>
								</c:if>
								<c:if test="${o.status.equals('delivered')}">
								    <button  onclick="rateButton(${o.id})" type="button" class="block px-10 py-2 text-sm bg-red-600 hover:bg-red-500 text-white">
									ĐÁNH GIÁ
								    </button>
								</c:if>
							    </div>
							</div>
						    </div>
						</c:forEach>
					    </c:if>
					</div>
				    </div>
				</div>
			    </div>
			</c:if>
		    </div>
		</div>
	    </div>
	</div>

	<div onclick="toggleRateModal()" id="rateModal" style="display: none" class="fixed top-0 left-0 w-full h-full bg-black bg-opacity-60 flex items-center justify-center">
	    <form onclick="clickContent(event)" id="rateForm" action="addRate" method="POST" class="bg-white  w-[450px] rounded-sm">
		<div  onclick="toggleRateModal()" class="border-b-[1px] p-5 flex items-center justify-between">
		    <span>ĐÁNH GIÁ SẢN PHẨM</span>
		    <span class="block p-1 rounded-sm hover:bg-slate-100 cursor-pointer">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
			<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
			</svg>
		    </span>
		</div>
		<input type="text" name="star" id="starRate" class="hidden">
		<input type="text" name="productId" id="productIdRate" class="hidden">
		<div class="p-5 flex items-center justify-center text-yellow-500">
		    <div class="cursor-pointer" onclick="selectStar(0)">
			<span style="display: block" class="starOutline">
			    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			    <path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
			    </svg>
			</span>
			<span style="display: none" class="starSolid">
			    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6">
			    <path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
			    </svg>
			</span>
		    </div>
		    <div class="cursor-pointer" onclick="selectStar(1)">
			<span style="display: block" class="starOutline">
			    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			    <path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
			    </svg>
			</span>
			<span style="display: none" class="starSolid">
			    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6">
			    <path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
			    </svg>
			</span>
		    </div>
		    <div class="cursor-pointer" onclick="selectStar(2)">
			<span style="display: block" class="starOutline">
			    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			    <path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
			    </svg>
			</span>
			<span style="display: none" class="starSolid">
			    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6">
			    <path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
			    </svg>
			</span>
		    </div>
		    <div class="cursor-pointer" onclick="selectStar(3)">
			<span style="display: block" class="starOutline">
			    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			    <path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
			    </svg>
			</span>
			<span style="display: none" class="starSolid">
			    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6">
			    <path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
			    </svg>
			</span>
		    </div>
		    <div class="cursor-pointer" onclick="selectStar(4)">
			<span style="display: block" class="starOutline">
			    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
			    <path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
			    </svg>
			</span>
			<span style="display: none" class="starSolid">
			    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6">
			    <path fill-rule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z" clip-rule="evenodd" />
			    </svg>
			</span>
		    </div>
		</div>
		<div class="p-5 pt-0">
		    <textarea name="content" id="editor" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required placeholder="Add a content..."></textarea>
		</div>
		<div class="flex items-center justify-center py-5">
		    <button type="button" onclick="handleSubmitRate()" class="px-10 py-2 text-sm bg-blue-600 hover:bg-blue-500 text-white">
			Đánh Giá
		    </button>
		</div>
	    </form>
	</div>

	<%@include file="components/footer.jsp" %>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
	<script src="./static/js/account.js"></script>
	<script src="static/js/cityAPI.js"></script>
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
	<script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js"></script>
	<script src="static/js/uploadFirebase.js"></script>
    </body>
</html>
