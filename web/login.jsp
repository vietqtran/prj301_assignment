<%--
    Document   : login
    Created on : Sep 19, 2023, 4:49:39 PM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Mooru | Login</title>
	<link rel="icon" href="./static/images/logo/icon-logo.png" type="image/png" sizes="32x32">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <header class="bg-white py-5">
	    <div class="container mx-auto">
		<div class="container mx-auto flex items-center justify-between px-5">
		    <div class="flex items-center justify-start">
			<img src="./static/logo/text-logo.png" class="w-[100px]" alt="" />
			<div class="text-2xl font-semibold ml-4 hidden sm:block">Đăng nhập</div>
		    </div>
		    <div class="text-blue-500">Bạn cần giúp đỡ?</div>
		</div>
	    </div>
	</header>
	<div class="h-full bg-blue-500  border-b-4 border-blue-500">
	    <div class="lg:bg-shopee-pattern container mx-auto lg:bg-no-repeat">
		<div class="grid grid-cols-1 py-12 lg:grid-cols-5 lg:py-24 lg:pr-10">
		    <div class="lg:col-span-2 lg:col-start-4">
			<form class="m-4 rounded bg-white p-10 shadow-sm" method="POST" action="login">
			    <div class="text-2xl">Đăng nhập tài khoản</div>
			    <div class="mt-8">
				<input required="" value="${requestScope.email!=null?requestScope.email:cookie.email.value}" type="email" placeholder="Địa chỉ e-mail" class="w-full rounded-sm border border-gray-300 p-3 outline-none focus:border-gray-500 focus:shadow-sm" name="email" />
			    </div>
			    <div class="mt-5">
				<input required="" value="${requestScope.password!=null?requestScope.password:cookie.password.value}" type="password" placeholder="Nhập mật khẩu của bạn" class="w-full rounded-sm border border-gray-300 p-3 outline-none focus:border-gray-500 focus:shadow-sm" name="password" />
			    </div>
			    <c:if test="${requestScope.message!=null}">
				<div class="my-3 min-h-[1.25rem] text-sm text-red-600">${requestScope.message}</div>
			    </c:if>
			    <div class="my-3">
				<input type="checkbox" name="remember" id="remember" ${cookie.remember.value!=null?'checked':''}>
				<label for="remember">Remember me</label>
			    </div>
			    <div class="mt-1">
				<button type="submit" class="undefined w-full bg-blue-600 px-2 py-3 text-center text-sm uppercase text-white hover:bg-blue-700">Đăng nhập</button>
			    </div>
			    <div class="mt-8 flex items-center justify-center">
				<span class="text-gray-400">Bạn chưa có tài khoản?</span>
				<a class="ml-1 text-blue-500 underline" href="register">Đăng kí</a>
			    </div>
			</form>
		    </div>
		</div>
	    </div>
	</div>

	<%@include file="./components/footer.jsp" %>
    </body>
</html>

