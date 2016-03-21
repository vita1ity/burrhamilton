function validateSignUp() {
	
	$('#signup-alert').addClass('not-display');
	
	var username = $('#username').val();
	
	var qualification = $('#qualification').val();
	
	if (username == null || username == "") {
			
		$('#signup-alert').removeClass('not-display');
		$('#signup-error-message').text("Username is empty");
		
		return false;
	}
	
	if (qualification == null || qualification == "") {
		$('#signup-alert').removeClass('not-display');
		$('#signup-error-message').text("Qualification is empty");
		return false;
	}

	return true;
}