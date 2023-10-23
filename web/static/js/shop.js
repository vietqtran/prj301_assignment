/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const firebaseConfig = {
apiKey: "AIzaSyBt_kwTB4M8GpVGwMHqn8F95_62OnVPlsE",
	authDomain: "mooru-eee6d.firebaseapp.com",
	projectId: "mooru-eee6d",
	storageBucket: "mooru-eee6d.appspot.com",
	messagingSenderId: "479773238160",
	appId: "1:479773238160:web:b5eb5eb00a19cd8fd98915",
}
firebase.initializeApp(firebaseConfig)

	const storage = firebase.storage()
	const storageRef = storage.ref()
	const imagesRef = storageRef.child("avatars")
	const productsRef = storageRef.child("products")

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



	function handleViewProduct(p) {
	document.getElementById("cover").style.display = "flex"
		document.getElementById("modal_productId").innerHTML = p.parentNode.parentNode.getAttribute('data-product-id');
		document.getElementById("modal_productName").innerHTML = p.parentNode.parentNode.getAttribute('data-product-name');
		document.getElementById("modal_productPrice").innerHTML = p.parentNode.parentNode.getAttribute('data-product-price');
		document.getElementById("modal_productRate").innerHTML = p.parentNode.parentNode.getAttribute('data-product-rate');
		document.getElementById("modal_productCreateDate").innerHTML = p.parentNode.parentNode.getAttribute('data-product-createDate');
		document.getElementById("modal_productColor").innerHTML = p.parentNode.parentNode.getAttribute('data-product-color');
		document.getElementById("modal_productCategory").innerHTML = p.parentNode.parentNode.getAttribute('data-product-categoryId');
		document.getElementById("productImage").src = p.parentNode.parentNode.getAttribute('data-product-url');
		document.getElementById("modal_role").innerHTML = role;
		document.getElementById("delete_link").href = "check?action=deleteProduct&id=" + p.parentNode.parentNode.getAttribute('data-product-id')
		document.getElementById("cover").style.display = "flex"
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

const mainImage = document.getElementById("mainImage")
	mainImage?.addEventListener("change", (e) => {
	var file = e.target.files[0]
		var uploadTask = productsRef.child(file.name).put(file)
		uploadTask.on(
			"state_changed",
			(snapshot) => {
		},
			(error) => {
		},
			() => {
		uploadTask.snapshot.ref
			.getDownloadURL()
			.then((downloadURL) => {
			document.getElementById("mainImageValue").value = downloadURL
				document.getElementById("mainImagePreviewContainer").style.display = 'block'
				document.getElementById("mainImagePreview").src = downloadURL
			})
		}
		)
	})

	var countInit = document.getElementsByClassName("sub").length
	const addImageButton = document.getElementById("addImageButton")
	addImageButton?.addEventListener('click', () => {
	var count = countInit + 1
		var newElement = document.createElement("div");
		newElement.innerHTML = `
    <div class="w-full mb-3 col-span-1 md:col-span-5 flex flex-col items-start justify-start">
	<div class="flex items-center justify-between">
	    <div>
		<label for="subimage${count}">Image ${count}<span class="text-red-500 mb-1">*</span></label>
		<br/>
		<input id="subImageValue${count}" class="hidden" type="text" name="subImage">
		<input id="subImage${count}" class="subImage mb-3" type="file" required/><br/>
	    </div>
	    <button onclick="removeSubImage(this)" type="button" class="p-2 rounded-sm hover:bg-slate-100">
		<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-3 h-3">
		    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
		</svg>
	    </button>
	</div>
	<div id="subImagePreviewContainer${count}" class="mt-2" style="display: none">
	    <img id="subImagePreview${count}" class="w-[150px] h-[250px] object-cover" src="" alt="alt"/>
	</div>
	
    </div>
  `;
		document.getElementById("subImages").appendChild(newElement);
		countInit = count
		reAddEvent()
	})


	function reAddEvent() {

	const subImages = document.getElementsByClassName("subImage")

		for (let i = 0; i < subImages.length; i++) {
	subImages[i].addEventListener('change', (e) => {
	const file = e.target.files[0];
		const uploadTask = productsRef.child(file.name).put(file);
		uploadTask.on(
			"state_changed",
			(snapshot) => {
		// Progress update code here if needed
		},
			(error) => {
		// Handle errors here
		},
			() => {
		uploadTask.snapshot.ref
			.getDownloadURL()
			.then((downloadURL) => {
			let id = "subImageValue" + (i + 1);
				let subImagePreviewContainer = "subImagePreviewContainer" + (i + 1)
				let subImagePreview = "subImagePreview" + (i + 1)
				document.getElementById(id).value = downloadURL
				document.getElementById(subImagePreviewContainer).style.display = 'block'
				document.getElementById(subImagePreview).src = downloadURL
			});
		}
		);
	}); // Pass i as an argument to create a closure
	}
	}

const addSizeButton = document.getElementById("addSizeButton")
	addSizeButton?.addEventListener('click', () => {
	var newElement = document.createElement("div");
		newElement.innerHTML = `
    <div class="flex items-center justify-start w-full mb-2">
	<div class="flex items-center justify-start">
	    <div class="mr-2">
		<label>Size<span class="text-red-500">*</span></label>
		<input type="text" name="sizeName" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
	    </div>
	    <div class="ml-2">
		<label for="inventory">Inventory<span class="text-red-500">*</span></label>
		<input type="number" name="inventory" class="outline-none border border-blue-500 text-gray-900 text-sm rounded-lg block w-full p-2" required/>
	    </div>
	</div>
	<button onclick="removeSize(this)" type="button" class="p-2 rounded-sm hover:bg-slate-100">
	    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-3 h-3">
		<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
	    </svg>
	</button>
    </div>
  `;
		document.getElementById("sizeContainer").appendChild(newElement)
	})

	function removeSubImage(btn) {
	btn.parentNode.parentNode.remove()
	}

function removeSize(btn) {
btn.parentNode.remove()
}

function changeAvatarButton() {
document.getElementById("fileInput").click()
}


const fileInput = document.getElementById("fileInput")

	fileInput?.addEventListener("change", (e) => {
	const file = e.target.files[0]
		const uploadTask = imagesRef.child(file.name).put(file)
		uploadTask.on(
			"state_changed",
			(snapshot) => {
		},
			(error) => {
		},
			() => {
		uploadTask.snapshot.ref
			.getDownloadURL()
			.then((downloadURL) => {
			document.getElementById("avatarUrl").value = downloadURL
				document.getElementById("avatarPreview").src = downloadURL
				document.getElementById('buttonOpenFile').style.display = 'none'
				document.getElementById("buttonSubmitForm").style.display = "flex"
			})
		}
		)
	})

toggleSidebar()

