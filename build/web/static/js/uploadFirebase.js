/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


/* global firebase */

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

const fileInput = document.getElementById("fileInput")

fileInput.addEventListener("change", (e) => {
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
		    document.getElementById("avatarPreviewContainer").style.display = "block"
		    document.getElementById("avatarPreview").src = downloadURL
		    document.getElementById("buttonOpenFile").style.display = 'none'
		    document.getElementById("changeAvatarForm").submit()
		})
    }
    )
})

