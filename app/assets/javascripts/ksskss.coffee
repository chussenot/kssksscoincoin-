#= require menu
#= require coincoin

window.KssKss or= {}
window.KssKss.Application = class Application
  @start = () ->
    @bindEvents()
    KssKss.Menu.init()
  @bindEvents = () ->
    $('.ui.button.add_option').click ->
      $(".ui.modal.add_option").modal('show')
    $('.ui.button.request_option').click ->
    	$.post("api/pledge",
        transaction_id: "e3ba2ac29c70b3c5183adf0ca4ef9d7578ff0db4d857ffc94a7ca8c105a7fca8"
        vout: 0
        bitcoin_address: "mjADUJra6U1jDsdHXZ6JwAU4iaVKMzaXi7"
        pledge_amount: 0.34113
      ).done (transaction) ->
        console.log transaction


