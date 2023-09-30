/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const tabs = document.getElementsByClassName('tab')
const tabSelects = document.getElementsByClassName('tab_select')

function handleChangeTab(e, btn) {
    const tab = document.getElementById(e)
    const tabSelect = document.getElementById(btn)

    for (var i = 0; i < tabs.length; i++) {
	tabs[i].classList.add('hidden')
    }

    for (var i = 0; i < tabSelects.length; i++) {
	tabSelects[i].style.fontWeight = 'normal'
	tabSelects[i].style.color = 'rgb(17 24 39 / 1)'
    }

    tab.classList.remove('hidden')
    tabSelect.style.color = '#0261d6'
    tabSelect.style.fontWeight = 'bold'
}

handleChangeTab('account', 'account_btn')


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

