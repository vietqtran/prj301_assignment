/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function showOldPass() {
    let input = document.getElementById("change_password_old")
    if (input.type === 'text') {
	input.type = 'password'
    } else {
	input.type = 'text'
    }
}

function showNewPass() {
    let input = document.getElementById("change_password_new")
    if (input.type === 'text') {
	input.type = 'password'
    } else {
	input.type = 'text'
    }
}

function selectStar(index) {
    console.log(index)
    const starOutlines = document.getElementsByClassName("starOutline")
    const starSolids = document.getElementsByClassName("starSolid")
    for (var i = 0; i < starSolids.length; i++) {
	starSolids[i].style.display = 'none'
    }
    for (var i = 0; i < starOutlines.length; i++) {
	starOutlines[i].style.display = 'block'
    }
    for (var i = 0; i <= index; i++) {
	starSolids[i].style.display = 'block'
    }
    for (var i = 0; i <= index; i++) {
	starOutlines[i].style.display = 'none'
    }
    document.getElementById("starRate").value = index + 1
}

function toggleRateModal() {
    let rateModal = document.getElementById("rateModal")
    if (rateModal.style.display === 'none') {
	rateModal.style.display = 'flex'
    } else {
	rateModal.style.display = 'none'
    }
}

function clickContent(event) {
    event.stopPropagation()
}

function rateButton(id) {
    toggleRateModal()
    document.getElementById("productIdRate").value = id
}

function handleSubmitRate() {
    if (document.getElementById("starRate").value !== '') {
	document.getElementById("rateForm").submit()
    }
}

function changeAvatarButton() {
    document.getElementById("fileInput").click()
}

const inputFile = document.getElementById('fileInput');
inputFile.addEventListener('change', () => {
    document.getElementById('buttonOpenFile').style.display = 'none'
    document.getElementById("buttonSubmitForm").style.display = "flex"
});