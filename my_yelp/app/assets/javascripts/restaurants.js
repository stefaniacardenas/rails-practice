$(document).ready(function() {
	$('.new_review').on('submit', function(event) {
		event.preventDefault();

		$.post($(this).attr('action'),$(this).serialize(), function(response) {
			var template = $('#review_template');
			var rendered = Mustache.render(template,response);
		}, 'json');
	})
})