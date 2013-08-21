$(document).on('page:load', function() {
	$('.rating-button').click(function() {
		$(this).closest('.resource-box').find('.rating-box').css("visibility", "visible");
	});
	$('a.action.delete-resource').click(function(){
		return confirm('Are you sure you want to delete this resource?')
	});
    $('a.action.delete-comment').click(function(){
        return confirm('Are you sure you want to delete this comment?')
    });
}); 


$(document).on('page:load', function() {
    $('.myCheckbox').on('click', function(event) {
        var checkbox = $(event.currentTarget).find('.checkbox');
        checkbox.trigger('click');
    });
    
    $('.myCheckbox .checkbox').on('change', function(event){
        var checkbox = $(event.target);
        checkbox.parent().toggleClass('checked');
    });
});

//'$(function(){}) is same as '$(document).ready(function() {}) 
