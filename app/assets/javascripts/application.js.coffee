#= require init

class Application
  @start = () ->
    @bindEvents()
    Menu.init()
  @bindEvents = () ->
    $('.ui.button.add_option').click ->
      $(".ui.modal.add_option").modal('show')

class Menu
	@init = () ->
      $('.ui.compact.menu').dropdown()

$ ->
  Application.start()
