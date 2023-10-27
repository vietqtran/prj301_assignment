/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const previewImages = document.querySelectorAll(".previewImage")

previewImages.forEach(function (element) {
    element.addEventListener("click", () => {
	for (var i = 0; i < previewImages.length; i++) {
	    previewImages[i].parentNode.parentNode.classList.remove('border-blue-500')
	    previewImages[i].parentNode.parentNode.classList.add('border-white')
	}
	element.parentNode.parentNode.classList.remove('border-white')
	element.parentNode.parentNode.classList.add('border-blue-500')
	document.getElementById("previewImage").src = element.src
    });
});


const quantityPreview = document.getElementById("quantityPreview")
const quantityInput = document.getElementById("quantityInput")

quantityPreview.textContent = quantityInput.value
function descreseQuantity() {
    let quantity = parseInt(quantityInput.value)
    if (quantity > 1) {
	quantityInput.value = quantity - 1
	quantityPreview.textContent = quantityInput.value
    }
}

let maxValue = 0

function increaseQuantity() {
    let quantity = parseInt(quantityInput.value)
    if (quantity < maxValue) {
	quantityInput.value = quantity + 1
	quantityPreview.textContent = quantityInput.value
    }
}

function setQuantity(quantity) {
    document.getElementById("quantity").textContent = quantity;
    maxValue = parseInt(quantity)

}


setQuantity(document.getElementById("quantity").textContent)

const quantityForm = document.getElementById("quantityForm");
const addcartBtn = document.getElementById("addcartBtn");
const buyNowBtn = document.getElementById("buyNowBtn");

addcartBtn.addEventListener('click', () => {
    var action = "addToCart"
    quantityForm.action = action
    quantityForm.submit()
})


const productOptions = document.querySelectorAll(".productOption")
const productOptionInputs = document.querySelectorAll(".productOptionInput")



productOptions.forEach(function (element, index) {
    element.addEventListener('click', () => {
	quantityInput.value = 1
	quantityPreview.textContent = quantityInput.value
	for (let i = 0; i < productOptions.length; i++) {
	    productOptions[i].classList.remove('border-blue-500')
	    productOptions[i].classList.remove('text-blue-500')
	    productOptionInputs[i].checked = false
	}
	element.classList.remove('text-gray-500')
	element.classList.remove('border-gray-300')
	element.classList.add('border-blue-500')
	element.classList.add('text-blue-500')
	productOptionInputs[index].checked = true
    })
})

function selectRateTab(index, btn) {
    const rateBtns = document.getElementsByClassName("rateBtn")
    const rates = document.getElementsByClassName("rates")
    for (var i = 0; i < rateBtns.length; i++) {
	rateBtns[i].classList.remove('bg-blue-500')
	rateBtns[i].classList.remove('text-white')
    }
    btn.classList.add('bg-blue-500')
    btn.classList.add('text-white')
    for (var i = 0; i < rates.length; i++) {
	rates[i].style.display = 'none'
    }
    if(index==0){
	document.getElementById('allRate').style.display = 'block'
    }
    if(index==1){
	document.getElementById('star5').style.display = 'block'
    }
    if(index==2){
	document.getElementById('star4').style.display = 'block'
    }
    if(index==3){
	document.getElementById('star3').style.display = 'block'
    }
    if(index==4){
	document.getElementById('star2').style.display = 'block'
    }
    if(index==5){
	document.getElementById('star1').style.display = 'block'
    }
    if(index==6){
	document.getElementById('allRateContent').style.display = 'block'
    }
}