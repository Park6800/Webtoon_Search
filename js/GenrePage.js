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
    let dis_ = document.getElementById("nav-b");
    if(dis_.style.display == "none"){
        dis_.style.display = "flex"
    } else {
        dis_.style.display = "none"
    }
}

