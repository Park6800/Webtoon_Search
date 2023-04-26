/**
 * 
 */
 function click_genre(choice) {
    let _choice = document.getElementById(choice);
    let _sel = document.getElementsByClassName("select_");
    for(let i=0; i<_sel.length;i++){
        _sel[i].style.background="gray";
        _sel[i].style.padding = "0"
    }
    _choice.style.background = "rgba(255,255,255,0.6)";
    _choice.style.padding ="5px"
    document.getElementById("get_genre").value = choice;
}

 