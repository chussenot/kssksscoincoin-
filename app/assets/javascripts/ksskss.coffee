#= require menu
#= require coincoin

window.KssKss or= {}
window.KssKss.Application = class Application
  @start = () ->
    @bindEvents()
    KssKss.Menu.init()
  @bindEvents = () ->
    $('.ui.button.add_pledge').click ->
      bitcoin_address = $(this).attr('data-bitcoin_address')
      $(".ui.modal.add_pledge").modal('show')
      $('.ui.button.request_pledge').attr('data-bitcoin_address', bitcoin_address)
    $('.ui.button.request_pledge').click ->
    	$.post("api/pledge",
        transaction_id: $('input[name="transaction_id"]').val()
        vout: $('input[name="vout"]').val()
        bitcoin_address: $(this).attr('data-bitcoin_address')
        pledge_amount: $('input[name="pledge_amount"]').val()
      ).done (transaction) ->
        $(".ui.modal.transaction").modal('show')
        $("#code").html(transaction)



