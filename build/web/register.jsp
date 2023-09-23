<%-- 
    Document   : register.jsp
    Created on : Sep 19, 2023, 4:58:01 PM
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
        <title>Document</title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,800;1,200;1,600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="./static/css/global.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <div class="flex h-[100vh] w-full">
            <!-- LEFT -->
            <div class="flex h-full w-full items-center justify-center bg-white md:w-1/2">
                <!-- START FORM  -->
                <form action="login" method="POST" class="w-full px-8 xl:w-1/2">
                    <h2 class="text-center text-xl md:text-left">Shopname</h2>
                    <h1 class="mb-10 text-center text-4xl font-bold md:text-left">Sign up</h1>
                    <div class="flex items-center justify-center">
                        <div class="group relative z-0 mb-10 mr-4 w-full">
                            <input type="text" name="firstName" id="firstName" class="text-md peer block w-full appearance-none border-0 border-b-2 border-gray-900 bg-transparent px-0 py-2.5 text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                            <label for="firstName" class="absolute top-3 -z-10 origin-[0] -translate-y-6 scale-75 transform text-sm text-gray-900 duration-300 peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:left-0 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:font-medium peer-focus:text-blue-600">First name</label>
                        </div>
                        <div class="group relative z-0 mb-10 ml-4 w-full">
                            <input type="text" name="lastName" id="lastName" class="text-md peer block w-full appearance-none border-0 border-b-2 border-gray-900 bg-transparent px-0 py-2.5 text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                            <label for="lastName" class="absolute top-3 -z-10 origin-[0] -translate-y-6 scale-75 transform text-sm text-gray-900 duration-300 peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:left-0 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:font-medium peer-focus:text-blue-600">Last name</label>
                        </div>
                    </div>
                    <div class="group relative z-0 mb-10 w-full">
                        <input type="email" name="email" id="email" class="text-md peer block w-full appearance-none border-0 border-b-2 border-gray-900 bg-transparent px-0 py-2.5 text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                        <label for="email" class="absolute top-3 -z-10 origin-[0] -translate-y-6 scale-75 transform text-sm text-gray-900 duration-300 peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:left-0 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:font-medium peer-focus:text-blue-600">Email</label>
                    </div>
                    <div class="group relative z-0 mb-10 w-full">
                        <input type="password" name="password" id="password" class="text-md peer block w-full appearance-none border-0 border-b-2 border-gray-900 bg-transparent px-0 py-2.5 pr-12 text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                        <label for="password" class="absolute top-3 -z-10 origin-[0] -translate-y-6 scale-75 transform text-sm text-gray-900 duration-300 peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:left-0 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:font-medium peer-focus:text-blue-600">Password</label>
                        <!-- <div class="showPass">
                          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-6 w-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                          </svg>
                        </div> -->
                        <div onclick="showPass()" class="hidePass absolute right-[10px] top-[5px] cursor-pointer rounded-full p-2 hover:bg-slate-50">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-5 w-5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.894 7.894L21 21m-3.228-3.228l-3.65-3.65m0 0a3 3 0 10-4.243-4.243m4.242 4.242L9.88 9.88" />
                            </svg>
                        </div>
                    </div>
                    <div class="group relative z-0 mb-4 w-full">
                        <input type="password" name="confirmPassword" id="confirmPassword" class="text-md peer block w-full appearance-none border-0 border-b-2 border-gray-900 bg-transparent px-0 py-2.5 text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                        <label for="confirmPassword" class="absolute top-3 -z-10 origin-[0] -translate-y-6 scale-75 transform text-sm text-gray-900 duration-300 peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:left-0 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:font-medium peer-focus:text-blue-600">Confirm password</label>
                    </div>
                    <p class="mb-6 mt-2 block font-semibold text-rose-500">Incorrect email or password!</p>
                    <button class="button mt-5 w-full rounded-lg bg-blue-500 py-2 text-white">Sign up</button>
                    <p class="mt-5 text-center">Already have an account yet? <a href="login" class="font-medium text-blue-500 underline">Sign in</a></p>
                </form>
            </div>
            <!-- RIGHT  -->
            <div class="h-full w-0 md:w-[50%]">
                <img src='${'./images/avatar.jpg'}' class="h-full w-full object-cover" alt="image" />
            </div>
        </div>
    </body>
</html>

