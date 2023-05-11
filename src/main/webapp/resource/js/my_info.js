/**
 * 
 */



$(document).ready(function() {
	$("#change_btn").click(function(){
		$(this).html('완료');
		if ($("#Name").val() != "" && $("#Gender").val() != "" && $("#Birth").val() != "") {
			$(this).attr("type", "submit");
		}
		$(".none").css("display", "flex");
	});
});


