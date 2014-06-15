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
      id = $(this).attr('data-id')
      $(".ui.modal.add_pledge").modal('show')
      $('.ui.button.request_pledge').attr('data-bitcoin_address', bitcoin_address)
      $('.ui.button.sign_transaction').attr('data-id', id)
    $('.ui.button.request_pledge').click ->
    	$.post("/api/pledge",
        transaction_id: $('input[name="transaction_id"]').val()
        vout: $('input[name="vout"]').val()
        bitcoin_address: $(this).attr('data-bitcoin_address')
        pledge_amount: $('input[name="pledge_amount"]').val()
      ).done (transaction) ->
        $("#deflat").html(transaction.deflat)
        $("#raw").html(transaction.raw)
        $(".ui.modal.transaction").modal('show')
    $('.ui.button.sign_transaction').click ->
      $.post("/api/sign",
        transaction_sign: $('input[name="transaction_sign"]').val() 
        campaign_id: $(this).attr('data-bitcoin_address')
      ).done (result) ->
        alert result




