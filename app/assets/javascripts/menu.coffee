window.KssKss or= {}

window.KssKss.Menu = class Menu
	@init = () ->
      $('.ui.compact.menu').dropdown()
      buttons = [
      	{btn: 'a.item.home',         url:	'/'},
        {btn: 'a.item.profile',      url: '/profile/show'},
        {btn: 'a.item.activity',     url: '/profile/activity'},
        {btn: 'a.item.campaigns',    url: '/profile/campaigns'},
        {btn: '.item.campaign.create',    url: '/campaigns/new'},
        {btn: '.item.campaign.list',    url: '/campaigns'},
        {btn: 'a.item.coinscoins',   url: '/profile/coinscoins'},
        {btn: 'a.item.settings',   url: '/profile/settings'},
        {btn: 'a.item.contact',      method: KssKss.Menu.openContact}
      ]
      @bindEvents(buttons)
      url = window.location.href.replace(/^.*\/\/[^\/]+/, '')
      o = _.first(_.filter(buttons, { 'url': url }))
      $(o.btn).addClass 'active'

  @bindEvents = (buttons) ->
    open = KssKss.Menu.open
    _.forEach buttons, (val, key) ->
      $(val.btn).click ->
        open val.url if val.url
        val.method() if val.method

  @open = (url) ->
    window.location.href = url

  @openContact = () ->
    $(".sidebar.contact").sidebar "toggle"

