$(document).ready(function() {
	$('.rating-button').click(function() {
		$(this).closest('.resource-box').find('.rating-box').css("visibility", "visible");
	});
}); 

//'$(function(){}) is same as '$(document).ready(function() {}) 
