$(document).ready(function() {
	console.log ("the rating button got clicked");
	$('.rating-button').click(function() {
		$(this).closest('.resource-box').find('.rating-box').css("visibility", "visible");
	});
}); 

//'$(function(){}) is same as '$(document).ready(function() {}) 
