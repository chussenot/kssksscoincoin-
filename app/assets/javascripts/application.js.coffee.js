#= require init

class Application
  @start = () ->

  @bindEvents = () ->
    $('.ui.button.add_option').click ->
      $(".ui.modal.add_option").modal('show')

$ ->
  $('.sidebar.top').sidebar('toggle')
  Application.bindEvents()
