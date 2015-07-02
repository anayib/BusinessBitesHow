$(document).on("ready page:load", function() {
  var hidden = $('input#plan_selected');
  $("button#pay_button").attr("disabled", "disabled");
  $("div#plan_buttons").on('click', 'button', function() {
    $("button#pay_button").removeAttr("disabled");
    $("button#pay_button").html("Pagar Ahora");  
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
    hidden.val(button.data("id"));  
    console.log(hidden.value);      
  }); 
});