#= require init

class Application
  @start = () ->
    $('.ui.compact.menu').dropdown()
    $('.sidebar.top').sidebar('toggle')
    @bindEvents()
  @bindEvents = () ->
    $('.ui.button.add_option').click ->
      $(".ui.modal.add_option").modal('show')

$ ->
  Application.start()
