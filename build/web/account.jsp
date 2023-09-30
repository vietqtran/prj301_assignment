<%-- 
    Document   : account
    Created on : Sep 27, 2023, 8:32:22 PM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
					<div class="bg-cover bg-center bg-[url('https://scontent.fhan20-1.fna.fbcdn.net/v/t39.30808-6/379178696_791051569690767_4898055343665726787_n.jpg?stp=dst-jpg_p526x296&_nc_cat=108&ccb=1-7&_nc_sid=813123&_nc_ohc=NeAh2QdtcNEAX8CTiyx&_nc_ht=scontent.fhan20-1.fna&oh=00_AfALEDX3qqlO-hpw6C_zIrkfLPSmecwE5iW6jAoEN15Lww&oe=651AEE1D')] rounded-full overflow-hidden border-[1px] border-blue-500 w-[25px] h-[25px] box-content"></div>
				    </c:if>	
				</c:if>
				<c:if test="${sessionScope.user.name.equals('')}">
				    <c:if test="${sessionScope.user.avatar.equals('')}">
					<div class="rounded-full overflow-hidden bg-white relative p-3 border-[1px] border-blue-500">
					    <div class="absolute font-medium text-[#0261d6] top-[50%] left-[50%] translate-x-[-50%] translate-y-[-50%]">${sessionScope.user.username.toUpperCase().charAt(0)}</div>
					</div>
				    </c:if>
				    <c:if test="${!sessionScope.user.avatar.equals('')}">
					<div class="bg-cover bg-center bg-[url('https://scontent.fhan20-1.fna.fbcdn.net/v/t39.30808-6/379178696_791051569690767_4898055343665726787_n.jpg?stp=dst-jpg_p526x296&_nc_cat=108&ccb=1-7&_nc_sid=813123&_nc_ohc=NeAh2QdtcNEAX8CTiyx&_nc_ht=scontent.fhan20-1.fna&oh=00_AfALEDX3qqlO-hpw6C_zIrkfLPSmecwE5iW6jAoEN15Lww&oe=651AEE1D')] rounded-full overflow-hidden border-[1px] border-blue-500 w-[25px] h-[25px] box-content"></div>
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
				<div id="account_btn" onclick="handleChangeTab('account', 'account_btn')" class="mb-3 tab_select flex items-center gap-x-3 capitalize transition-colors cursor-pointer" >
				    <div class="h-[22px] w-[22px]">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
					<path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
					</svg>
				    </div>
				    Tài khoản của tôi
				</div>
				<div id="password_btn" onclick="handleChangeTab('password', 'password_btn')" class="mb-3 mt-2 tab_select flex items-center gap-x-3 capitalize transition-colors cursor-pointer">
				    <div class="h-[22px] w-[22px]">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
					<path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z" />
					</svg>
				    </div>
				    Đổi mật khẩu
				</div>
				<div id="orders_btn" onclick="handleChangeTab('orders', 'orders_btn')" class="mb-3 mt-2 tab_select flex items-center gap-x-3 capitalize transition-colors cursor-pointer">
				    <div class="h-[22px] w-[22px]">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
					<path stroke-linecap="round" stroke-linejoin="round" d="M3.75 12h16.5m-16.5 3.75h16.5M3.75 19.5h16.5M5.625 4.5h12.75a1.875 1.875 0 010 3.75H5.625a1.875 1.875 0 010-3.75z" />
					</svg>
				    </div>
				    Đơn mua</div
				>
			    </div>
			</aside>
		    </div>
		    <div class="md:col-span-9 lg:col-span-10">
			<div id="account" class="rounded-sm tab bg-white px-2 pb-10 shadow md:px-7 md:pb-20 px-3">
			    <div class="border-b border-b-gray-200 py-6">
				<h1 class="text-lg font-medium capitalize text-gray-900">Hồ Sơ Của Tôi</h1>
				<div class="mt-1 text-sm text-gray-700">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
			    </div>
			    <div class="mt-8 flex flex-col-reverse md:flex-row md:items-start">
				<form class="mt-6 flex-grow md:mt-0 md:pr-12">
				    <div class="flex flex-col flex-wrap sm:flex-row">
					<div class="truncate pt-3 capitalize sm:w-[20%] sm:text-right">Email</div>
					<div class="sm:w-[80%] sm:pl-5"><div class="pt-3 text-gray-700">${sessionScope.user.email}</div></div>
				    </div>
				    <div class="mt-6 flex flex-col flex-wrap sm:flex-row">
					<div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">Tên</div>
					<div class="sm:w-[80%] sm:pl-5">
					    <div class="">
						<input type="text" placeholder="Tên người dùng" class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm" name="name" />
						<div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
					    </div>
					</div>
				    </div>
				    <div class="mt-2 flex flex-col flex-wrap sm:flex-row">
					<div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">Số điện thoại</div>
					<div class="sm:w-[80%] sm:pl-5">
					    <div class="">
						<input type="text" placeholder="Số điện thoại" class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm" name="phone" value="" />
						<div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
					    </div>
					</div>
				    </div>
				    <div class="mt-2 flex flex-col flex-wrap sm:flex-row">
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
				    </div>
				    <div class="mt-2 flex flex-col flex-wrap sm:flex-row">
					<div class="truncate pt-3 capitalize sm:w-[20%] sm:text-right">Ngày sinh</div>
					<div class="sm:w-[80%] sm:pl-5">
					    <div class="flex justify-between">
						<select name="date" class="focus:border-primary h-10 w-[32%] cursor-pointer rounded-sm border border-black/10 px-3 outline-none">
						    <option value="1">1</option>
						    <option value="2">2</option>
						    <option value="3">3</option>
						    <option value="4">4</option>
						    <option value="5">5</option>
						    <option value="6">6</option>
						    <option value="7">7</option>
						    <option value="8">8</option>
						    <option value="9">9</option>
						    <option value="10">10</option>
						    <option value="11">11</option>
						    <option value="12">12</option>
						    <option value="13">13</option>
						    <option value="14">14</option>
						    <option value="15">15</option>
						    <option value="16">16</option>
						    <option value="17">17</option>
						    <option value="18">18</option>
						    <option value="19">19</option>
						    <option value="20">20</option>
						    <option value="21">21</option>
						    <option value="22">22</option>
						    <option value="23">23</option>
						    <option value="24">24</option>
						    <option value="25">25</option>
						    <option value="26">26</option>
						    <option value="27">27</option>
						    <option value="28">28</option>
						    <option value="29">29</option>
						    <option value="30">30</option>
						    <option value="31">31</option>
						</select>
						<select name="month" class="focus:border-primary h-10 w-[32%] cursor-pointer rounded-sm border border-black/10 px-3 outline-none">
						    <option value="1">Tháng 1</option>
						    <option value="2">Tháng 2</option>
						    <option value="3">Tháng 3</option>
						    <option value="4">Tháng 4</option>
						    <option value="5">Tháng 5</option>
						    <option value="6">Tháng 6</option>
						    <option value="7">Tháng 7</option>
						    <option value="8">Tháng 8</option>
						    <option value="9">Tháng 9</option>
						    <option value="10">Tháng 10</option>
						    <option value="11">Tháng 11</option>
						    <option value="12">Tháng 12</option>
						</select>
						<select name="year" class="focus:border-primary h-10 w-[32%] cursor-pointer rounded-sm border border-black/10 px-3 outline-none">
						    <option class="hover:bg-primary hover:text-white" value="1990">1990</option>
						    <option class="hover:bg-primary hover:text-white" value="1991">1991</option>
						    <option class="hover:bg-primary hover:text-white" value="1992">1992</option>
						    <option class="hover:bg-primary hover:text-white" value="1993">1993</option>
						    <option class="hover:bg-primary hover:text-white" value="1994">1994</option>
						    <option class="hover:bg-primary hover:text-white" value="1995">1995</option>
						    <option class="hover:bg-primary hover:text-white" value="1996">1996</option>
						    <option class="hover:bg-primary hover:text-white" value="1997">1997</option>
						    <option class="hover:bg-primary hover:text-white" value="1998">1998</option>
						    <option class="hover:bg-primary hover:text-white" value="1999">1999</option>
						    <option class="hover:bg-primary hover:text-white" value="2000">2000</option>
						    <option class="hover:bg-primary hover:text-white" value="2001">2001</option>
						    <option class="hover:bg-primary hover:text-white" value="2002">2002</option>
						    <option class="hover:bg-primary hover:text-white" value="2003">2003</option>
						    <option class="hover:bg-primary hover:text-white" value="2004">2004</option>
						    <option class="hover:bg-primary hover:text-white" value="2005">2005</option>
						    <option class="hover:bg-primary hover:text-white" value="2006">2006</option>
						    <option class="hover:bg-primary hover:text-white" value="2007">2007</option>
						    <option class="hover:bg-primary hover:text-white" value="2008">2008</option>
						    <option class="hover:bg-primary hover:text-white" value="2009">2009</option>
						    <option class="hover:bg-primary hover:text-white" value="2010">2010</option>
						    <option class="hover:bg-primary hover:text-white" value="2011">2011</option>
						    <option class="hover:bg-primary hover:text-white" value="2012">2012</option>
						    <option class="hover:bg-primary hover:text-white" value="2013">2013</option>
						    <option class="hover:bg-primary hover:text-white" value="2014">2014</option>
						    <option class="hover:bg-primary hover:text-white" value="2015">2015</option>
						    <option class="hover:bg-primary hover:text-white" value="2016">2016</option>
						    <option class="hover:bg-primary hover:text-white" value="2017">2017</option>
						    <option class="hover:bg-primary hover:text-white" value="2018">2018</option>
						    <option class="hover:bg-primary hover:text-white" value="2019">2019</option>
						    <option class="hover:bg-primary hover:text-white" value="2020">2020</option>
						    <option class="hover:bg-primary hover:text-white" value="2021">2021</option>
						    <option class="hover:bg-primary hover:text-white" value="2022">2022</option>
						    <option class="hover:bg-primary hover:text-white" value="2023">2023</option>
						</select>
					    </div>
					    <div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
					</div>
				    </div>
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
				    <div class="flex flex-col items-center">
					<c:if test="${!sessionScope.user.name.equals('')}">
					    <c:if test="${sessionScope.user.avatar.equals('')}">
						<div class="rounded-full overflow-hidden bg-white relative p-10 mb-5 border-[1px] border-blue-500 mb-5">
						    <div class="absolute font-medium text-[#0261d6] text-2xl top-[50%] left-[50%] translate-x-[-50%] translate-y-[-50%]">${sessionScope.user.name.toUpperCase().charAt(0)}</div>
						</div>
					    </c:if>
					    <c:if test="${!sessionScope.user.avatar.equals('')}">
						<div class="bg-cover mb-5 bg-center bg-[url('https://scontent.fhan20-1.fna.fbcdn.net/v/t39.30808-6/379178696_791051569690767_4898055343665726787_n.jpg?stp=dst-jpg_p526x296&_nc_cat=108&ccb=1-7&_nc_sid=813123&_nc_ohc=NeAh2QdtcNEAX8CTiyx&_nc_ht=scontent.fhan20-1.fna&oh=00_AfALEDX3qqlO-hpw6C_zIrkfLPSmecwE5iW6jAoEN15Lww&oe=651AEE1D')] rounded-full overflow-hidden border-[1px] border-blue-500 w-[80px] h-[80px] box-content"></div>
					    </c:if>	
					</c:if>
					<c:if test="${sessionScope.user.name.equals('')}">
					    <c:if test="${sessionScope.user.avatar.equals('')}">
						<div class="rounded-full overflow-hidden bg-white relative p-10 mb-5 border-[1px] border-blue-500">
						    <div class="absolute font-medium text-[#0261d6] text-2xl top-[50%] left-[50%] translate-x-[-50%] translate-y-[-50%]">${sessionScope.user.username.toUpperCase().charAt(0)}</div>
						</div>
					    </c:if>
					    <c:if test="${!sessionScope.user.avatar.equals('')}">
						<div class="bg-cover mb-5 bg-center bg-[url('https://scontent.fhan20-1.fna.fbcdn.net/v/t39.30808-6/379178696_791051569690767_4898055343665726787_n.jpg?stp=dst-jpg_p526x296&_nc_cat=108&ccb=1-7&_nc_sid=813123&_nc_ohc=NeAh2QdtcNEAX8CTiyx&_nc_ht=scontent.fhan20-1.fna&oh=00_AfALEDX3qqlO-hpw6C_zIrkfLPSmecwE5iW6jAoEN15Lww&oe=651AEE1D')] rounded-full overflow-hidden border-[1px] border-blue-500 w-[80px] h-[80px] box-content"></div>
					    </c:if>	
					</c:if>
					<div>
					    <input type="file" class="hidden" accept=".jpg,.jpeg,.png" />
					    <button class="flex h-10 items-center justify-end rounded-sm border bg-white px-6 text-sm text-gray-600 shadow-sm">Chọn ảnh</button>
					</div>
					<div class="mt-3 text-gray-400">
					    <div>Dụng lượng file tối đa 1 MB</div>
					    <div>Định dạng .jpg .jpeg .png</div>
					</div>
				    </div>
				</div>
			    </div>
			</div>







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
					    <div class="mt-1 text-red-600 min-h-[1.25rem] text-sm">
						<!--err--> 
					    </div>
					</div>
				    </div>
				    <div class="mt-2 flex flex-col flex-wrap sm:flex-row">
					<div class="capitalize sm:w-[20%] sm:pt-3 sm:text-right">Nhập lại mật khẩu mới</div>
					<div class="sm:w-[80%] sm:pl-5">
					    <div class="undefined relative">
						<input required type="password" placeholder="Xác nhận mật khẩu mới" class="w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm" name="confirm_password">
					    </div>
					    <div class="mt-1 text-red-600 min-h-[1.25rem] text-sm">
					    </div>
					</div>
				    </div>
				    <div class="mt-2 flex flex-col flex-wrap sm:flex-row">
					<div class="truncate capitalize sm:w-[20%] sm:pt-3 sm:text-right">
					</div>
					<div class="sm:w-[80%] sm:pl-5">
					    <div>
						<button type="submit" class="w-full bg-blue-500 py-3 px-2 text-center text-sm uppercase text-white hover:bg-blue-600 rounded-sm">Cập nhật mật khẩu</button>
					    </div>
					</div>
				    </div>
				</form>
			    </div>
			</div>


















			<div id="orders" class="tab"><div class="overflow-x-auto"><div class="min-w-[700px]"><div class="sticky top-0 flex rounded-t-sm shadow-sm"><a class="flex flex-1 items-center justify-center border-b-2 bg-white py-4 text-center border-b-primary text-primary" href="/user/order-history?status=0">Tất cả</a><a class="flex flex-1 items-center justify-center border-b-2 bg-white py-4 text-center border-b-black/10 text-gray-900" href="/user/order-history?status=1">Chờ xác nhận</a><a class="flex flex-1 items-center justify-center border-b-2 bg-white py-4 text-center border-b-black/10 text-gray-900" href="/user/order-history?status=2">Chờ lấy hàng</a><a class="flex flex-1 items-center justify-center border-b-2 bg-white py-4 text-center border-b-black/10 text-gray-900" href="/user/order-history?status=3">Đang giao</a><a class="flex flex-1 items-center justify-center border-b-2 bg-white py-4 text-center border-b-black/10 text-gray-900" href="/user/order-history?status=4">Đã giao</a><a class="flex flex-1 items-center justify-center border-b-2 bg-white py-4 text-center border-b-black/10 text-gray-900" href="/user/order-history?status=5">Đã hủy</a></div><div><div class="mt-4 rounded-sm border-black/10 bg-white p-6 text-gray-800 shadow-sm"><a class="flex" href="/Điện-thoại-Apple-Iphone-12-64GB--Hàng-chính-hãng-VNA-60afb1c56ef5b902180aacb8"><div class="flex-shrink-0"><img class="h-20 w-20 object-cover" src="https://api-ecom.duthanhduoc.com/images/a7fb7a18-743a-42bb-bead-36370c1d1aba.jpg" alt="Điện thoại Apple Iphone 12 64GB - Hàng chính hãng VNA"></div><div class="ml-3 flex-grow overflow-hidden"><div class="truncate">Điện thoại Apple Iphone 12 64GB - Hàng chính hãng VNA</div><div class="mt-3">x1</div></div><div class="ml-3 flex-shrink-0"><span class="truncate text-gray-500 line-through">₫26.990.000</span><span class="ml-2 truncate text-primary">₫20.990.000</span></div></a><div class="flex justify-end"><div><span>Tổng giá tiền</span><span class="ml-4 text-xl text-primary">₫20.990.000</span></div></div></div><div class="mt-4 rounded-sm border-black/10 bg-white p-6 text-gray-800 shadow-sm"><a class="flex" href="/Áo-Cotton-Nam-Đông-Xuân-Cộc-Tay-Và-Ba-Lỗ--Video-Ảnh-Thật--60ad04e32fb52902585972ad"><div class="flex-shrink-0"><img class="h-20 w-20 object-cover" src="https://api-ecom.duthanhduoc.com/images/a1c873c9-a1e3-477e-8a09-e9bd6e43b1cf.jpg" alt="Áo Cotton Nam Đông Xuân Cộc Tay Và Ba Lỗ ( Video+ Ảnh Thật )"></div><div class="ml-3 flex-grow overflow-hidden"><div class="truncate">Áo Cotton Nam Đông Xuân Cộc Tay Và Ba Lỗ ( Video+ Ảnh Thật )</div><div class="mt-3">x1</div></div><div class="ml-3 flex-shrink-0"><span class="truncate text-gray-500 line-through">₫70.000</span><span class="ml-2 truncate text-primary">₫37.000</span></div></a><div class="flex justify-end"><div><span>Tổng giá tiền</span><span class="ml-4 text-xl text-primary">₫37.000</span></div></div></div><div class="mt-4 rounded-sm border-black/10 bg-white p-6 text-gray-800 shadow-sm"><a class="flex" href="/Điện-Thoại-Realme-C11-2GB32GB--Hàng-Chính-Hãng-60afb14d6ef5b902180aacb7"><div class="flex-shrink-0"><img class="h-20 w-20 object-cover" src="https://api-ecom.duthanhduoc.com/images/51ef469d-0eb5-48fb-958d-ce2b9c664adc.jpg" alt="Điện Thoại Realme C11 (2GB/32GB) - Hàng Chính Hãng"></div><div class="ml-3 flex-grow overflow-hidden"><div class="truncate">Điện Thoại Realme C11 (2GB/32GB) - Hàng Chính Hãng</div><div class="mt-3">x1</div></div><div class="ml-3 flex-shrink-0"><span class="truncate text-gray-500 line-through">₫2.690.000</span><span class="ml-2 truncate text-primary">₫2.130.000</span></div></a><div class="flex justify-end"><div><span>Tổng giá tiền</span><span class="ml-4 text-xl text-primary">₫2.130.000</span></div></div></div></div></div></div></div>
		    </div>
		</div>
	    </div>
	</div>



	<%@include file="components/footer.jsp" %>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
	<script src="./static/js/account.js"></script>
	<script src="static/js/cityAPI.js"></script>
    </body>
</html>
