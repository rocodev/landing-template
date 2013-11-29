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
    @transformStyle = "translateY(-#{@menuHeight}px)"
    @container.css('transform', @transformStyle)

    if (typeof document.body.ontouchstart isnt "undefined")
      @container.addClass('touch') # To prevent hover style

  bindEvents: ->
    $menu = @elements.$menu

    @container.on 'click', '.menu-toggle', (event) =>
      if @container.hasClass('open')
        @container.removeClass('open').css('transform', @transformStyle)
      else
        @container.addClass('open').css('transform', "translateY(0)")

# Fire init scripts ASAP
menu = new LandingMenu('.landing-menu')
