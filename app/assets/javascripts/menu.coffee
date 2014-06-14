window.KssKss or= {}

window.KssKss.Menu = class Menu
	@init = () ->
      $('.ui.compact.menu').dropdown()
      buttons = [
      	{btn: 'a.item.home',         url:	'/'},
      	{btn: 'a.item.coinscoins',   url: '/profile/show'},
      	{btn: 'a.item.campaigns',    url: '/campaign/index'},
      	{btn: 'a.item.activity',	   url: '/activity/show'}
      ]
      @bindEvents(buttons)
      url = window.location.href.replace(/^.*\/\/[^\/]+/, '')
      o = _.first(_.filter(buttons, { 'url': url }))
      $(o.btn).addClass 'active'

  @bindEvents = (buttons) ->
    open = KssKss.Menu.open
    _.forEach buttons, (val, key) ->
      $(val.btn).click ->
        open val.url

  @open = (url) ->
    window.location.href = url

