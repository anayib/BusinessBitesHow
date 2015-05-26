$(document).on("ready page:load", function() {

	$("fieldset").on('change', 'select.content_select', function() {
		var content_div = $(this).parent();
		console.log(content_div);
		if ( $(this).val() == "pdf" ) {
			content_div.find("input.video_url").val("");
		  content_div.find('div.video_field').hide();
		  content_div.find('div.pdf_field').show();
		} else if ( $(this).val() == "video" ) {
		  content_div.find("input.file_input").val("");
		  content_div.find('div.pdf_field').hide();
		  content_div.find('div.video_field').show();
		}
	});
});	