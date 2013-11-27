class LandingMenu
  constructor: (containerSelector) ->
    @container = $(containerSelector);
    return false if @container.length < 1

    @elements = {
      $menu: @container.find('.landing-nav')
      $menuToggle: @container.find('.menu-toggle')
    }

    @init()
    @bindEvents()

  init: ->
    @menuHeight = @elements.$menu[0].scrollHeight;

  bindEvents: ->
    $menu = @elements.$menu

    @container.on 'click', '.menu-toggle', (event) =>
      if $menu.hasClass('open')
        $menu.removeClass('open').height(0)
      else
        $menu.addClass('open').height(@menuHeight)

$ ->
  menu = new LandingMenu('.landing-menu')