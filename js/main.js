var mySwiper = new Swiper('.first', {
  slidesPerView: 1,
  slidesPerGroup: 1,

  spaceBetween: 50,
  // Optional parameters
  // 너비 비례 slidesPerView가 많으면 루프 작동 안함
  loop: true,
  

  autoplay: {     //자동슬라이드 (false-비활성화)
    delay: 4000, // 시간 설정
    disableOnInteraction: true, // false-스와이프 후 자동 재생
  },
  // Navigation arrows
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
pagination: '.swiper-pagination', 
  // And if we need scrollbar

});


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
