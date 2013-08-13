$(document).ready(function() {
	console.log ("the rating button got clicked");
	$('.rating-button').click(function() {
		$(this).closest('.resource-box').find('.rating-box').css("visibility", "visible");
	});
	$('a.action.delete-button').click(function(){
		return confirm('Are you sure you want to delete this resource?')
	});
}); 


//'$(function(){}) is same as '$(document).ready(function() {}) 
