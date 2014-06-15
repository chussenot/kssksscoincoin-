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
    	$.post("api/option",
        name: "John"
        time: "2pm"
      ).done (data) ->
        console.log data


