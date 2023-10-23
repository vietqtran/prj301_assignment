<%-- 
    Document   : shopLogin
    Created on : Oct 6, 2023, 11:03:17 AM
    Author     : tranq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru Shop | Login</title>
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
	    <div class="container mx-auto py-10">
		<form class="m-4 rounded mx-auto bg-white p-10 shadow-sm max-w-[500px]" method="POST" action="shopLogin">
		    <div class="text-2xl">Đăng nhập tài khoản</div>
		    <div class="mt-8">
			<input required="" type="email" placeholder="Địa chỉ e-mail" class="w-full rounded-sm border border-gray-300 p-3 outline-none focus:border-gray-500 focus:shadow-sm" name="email" />
		    </div>
		    <div class="mt-5">
			<input required=""  type="password" placeholder="Nhập mật khẩu của bạn" class="w-full rounded-sm border border-gray-300 p-3 outline-none focus:border-gray-500 focus:shadow-sm" name="password" />
		    </div>
		    <c:if test="${requestScope.message!=null}">
			<div class="my-3 min-h-[1.25rem] text-sm text-red-600">${requestScope.message}</div>
		    </c:if>
		    <div class="mt-1">
			<button type="submit" class="undefined w-full bg-blue-600 px-2 py-3 text-center text-sm uppercase text-white hover:bg-blue-700">Đăng nhập</button>
		    </div>
		    <div class="mt-8 flex items-center justify-center">
			<span class="text-gray-400">Bạn chưa có tài khoản?</span>
			<a class="ml-1 text-blue-500 underline" href="shopRegister">Đăng kí</a>
		    </div>
		</form>
	    </div>
	</div>

	<%@include file="./components/footer.jsp" %>
    </body>
</html>
