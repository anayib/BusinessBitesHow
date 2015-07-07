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

  $('#payment-form').submit(function(event) {
    var form = $(this);
    form.find('button').prop('disabled', true);
    Stripe.createToken(form, stripeResponseHandler);
    return false;
  });

  $('#payment-form').on('click', 'input', function() {
    var form = $('#payment-form');
    form.find('.payment-errors').text( "" );
  })

  var errorMessages = {
    incorrect_number: "El número de tarjeta es incorrecto.",
    invalid_number: "El número de tarjeta no es un número de tarjeta válido.",
    invalid_expiry_month: "El mes de caducidad de la tarjeta no es válido.",
    invalid_expiry_year: "El año de caducidad de la tarjeta no es válido.",
    invalid_cvc: "El código de seguridad de la tarjeta no es válido.",
    expired_card: "La tarjeta ha caducado.",
    incorrect_cvc: "El código de seguridad de la tarjeta es incorrecto.",
    incorrect_zip: "Falló la validación del código postal de la tarjeta.",
    card_declined: "La tarjeta fué rechazada.",
    missing: "El cliente al que se está cobrando no tiene tarjeta",
    processing_error: "Ocurrió un error procesando la tarjeta.",
    rate_limit:  "Ocurrió un error debido a consultar la API demasiado rápido. Por favor, avísanos si recibes este error continuamente."
  };

  function stripeResponseHandler(status, response) {
    var form = $('#payment-form');
    if (response.error) {
      form.find('.payment-errors').text( errorMessages[ response.error.code ] );
      form.find('button').prop('disabled', false);
    } else {
      var token = response.id;
      form.append($('<input type="hidden" name="stripeToken">').val(token));
      form.get(0).submit();
    }
  }
});