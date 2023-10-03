/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


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
    document.getElementById("modal_userId").innerHTML = u.parentNode.parentNode.getAttribute('data-user-id');
    document.getElementById("modal_username").innerHTML = u.parentNode.parentNode.getAttribute('data-user-username');
    document.getElementById("modal_email").innerHTML = u.parentNode.parentNode.getAttribute('data-user-email');
    document.getElementById("modal_name").innerHTML = u.parentNode.parentNode.getAttribute('data-user-name');
    document.getElementById("modal_phone").innerHTML = u.parentNode.parentNode.getAttribute('data-user-phone');
    document.getElementById("modal_address").innerHTML = u.parentNode.parentNode.getAttribute('data-user-address');
    let role = ''
    if (u.parentNode.parentNode.getAttribute('data-user-role') == 1) {
	role = "Admin"
    }
    if (u.parentNode.parentNode.getAttribute('data-user-role') == 2) {
	role = "Staff"
    }
    if (u.parentNode.parentNode.getAttribute('data-user-role') == 3) {
	role = "Seller"
    }
    if (u.parentNode.parentNode.getAttribute('data-user-role') == 4) {
	role = "User"
    }
    if (u.parentNode.parentNode.getAttribute('data-user-avatar') !== "") {
	document.getElementById("viewUserImageContainer").style.display = "flex"
	document.getElementById("viewUserImage").src = u.parentNode.parentNode.getAttribute('data-user-avatar')
    } else {
	document.getElementById("viewUserImageContainer").style.display = "none"
    }
    document.getElementById("modal_role").innerHTML = role;
    document.getElementById("delete_link").href = "check?action=deleteUser&id=" + u.parentNode.parentNode.getAttribute('data-user-id')
    document.getElementById("cover").style.display = "flex"
}


function handleViewShop(s) {
    document.getElementById("cover").style.display = "flex"
    document.getElementById("modal_shopId").innerHTML = s.parentNode.parentNode.getAttribute('data-shop-id');
    document.getElementById("modal_shopName").innerHTML = s.parentNode.parentNode.getAttribute('data-shop-name');
    document.getElementById("modal_shopEmail").innerHTML = s.parentNode.parentNode.getAttribute('data-shop-email');
    document.getElementById("modal_shopAddress").innerHTML = s.parentNode.parentNode.getAttribute('data-shop-address');
    document.getElementById("modal_shopCreateDate").innerHTML = s.parentNode.parentNode.getAttribute('data-shop-createDate');
    document.getElementById("modal_shopActive").innerHTML = s.parentNode.parentNode.getAttribute('data-shop-active');
    document.getElementById("shopAvatar").src = s.parentNode.parentNode.getAttribute('data-shop-avatar');
    if (s.parentNode.parentNode.getAttribute('data-shop-active') == "true") {
	document.getElementById("disable_shop_btn").style.display = 'block'
	document.getElementById("disable_link").href = "check?action=disableShop&id=" + s.parentNode.parentNode.getAttribute('data-shop-id');
	document.getElementById("enable_shop_btn").style.display = 'none'
    } else {
	document.getElementById("enable_shop_btn").style.display = 'block'
	document.getElementById("enable_link").href = "check?action=enableShop&id=" + s.parentNode.parentNode.getAttribute('data-shop-id');
	document.getElementById("disable_shop_btn").style.display = 'none'
    }
}



function closeModal() {
    document.getElementById("cover").style.display = "none"
    document.getElementById("add_user").style.display = 'none'
}



function handleClickContent(event) {
    event.stopPropagation()
}



function toggleAdduserModal() {
    if (document.getElementById("add_user").style.display === 'none') {
	document.getElementById("add_user").style.display = 'flex'
    } else {
	document.getElementById("add_user").style.display = 'none'
    }
}
