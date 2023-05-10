/**
 * 
 */

$(document).ready(function() {
	$("#change_btn").click(function(){
		$(this).html('완료');
		$(this).attr("id","change_btn2");
		$(".none").css("display","flex");
	})
})




	$("#change_btn2").click(function(){
		$(this).html('수정');
		$(this).attr("type","submit");
		$(".none").css("display","none");
	})
