var menubtn = document.querySelector(".menubtn");
var homebtn = document.querySelector(".homebtn");
var homebtn1 = document.querySelector(".homebtn1");
var homebtn2 = document.querySelector(".homebtn2");
var profilebtn = document.querySelector(".profilebtn");
var settingbtn = document.querySelector(".settingbtn");
var logoutbtn = document.querySelector(".logoutbtn");
var rooms = document.querySelectorAll(".rooms");
menubtn.addEventListener('click',()=>{allRoomHide();rooms[2].style.display = "block";});
homebtn.addEventListener('click',()=>{allRoomHide();rooms[1].style.display = "block";});
homebtn1.addEventListener('click',()=>{allRoomHide();rooms[1].style.display = "block";});
homebtn2.addEventListener('click',()=>{allRoomHide();rooms[1].style.display = "block";});
profilebtn.addEventListener('click',()=>{allRoomHide();rooms[3].style.display = "block";});
function allRoomHide(){for(a=0;a<5;a++){rooms[a].style.display = "none";}}