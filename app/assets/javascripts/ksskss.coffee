#= require menu
#= require coincoin

window.KssKss or= {}
window.KssKss.Application = class Application
  @start = () ->
    @bindEvents()
    KssKss.Menu.init()
  @bindEvents = () ->
    $('.ui.button.add_pledge').click ->
      $(".ui.modal.add_pledge").modal('show')
    $('.ui.button.request_option').click ->
    	$.post("api/pledge",
        transaction_id: $('input[name="transaction_id"]').val()
        vout: $('input[name="vout"]').val()
        bitcoin_address: "mjADUJra6U1jDsdHXZ6JwAU4iaVKMzaXi7"
        pledge_amount: $('input[name="pledge_amount"]').val()
      ).done (transaction) ->
        console.log transaction


