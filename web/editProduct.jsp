<%-- 
    Document   : editProduct
    Created on : Oct 8, 2023, 8:11:39 PM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="vietqtran.services.CategoryDAO" %>
<%@page import="vietqtran.model.Category" %>
<%@page import="vietqtran.services.ColorDAO" %>
<%@page import="vietqtran.model.Color" %>
<%@page import="java.sql.SQLException" %>
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
	<script src="https://cdn.ckeditor.com/ckeditor5/35.2.1/adapter-ckfinder/ckfinder.js"></script>
    </head>
    <body>
	<form action="edit-product" method="POST" class="grid gap-4 text-sm grid-cols-1 md:grid-cols-5 mx-auto container max-w-[1250px] p-5">
	    <input type="text" name="id" class="hidden" value="${requestScope.product.id}">
	    <div class="md:col-span-5">
		<label for="name">Product Name<span class="text-red-500">*</span></label>
		<input type="text" value="${requestScope.product.name}" name="name" id="name" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
	    </div>
	    <div class="grid grid-cols-2 gap-x-4 w-full col-span-1 md:col-span-5">
		<div class="w-full col-span-1">
		    <label for="price">Price<span class="text-red-500">*</span></label>
		    <input type="number" value="${requestScope.product.price}" name="price" id="price" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
		</div>
		<div class="w-full col-span-1">
		    <label for="salePrice">Sale Price <span class="text-red-500">*</span></label>
		    <input type="number" value="${requestScope.product.salePrice}" name="salePrice" id="salePrice" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
		</div>
	    </div>
	    <div class="w-full col-span-1 md:col-span-5">
		<label for="description">Description <span class="text-red-500 mb-1">*</span></label>
		<textarea name="description" id="editor" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required>
		    <c:out value="${requestScope.product.description}" />
		</textarea>
	    </div>
	    <div class="grid grid-cols-2 gap-x-4 w-full col-span-1 md:col-span-5">
		<div class="w-full col-span-1">
		    <select name="color" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required>
			<%
			    ColorDAO colorDao = new ColorDAO();
			    List<Color> colors = colorDao.getAll();
			    try {
				colorDao.closeConnection();
			    } catch (SQLException ex) {
			    }
			%>
			<c:forEach items="<%=colors%>" var="color">
			    <option value="${color.id}" ${requestScope.product.color==color.id?'selected':''}>${color.name}</option>
			</c:forEach>
		    </select>
		</div>
		<div class="w-full col-span-1">
		    <select name="category" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required>
			<%
			    CategoryDAO categoryDao = new CategoryDAO();
			    List<Category> categories = categoryDao.getAll();
			    try {
				categoryDao.closeConnection();
			    } catch (SQLException ex) {
			    }
			%>
			<c:forEach items="<%=categories%>" var="category">
			    <option value="${category.id}" ${requestScope.product.categoryId==category.id?'selected':''}>${category.name}</option>
			</c:forEach>
		    </select>
		</div>
	    </div>
	    <div class="w-full col-span-1 gap-y-4 md:col-span-5 grid grid-cols-1 md:grid-cols-2">
		<div class="col-span-1">
		    <div>
			<label for="mainImage">Main Image</label>
			<br/>
			<input id="mainImageValue" class="hidden" type="text"  value="${requestScope.product.url}" name="mainImage">
			<input id="mainImage" class="block" type="file"/>
		    </div>
		    <div id="mainImagePreviewContainer" class="mt-2" style="display: block">
			<img id="mainImagePreview" class="w-[150px] h-[250px] object-cover" src="${requestScope.product.url}" alt="alt"/>
		    </div>
		    <div id="subImages" class="mt-5 w-full col-span-1 md:col-span-5">
			<c:forEach items="${requestScope.subImages}" var="image" varStatus="loop">
			    <div class="sub subImage w-full mb-3 col-span-1 md:col-span-5 flex flex-col items-start justify-start">
				<div class="flex items-center justify-between">
				    <div>
					<label for="subImage${loop.index+1}">Image ${loop.index+1}</label>
					<br/>
					<input id="subImageValue${loop.index+1}" value="${image.imageUrl}" class="hidden" type="text" name="subImage">
				    </div>
				    <button onclick="removeSubImage(this)" type="button" class="p-2 rounded-sm hover:bg-slate-100">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-3 h-3">
					<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
					</svg>
				    </button>
				</div>
				<div id="subImagePreviewContainer${loop.index+1}" class="mt-2">
				    <img id="subImagePreview${loop.index+1}" class="w-[150px] h-[250px] object-cover" src="${image.imageUrl}" alt="alt"/>
				</div>
			    </div>
			</c:forEach>
		    </div>
		    <button id="addImageButton" type="button" class="w-fit text-sm rounded-sm py-1 px-2 text-white bg-blue-500">Add Image</button>
		</div>
		<div class="col-span-1 md:pt-5 pt-0">
		    <div id="sizeContainer">
			<c:forEach items="${requestScope.sizes}" var="size">
			    <div class="flex items-center justify-start w-full mb-2">
				<div class="flex items-center justify-start">
				    <div class="mr-2">
					<label>Size<span class="text-red-500">*</span></label>
					<input value="${size.name}" type="text" name="sizeName" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
				    </div>
				    <div class="ml-2">
					<label for="inventory">Inventory<span class="text-red-500">*</span></label>
					<input value="${size.inventory}" type="number" name="inventory" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
				    </div>
				</div>
				<button onclick="removeSize(this)" type="button" class="p-2 rounded-sm hover:bg-slate-100">
				    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-3 h-3">
				    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
				    </svg>
				</button>
			    </div>
			</c:forEach>
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
	<script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js"></script>
	<script src="./static/js/editProduct.js"></script>
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
    </body>
</html>
