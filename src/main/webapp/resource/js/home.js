/**
 * 
 */

function search_() {
 	let change = document.getElementById("change_select").value;
 	let serach = document.getElementById("serach_form");
 	
 	serach.setAttribute("name", change);
 }

function select_genre(sel) {
    let _Select = document.getElementById(sel);
    let img_None = document.getElementsByClassName("genre_");
    for(let i = 0; i<img_None.length;i++){
      img_None[i].style.border = "none";
    }
    _Select.style.border = "1px solid red";
}

function select_day(select_) {
	let D_Select = document.getElementById(select_);
	let Days = document.getElementsByClassName("day_");
	for(let i=0; i <Days.length;i++){
		Days[i].style.border = "none";
	}
	D_Select.style.border = "1px solid red";
	D_Select.style.borderRadius = "10px";
}

function change_sel(chan) {
  let sel_value = document.getElementById("sel_chan");
  sel_value.value = chan;
}

function change_day(Chan){
	let sel_Value = document.getElementById("sel_day");
	sel_Value.value = Chan;
}
 
let send = document.getElementById("send");
send.addEventListener("click", function () {
	let form = document.getElementById("form");
	let day = document.getElementById("sel_day");
	let sel = document.getElementById("sel_chan");
	if(sel.value.trim() == "" || day.value.trim() ==""){
		alert("요일과 장르를 올바르게 선택해주세요.");
		return false;
		}
		form.submit();
	})
	