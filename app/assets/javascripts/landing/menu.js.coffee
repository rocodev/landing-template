class LandingMenu
  constructor: (containerSelector) ->
    @container = $(containerSelector);
    return false if @container.length < 1

    @elements = {
      $menu: @container.find('.landing-nav')
      $menuToggle: @container.find('.menu-toggle')
    }
    @inOffCanvasMenu = false
    @breakPoint = 600

    @init()
    @bindEvents()

  init: ->
    if (typeof document.body.ontouchstart isnt "undefined")
      @container.addClass('touch') # To prevent hover style

    @toggleOffCanvasMenu()

  calcMenuInfo: ->
    @menuHeight = @elements.$menu[0].scrollHeight;
    @transformStyle = "translateY(-#{@menuHeight}px)"

  initOffCanvasMenu: ->
    @calcMenuInfo()
    @container.css('transform', @transformStyle)
    @inOffCanvasMenu = true

    setTimeout =>
      @container.addClass('off-canvas-transition')
    , 50

  disableOffCanvasMenu: ->
    @container.removeClass('open off-canvas-transition').css('transform', '')
    @inOffCanvasMenu = false

  toggleOffCanvasMenu: (initDelay = 0) ->
    if window.innerWidth > @breakPoint and @inOffCanvasMenu
      @disableOffCanvasMenu()
    else if window.innerWidth <= @breakPoint and !@inOffCanvasMenu
      setTimeout =>
        @initOffCanvasMenu()
      , initDelay

  bindEvents: ->
    @container.on 'click', '.menu-toggle', (event) =>
      if @container.hasClass('open')
        @container.removeClass('open').css('transform', @transformStyle)
      else
        @container.addClass('open').css('transform', "translateY(0)")

    $(window).on 'resize', (event) =>
      @toggleOffCanvasMenu()


# Fire init scripts ASAP
menu = new LandingMenu('.landing-menu')
