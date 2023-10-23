/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function checkAllInShop(checkbox) {
    const productCheckboxs = checkbox.parentNode.parentNode.getElementsByClassName("productCheckbox");
    if (checkbox.checked === true) {
	for (var i = 0; i < productCheckboxs.length; i++) {
	    productCheckboxs[i].checked = true
	}
    } else {
	for (var i = 0; i < productCheckboxs.length; i++) {
	    productCheckboxs[i].checked = false
	}
    }
    handleCheckProduct()
}

const productCheckboxs = document.getElementsByClassName("productCheckbox");
function checkAll(checkbox) {
    const shopCheckboxs = document.getElementsByClassName("shopCheckbox");
    if (checkbox.checked === true) {
	for (var i = 0; i < productCheckboxs.length; i++) {
	    productCheckboxs[i].checked = true
	}
	for (var i = 0; i < shopCheckboxs.length; i++) {
	    shopCheckboxs[i].checked = true
	}
    } else {
	for (var i = 0; i < productCheckboxs.length; i++) {
	    productCheckboxs[i].checked = false
	}
	for (var i = 0; i < shopCheckboxs.length; i++) {
	    shopCheckboxs[i].checked = false
	}
    }
    handleCheckProduct()
}

function handleSubmit() {
    const checked = document.querySelectorAll('.productCheckbox:checked');
    if (checked.length === 0) {
	alert("Please select 1 product to order!")
    } else {
	document.getElementById("productSelect").submit()
    }
}

function handleCheckProduct() {
    const checked = document.querySelectorAll('.productCheckbox:checked');
    const quantity = checked.length;
    document.getElementById("totalChecked").textContent = quantity;
    document.getElementById("productsQuantity").textContent = "(" + quantity + ")";
    let count = 0;
    let price = 0;
    let salePrice = 0;
    let quantityProduct = 0;
    for (let i = 0; i < checked.length; i++) {
	let totalElement = checked[i].parentNode.parentNode.parentNode.getElementsByClassName("total")[0];
	let priceElement = checked[i].parentNode.parentNode.parentNode.getElementsByClassName("price")[0];
	let salePriceElement = checked[i].parentNode.parentNode.parentNode.getElementsByClassName("salePrice")[0];
	quantityProduct = checked[i].parentNode.parentNode.parentNode.getElementsByClassName("quantity")[0];
	console.log(quantityProduct.value)
	count += parseInt(totalElement.textContent)
	price += parseInt(priceElement.textContent)
	salePrice += parseInt(salePriceElement.textContent)
    }
    document.getElementById("totalPrice").textContent = formatNumber(count)
    let save = formatNumber((price - salePrice) * parseInt(quantityProduct.value));
    if (save != 'NaN') {
	document.getElementById("savePrice").textContent = save;
    } else {
	document.getElementById("savePrice").textContent = 0;
    }
}

function formatNumber(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.');
}