$(document).on("ready page:load", function() {
	$("div#plan_buttons").on('click', 'button', function() {
		var button = $(this);
		$('span#plan_name').html(button.data("name"));
		if(button.data("price")==204.99){
			$('span#plan_price').html(button.data("price")+" dólares/año");
		}else {
			$('span#plan_price').html(button.data("price")+" dólares/mes");
		}
		console.log(button.data("name"));
		console.log(button.data("price"));
		console.log(button.data("id"));
		var hidden = $('input#plan_selected');
		hidden.val(button.data("id"));	
		console.log(hidden.value);			
	});
});	