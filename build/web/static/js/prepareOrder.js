/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const cover = document.getElementById("cover")

function closeModal() {
    document.getElementById("cover").style.display = "none"
}

function handleClickContent(event) {
    event.stopPropagation()
}

function toggleModal() {
    if (cover.style.display === 'none') {
	cover.style.display = 'flex'
    } else {
	cover.style.display = 'none'
    }
}

function handleSubmit() {
    const phone = document.getElementById("phoneInput").value
    if (phone.length === 10 && checkString(phone)) {
	document.getElementById("addressForm").submit()
    }
}

function checkString(string) {
    return /^[0-9]*$/.test(string);
}


const changeAddress = document.getElementById("changeAddressCover")
function toggleChangeAddressModal() {
    if (changeAddress.style.display === 'none') {
	const addressCheckboxes = document.querySelectorAll('.address');
	const addressId = document.getElementById("addressId").value
	addressCheckboxes.forEach(checkbox => {
	    checkbox.checked = false;
	});
	addressCheckboxes.forEach(checkbox => {
	    if (checkbox.value === addressId)
		checkbox.checked = true;
	});
	changeAddress.style.display = 'flex'
    } else {
	changeAddress.style.display = 'none'
    }
}


function showAddAddress() {
    document.getElementById("cover").style.display = "flex"
    document.getElementById("changeAddressCover").style.display = "none"
}

function handleSelectAddress(input) {
    const addressCheckboxes = document.querySelectorAll('.address');
    addressCheckboxes.forEach(checkbox => {
	checkbox.checked = false;
    });
    input.checked = true
}

function changeAddressConfirm() {
    const checked = document.querySelectorAll(".address:checked")[0]
    console.log(checked.parentNode.parentNode)
    document.getElementById("addressId").value = checked.value
    document.getElementById("userPreview").textContent = checked.parentNode.parentNode.getElementsByClassName("name")[0].textContent + " - " + checked.parentNode.parentNode.getElementsByClassName("phone")[0].textContent
    document.getElementById("addressPreview").textContent = checked.parentNode.parentNode.getElementsByClassName("detail")[0].textContent + ", " + checked.parentNode.parentNode.getElementsByClassName("addressText")[0].textContent
    toggleChangeAddressModal()
}


const changeCompany = document.getElementById("changeCompanyCover")
function toggleChangeShipCompany() {
    if (changeCompany.style.display === 'none') {
	changeCompany.style.display = 'flex'
    } else {
	changeCompany.style.display = 'none'
    }
}

let parentBlock

function openChangeShipCompany(changeButton) {
    parentBlock = changeButton.parentNode
    toggleChangeShipCompany()
}

function changeShipCompany() {
    const shipCompanyCheckbox = document.querySelectorAll(".shipCompanyCheckbox:checked")[0]
    const parent = shipCompanyCheckbox.parentNode.parentNode
    const name = parent.getElementsByClassName("shipCompanyNameChange")[0].textContent
    const price = parent.getElementsByClassName("shipCompanyPriceChange")[0].textContent
    parentBlock.getElementsByClassName("shipCompanyId")[0].value = shipCompanyCheckbox.value
    parentBlock.getElementsByClassName("previewShipName")[0].textContent = name
    parentBlock.getElementsByClassName("previewShipPrice")[0].textContent = price
    toggleChangeShipCompany()
    update()
}

function removeCommas(str) {
    return parseFloat(str.replace(/,/g, ''));
}

const shopBlocks = document.getElementsByClassName("shopBlock");
function update() {
    for (let i = 0; i < shopBlocks.length; i++) {
	let prices = shopBlocks[i].getElementsByClassName("priceUnit");
	let total = shopBlocks[i].getElementsByClassName("total")[0];
	let totalInput = shopBlocks[i].getElementsByClassName("totalInput")[0];
	let dateOfRecipt = shopBlocks[i].getElementsByClassName("dateOfReceipt")[0]
	let totalPrice = 0;
	for (let j = 0; j < prices.length; j++) {
	    let price = prices[j];
	    console.log(price)
	    totalPrice += Number(removeCommas(price.textContent));
	}
	totalInput.value = totalPrice
	total.textContent = totalPrice.toLocaleString();

	let today = new Date();
	let threeDaysLater = new Date(today.getTime() + 3 * 24 * 60 * 60 * 1000);
	let day3 = threeDaysLater.getDate();
	let month3 = threeDaysLater.getMonth() + 1;
	let fiveDaysLater = new Date(today.getTime() + 5 * 24 * 60 * 60 * 1000);
	let day5 = fiveDaysLater.getDate();
	let month5 = fiveDaysLater.getMonth() + 1;
	dateOfRecipt.textContent = day3 + " Th" + month3 + " - " + day5 + " Th" + month5
    }
    const productPrices = document.getElementsByClassName("productPrice")
    const shipPrices = document.getElementsByClassName("shipPrice")
    let totalAll = 0
    totalPrice = 0
    for (var i = 0; i < productPrices.length; i++) {
	totalPrice += Number(removeCommas(productPrices[i].textContent));
    }
    totalAll += totalPrice
    document.getElementById("totalPrice").textContent = totalPrice.toLocaleString()
    totalPrice = 0
    for (var i = 0; i < shipPrices.length; i++) {
	totalPrice += Number(removeCommas(shipPrices[i].textContent));
    }
    totalAll += totalPrice
    document.getElementById("totalShip").textContent = totalPrice.toLocaleString()
    document.getElementById("totalAll").textContent = totalAll.toLocaleString()
}

update()


const shipCompanyCheckboxs = document.getElementsByClassName("shipCompanyCheckbox")

function updateSelectedShipCompany() {
    const shipCompanyId = document.getElementById("shipCompanyId")
    for (var i = 0; i < shipCompanyCheckboxs.length; i++) {
	if (shipCompanyCheckboxs[i].value === shipCompanyId.value) {
	    shipCompanyCheckboxs[i].checked = true
	}
    }
}

function handleSelectShipCompany(checkbox) {
    for (var i = 0; i < shipCompanyCheckboxs.length; i++) {
	shipCompanyCheckboxs[i].checked = false
    }
    checkbox.checked = true
}
