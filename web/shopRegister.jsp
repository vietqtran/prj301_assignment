<%-- 
    Document   : shopRegister
    Created on : Oct 6, 2023, 5:27:23 PM
    Author     : tranq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru Shop | Register</title>
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
			<div class="text-2xl font-semibold ml-4 hidden sm:block">Đăng kí</div>
		    </div>
		    <div class="text-blue-500">Bạn cần giúp đỡ?</div>
		</div>
	    </div>
	</header>


	<div class="h-full bg-blue-500  border-b-4 border-blue-500 ">
	    <div class="w-full container mx-auto">
		<div class="w-full py-10">
		    <form class="mx-auto block m-4 rounded bg-white p-10 shadow-sm max-w-[500px]" method="POST" action="shopRegister">
			<div>
			    <div class="text-2xl">Đăng ký tài khoản</div>
			    <div class="mt-8">
				<input required value="${requestScope.email}" type="email" placeholder="Địa chỉ e-mail" class="w-full rounded-sm border border-gray-300 p-3 outline-none focus:border-gray-500 focus:shadow-sm" name="email" />
				<div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
			    </div>
			    <div class="mt-1">
				<input required value="${requestScope.password}" type="password" placeholder="Nhập mật khẩu của bạn" class="w-full rounded-sm border border-gray-300 p-3 outline-none focus:border-gray-500 focus:shadow-sm" name="password" />
				<div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
			    </div>
			    <div class="mt-1">
				<input required type="password" placeholder="Nhập lại mật khẩu của bạn" class="w-full rounded-sm border border-gray-300 p-3 outline-none focus:border-gray-500 focus:shadow-sm" name="confirm_password" />
				<div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
			    </div>
			    <c:if test="${requestScope.loginMessage!=null}">
				<div class="my-3 mt-0 min-h-[1.25rem] text-sm text-red-600">${requestScope.message}</div>
			    </c:if>
			</div>
			<div>
			    <div class="text-2xl">Thông tin cơ bản</div>
			    <div class="mt-8">
				<input required value="${requestScope.shopName}" type="text" placeholder="Tên Shop" class="w-full rounded-sm border border-gray-300 p-3 outline-none focus:border-gray-500 focus:shadow-sm" name="shop_name" />
				<div class="mt-1 min-h-[1.25rem] text-sm text-red-600"></div>
			    </div>
			    <span>Địa chỉ</span>
			    <div class="flex justify-between mt-1">
				<select required id="city" name="city"class="focus:border-primary h-10 w-[32%] cursor-pointer rounded-sm border border-black/10 px-3 outline-none">
				    <option value="" class="py-2" selected></option>
				</select>
				<select required id="district" name="district" class="focus:border-primary h-10 w-[32%] cursor-pointer rounded-sm border border-black/10 px-3 outline-none">
				    <option value="" selected></option>
				</select>
				<select required id="ward" name="ward" class="focus:border-primary h-10 w-[32%] cursor-pointer rounded-sm border border-black/10 px-3 outline-none">
				    <option value=""  selected></option>
				</select>
			    </div>
			    <input required type="text" placeholder="Số nhà, tên đường" class="mt-3 mb-5 w-full rounded-sm border border-gray-300 px-3 py-2 outline-none focus:border-gray-500 focus:shadow-sm" name="detail" />
			    <span>Ảnh đại diện</span>			    
			    <input required id="fileInput" class="block w-full mb-5 text-xs text-gray-900 border border-gray-300 cursor-pointer focus:outline-none " type="file">
			    <input id="avatarUrl" type="text" name="avatar" class="hidden">			    
			    <div id="avatarPreviewContainer" style="display: none" class="w-full flex items-center justify-center">
				<img id="avatarPreview" src="src" alt="alt" class="w-[200px] h-[200px] object-cover"/>
			    </div>
			    <c:if test="${requestScope.inforMessage!=null}">
				<div class="my-3 mt-0 min-h-[1.25rem] text-sm text-red-600">${requestScope.message}</div>
			    </c:if>
			</div>
			<div class="mt-1">
			    <button type="submit" class="undefined w-full bg-blue-600 px-2 py-3 text-center text-sm uppercase text-white hover:bg-blue-700">Đăng ký</button>
			</div>
			<div class="mt-8 flex items-center justify-center">
			    <span class="text-gray-400">Bạn đã có tài khoản?</span>
			    <a class="ml-1 text-blue-500 underline" href="shopLogin">Đăng nhập</a>
			</div>
		    </form>
		</div>
	    </div>
	</div>
    </div>

    <%@include file="./components/footer.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script src="./static/js/cityAPI.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js"></script>
    <script src="static/js/uploadFirebase.js"></script>
</body>
</html>
