//vote
$(document).on('click', '.vote', function (e) {
	e.preventDefault();
	var url = $(this).data("url");
	var votesNumObj = $(this).parent().parent().find('.votes-num');
	var voteButton = $(this).parent().find('.vote');
	
	if ($(this).hasClass('not-registered')) {
		alert("Please Login to upvote the answer");
		return;
	}
	
	$.ajax({
        type: "POST",
        url: url
        
    }).done (function(data) {
    	if (data) {
    		var votesNum = $(votesNumObj).text();
  
    		votesNum++;
    		
    		$(votesNumObj).text(votesNum);
    		
    		$(voteButton).prop('disabled', true);
    		$(voteButton).removeClass('vote');
    		$(voteButton).removeClass('answer-button');
    		if ($(voteButton).hasClass('left-vote')) {
    			$(voteButton).removeClass('left-vote');
    			$(voteButton).addClass('vote-disabled-left');
    			$(voteButton).attr('title', 'Answer already upvoted');
    		}
    		else {
    			$(voteButton).removeClass('center-vote');
    			$(voteButton).addClass('vote-disabled-center');
    			$(voteButton).attr('title', 'Answer already upvoted');
    		}
	    	
    	}
    	
	
	}).fail (function(err) {
		console.error(err)
	});
});

//answer
$(document).on('click', '.enter-answer-button', function (e) {
	e.preventDefault();
	$('.modal-error').text('');
	$('.modal-error').addClass('not-display');
	var url = $(this).data('url');
	var statementId = $(this).data('statement');
	var answer = $(this).parent().find('.answerText').val();
	
	if (answer == "") {
		
		//show error message
		$('.modal-error').text("Please type some answer before pressing enter");
		$('.modal-error').removeClass('not-display');
		return;
	}
	
	if ($('#notRegistered').length) {
		
		var signin = "Please <a href=\"/signin\">Login</a> to answer the question";
		$('.modal-error').html(signin);
		$('.modal-error').removeClass('not-display');
		return; 
	}
	
	$.ajax({
        type: "POST",
        url: url,
        data: {statementId: statementId, answer: answer},
        dataType: "json"
        
    }).done (function(data) {
    	
	    if (data == null) {
	    	$('.modal-error').text("You have already answered this question");
			$('.modal-error').removeClass('not-display');
	    }
	    else {
	    	
	    	var answerHtml = "<div class=\"answer\">\n";
	    	answerHtml += "<div class=\"votes\">\n";
	    	
	    	answerHtml += "Votes: <span class=\"votes-num\">0</span>\n";
	    	answerHtml += "</div>\n";
	    	
	    	answerHtml += "<div class=\"answer-text\">\n";
	    	answerHtml += answer + "\n";
	    	answerHtml += "</div>\n";
	
	    	answerHtml += "<div class=\"answer-buttons\">\n";
	    	//check if user is admin
	    	if ($('#addQuestion').text() != "ADD" ) {
	    		
	    		var voteUrl = "/answer/vote/" + data.id;
		    	
		    	answerHtml += "<button title=\"Upvote answer\" class=\"answer-button vote center-vote\" data-url=\"" 
		    		+ voteUrl + "\"></button>\n";
		    	
	    	}
	    	else {
	    		var voteUrl = "/answer/vote/" + data.id;
		    	
		    	answerHtml += "<button title=\"Upvote answer\" class=\"answer-button vote left-vote\" data-url=\"" 
		    		+ voteUrl + "\"></button>\n";
		    	
		    	var deleteUrl = "/answer/delete/" + data.id;
		    	
		    	answerHtml += "<button title=\"Delete answer\" class=\"answer-button answer-delete-button\" data-url=\"" 
		    		+ voteUrl + "\"></button>\n";
	    	}
	    	
	    	
	    	answerHtml += "</div>\n";
	    	
	    	answerHtml += "</div>\n";
	    	
	    	if ($('.modal-answer-positive').hasClass('open')) {
	    		$('#positiveAnswer').append(answerHtml);
	    	}
	    	else if ($('.modal-answer-negative').hasClass('open')){
	    		$('#negativeAnswer').append(answerHtml);
	    	}
	    	
	    	//close modal
	    	$('.modal-wrap').removeClass('open')
	    	
	    }
	    
	
	}).fail (function(err) {
		console.error(err);
		$('.modal-wrap').removeClass('open')
	});
});


//delete question
$(document).on('click', '.delete-button', function (e) {
	e.preventDefault();
	var url = $(this).data("url");
	var question = $(this).parent().parent().parent();
	
	$.ajax({
        type: "POST",
        url: url
        
    }).done (function(data) {
    	if (data) {
	    	
    		$(question).html('');
    		
    	}
    
	}).fail (function(err) {
		console.error(err)
	});
});

//answer delete question
$(document).on('click', '.answer-delete-button', function (e) {
	e.preventDefault();
	var url = $(this).data("url");
	var answer = $(this).parent().parent();
	
	$.ajax({
        type: "POST",
        url: url
        
    }).done (function(data) {
    	if (data) {
	    	
    		$(answer).html('');
    		
    	}
    	
	}).fail (function(err) {
		console.error(err)
	});
});