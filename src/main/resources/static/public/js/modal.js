


function showHideModal(trig,targ){
    jQuery(trig).on('click touchstart', function(e){
        e.preventDefault();
        jQuery(targ).addClass('open');
        $('.modal-error').text('');
    	$('.modal-error').addClass('not-display');
    });

    jQuery(this).keydown(function (eventObject) {
        if (eventObject.which == 27){
            jQuery(targ).removeClass('open');
        }
    });



    jQuery('.close-modal').click(function(){
        jQuery(targ).removeClass('open');
    });


    jQuery(targ).on('click touchstart', function (e) {
        if (!jQuery(e.target).parents().hasClass('modal-wrap') && !jQuery(e.target).hasClass('modal-wrap')) {
            jQuery(targ).removeClass('open');
        }

    });
}
jQuery(document).ready(function  ($) {
	
	showHideModal('.open-positive-answer-modal','.modal-answer-positive');
	
	showHideModal('.open-negative-answer-modal','.modal-answer-negative');
	
	jQuery('[role="toggle_forgot_password_form"]').on('click', function (e) {
       e.preventDefault();
       jQuery(this).parents('.login-form-block').find('.flipper').toggleClass('rotate');
   });
});