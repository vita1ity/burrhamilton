
$(function() {
	$('.social_icons .icons.icon-share').on('click', function(e) {
		
		e.preventDefault();
		
		if ( $(this).parent().is('.show-links')) {
			$(this).parent().removeClass('show-links');
		} else {
			$(this).parent().addClass('show-links');
		}
	});
	/*if (!$.browser.webkit) {
		autosize($('.scroll-pane textarea'));
		$('.scroll-pane textarea').addClass('non-webkit');
		$('.scroll-pane').jScrollPane({
			autoReinitialise: true
		});
	};*/
});

function formatText() {
	
	var titleText = $('#title').val();
	var positiveStatement = $('#positiveStatement').val();
	var negativeStatement = $('#negativeStatement').val();
	
	//console.log(positiveStatement);
	//console.log(negativeStatement);
	titleText = titleText.replace(/\r\n|\r|\n/g, "<br />");
	positiveStatement = positiveStatement.replace(/\r\n|\r|\n/g, "<br />");
	negativeStatement = negativeStatement.replace(/\r\n|\r|\n/g, "<br />");
	
	// Set the regex string
	var regex = /(https?:\/\/([-\w\.]+)+(:\d+)?(\/([\w\/_\.]*(\?\S+)?)?)?)/ig;
	// Replace plain text links by hyperlinks
	//titleText = titleText.replace(regex, "<a href='$1'>$1</a>");
	positiveStatement = positiveStatement.replace(regex, "<a href='$1' target=\"_blank\">$1</a>");
	negativeStatement = negativeStatement.replace(regex, "<a href='$1' target=\"_blank\">$1</a>");
	
	//console.log(titleText);
	$('#title').val(titleText);
	$('#positiveStatement').val(positiveStatement);
	$('#negativeStatement').val(negativeStatement);
	return true;
}

$(document).ready(function() {
	var maxChar = 155;
	var maxCharTitle = 200;
	
	ellips($('p.statement-short'));
	shortenTitle($('.title-short'));
	
	function ellips(elem) {
	    $(elem).html(function() {
	        var txt = $(this).text();
	        if (txt.length >= maxChar ) {
	            var url = $(this).parents('.question').find('.title a').attr('href');
	        	var toggle = $('<span />', {text: '...read more'}),
	                n  = txt.slice(0,maxChar) + "... ";
	                n += '<span class="show_more">'+ txt.slice(maxChar) +'</span>';
	                n += '<a href="'+ url +'" class="more">Read More</a>';
	            return n;
	        }
	    });
    
	}
	function shortenTitle(elem) {
	    $(elem).html(function() {
	        var txt = $(this).html();
			var url = $(this).parents('.question').find('.title a').attr('href');
			//console.log(url);
	        if (txt.length >= maxCharTitle ) {
	            n  = '<a href="' + url + '">' + txt.slice(0,maxCharTitle) + '... </a>';
	        	
	            return n;
	        }
	    });
    
	}
	
	
	
	
});

window.onload = function(){
	
	//console.log(window.location.toString());
	if ($('.icon-t').length) {
		var url = $('.icon-t').attr('href');
		var n = url.indexOf("@burrhamilton");
		var thisUrl = window.location.toString();
		var finalUrl = url.slice(0, n) + thisUrl + " \n" +  url.slice(n, url.length);
		//console.log(finalUrl);
		$('.icon-t').attr('href', finalUrl);
		
		var linkedurl = $('.icon-i').attr('href');
		var m = linkedurl.indexOf("@burrhamilton");
		var this2Url = window.location.toString();
		var final2Url = linkedurl.slice(0, m) + this2Url + " \n" +  linkedurl.slice(m, linkedurl.length);
		//console.log(final2Url);
		$('.icon-i').attr('href', final2Url); 
		//$('.link').text(window.location.toString());
		
		var metaUrl = $('#meta-desc').attr('content');
		var m = metaUrl.indexOf("@burrhamilton"); 
		var thisUrl = window.location.toString();
		var finalUrl = metaUrl.slice(0, m) + thisUrl + " \n" +  metaUrl.slice(m, metaUrl.length);
		//console.log(finalUrl);
		$('#meta-desc').attr('content', finalUrl);
	}
	
	if ($('.with-links').length) {
		var titleText = $('.with-links').html();
		// Set the regex string
		var regex = /(https?:\/\/([-\w\.]+)+(:\d+)?(\/([\w\/_\.]*(\?\S+)?)?)?)/ig;
		// Replace plain text links by hyperlinks
		titleText = titleText.replace(regex, "<a href='$1' target=\"_blank\">$1</a>");
		//console.log(titleText);
		$('.with-links').html(titleText);
	}
	
	if ($('.statement-text').length) {
		var maxHeight = 0;
		$(".statement-text").each(function(){
			var height = $(this).height();
			if (height > maxHeight) {
				maxHeight = height;
			}
		});
		//console.log("max height: " + maxHeight);
		$(".statement-text").each(function(){
			$(this).height(maxHeight);
		});
		
	}
	
	
	
}


