
(function(){
	$('.dropdown-triger').on('click', function(event) {
		event.preventDefault();
		var e = event.target;
		$(this).siblings('.dropdown-list').slideToggle('fast');
		event.stopPropagation();
		cancelSelect(event);
	});
	$('.dropdown-wrapper .dropdown-list li').on('click', function(event) {
		event.preventDefault();
		var val = $(this).text();
		$(this).parents('.dropdown-wrapper').find('.dropdown-content').html(val);
		$(this).parents('.dropdown-wrapper .dropdown-list').slideUp('fast');
	});
	var cancelSelect = function(e){
		var t = e.target?e.target:e.srcElement;
		$(document).not(t).on('click', function(event) {
			$('.dropdown-list').slideUp('fast');
		});
	}

})();