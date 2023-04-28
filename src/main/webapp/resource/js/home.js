/**
 * 
 */

function search_() {
 	let change = document.getElementById("change_select").value;
 	let serach = document.getElementById("serach_form");
 	
 	serach.setAttribute("name", change);
 	console.log(serach.name);
 }

function select_genre(sel) {
    let _Select = document.getElementById(sel);
    let img_None = document.getElementsByClassName("genre_");
    for(let i = 0; i<img_None.length;i++){
      img_None[i].style.border = "none";
    }
    _Select.style.border = "1px solid red";
}

function change_sel(chan) {
  let sel_value = document.getElementById("sel_chan");
  sel_value.value = chan;
}
 