// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
    $('a.action.delete-user').click(function(){
        return confirm('Are you sure you want to delete this user?');
    });
});