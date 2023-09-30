<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mooru | Home</title>
        <link rel="icon" href="./static/logo/icon-logo.png" type="image/png" sizes="32x32">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>

	<%@include file="./components/header.jsp" %>

	<div class="bg-slate-200 py-10  border-b-4 border-blue-500">
	    <div class="container mx-auto max-w-[1250px] px-2">
		<div class="container mx-auto grid lg:grid-cols-6 gap-3 md:grid-cols-5 sm:grid-cols-4 grid-cols-2">
		    <div class="bg-gray-300/40 w-full py-4 mb-5 px-3 lg:col-span-6 md:col-span-5 sm:col-span-4 col-span-2">
			<div class="flex flex-wrap items-center justify-between gap-2">
			    <div class="flex flex-wrap items-center gap-2">
				<div>Sắp xếp theo</div>
				<button class="h-8 bg-primary px-4 text-center text-sm capitalize hover:bg-primary/80 bg-white text-black hover:bg-slate-100">Phổ biến</button>
				<button class="h-8 bg-primary px-4 text-center text-sm capitalize hover:bg-primary/80 bg-white text-black hover:bg-slate-100">Mới nhất</button>
				<button class="h-8 bg-primary px-4 text-center text-sm capitalize hover:bg-primary/80 bg-white text-black hover:bg-slate-100">Bán chạy</button>
				<select class="h-8 px-4 text-left text-sm capitalize outline-none bg-white text-black hover:bg-slate-100">
				    <option value="" class="cursor-not-allowed bg-white text-black hover:bg-slate-100" disabled="">Giá</option>
				    <option value="asc" class="bg-white text-black hover:bg-slate-100">Giá: Thấp đến cao</option>
				    <option value="desc" class="bg-white text-black hover:bg-slate-100">Giá: Cao đến thấp</option>
				</select></div><div class="flex items-center gap-x-2">
				<div>
				    <span class="text-primary">1</span>
				    <span>/2</span>
				</div>
				<div class="flex items-center justify-center">
				    <button class="h-8 cursor-not-allowed rounded-tl-sm rounded-bl-sm bg-white/60 px-3 shadow hover:bg-slate-100">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-3 w-3"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5"></path></svg>
				    </button>
				    <a class="flex h-8 items-center justify-center rounded-tr-sm rounded-br-sm bg-white px-3 shadow hover:bg-slate-100" href="/?page=2"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-3 w-3"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5"></path></svg>
				    </a>
				</div>
			    </div>
			</div>
		    </div>
		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>


		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		    <div class="col-span-1">
			<a href="/Điện-Thoại-Vsmart-Active-3-6GB64GB--Hàng-Chính-Hãng-60afb2c76ef5b902180aacba"
			   >
			    <div class="overflow-hidden rounded-sm bg-white shadow transition-all duration-200 hover:translate-y-[-0.09rem] hover:border-[1px] hover:border-blue-500 hover:shadow-md">
				<div class="relative w-full pt-[100%]"><img src="https://api-ecom.duthanhduoc.com/images/bbea6d3e-e5b1-494f-ab16-02eece816d50.jpg" alt="Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng" class="absolute left-0 top-0 h-full w-full bg-white object-cover" /></div>
				<div class="overflow-hidden p-2">
				    <div class="line-clamp-2 min-h-[2rem] text-xs">Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng</div>
				    <div class="mt-3 flex items-center justify-start gap-x-1">
					<div class="max-w-[50%] truncate text-gray-500 line-through"><span class="text-xs">₫</span><span class="text-sm">3.990.000</span></div>
					<div class="text-primary truncate text-blue-500"><span class="text-xs">₫</span><span class="text-[16px] text-sm">3.190.000</span></div>
				    </div>
				    <div class="mt-3 flex items-center justify-start gap-x-2">
					<div class="flex items-center justify-start relative w-[50px]">
					    <img src="./static/images/stars-gray.png" alt="alt" class="h-[8px] w-full absolute z-40 left-0"/>
					    <div class="h-[8px] w-[50%] overflow-hidden absolute z-50 left-0">
						<img src="./static/images/star-yellow.png" alt="alt" class="h-[8px] max-w-[50px]"/>
					    </div>
					</div>
					<div class="flex gap-x-1 text-xs"><span>1,2k</span><span>Đã bán</span></div>
				    </div>
				</div>
			    </div>
			</a>
		    </div>

		</div>
	    </div>
	    <div class="mt-6 flex flex-wrap justify-center">
		<button class="cursor-not-allowed bg-white bg-opacity-30 px-3 py-2 shadow-sm hover:bg-gray-100">&lt; Prev</button>
		<a class="cursor-pointer px-3 py-2 shadow-sm bg-primary text-white hover:bg-primary" href="/?page=1">1</a>
		<a class="cursor-pointer px-3 py-2 shadow-sm bg-white hover:bg-gray-100" href="/?page=2">2</a>
		<a class="cursor-pointer bg-white px-3 py-2 shadow-sm hover:bg-gray-100" href="/?page=2">Next &gt;</a>
	    </div>
	</div>
	<%@include file="./components/footer.jsp" %>
    </body>
</html>
