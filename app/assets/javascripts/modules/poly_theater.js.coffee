#= require jquery.inview
#= require_self

class PolyTheather
  constructor: (@container) ->
    @container = $(@container)
    return false if @container.length < 1

    @fallbackElements = @container.find('[data-theater=fallback]')
    @displayElements = @container.find('[data-theater=content]')
    @theaterType = @container.data('fill')

    @init()

  init: ->
    @replaceContent()
    @activate()

  replaceContent: ->
    if @checkReplaceCriteria()
      @fallbackElements.addClass('hide')
      @displayElements.removeClass('hide')

  checkReplaceCriteria: ->
    false

class VideoPolyTheater extends PolyTheather
  checkReplaceCriteria: ->
    switch @theaterType
      when "video"
        @videoElements = @displayElements.find('video')
        return true if @videoElements.length > 0 and @videoElements.get(0).canPlayType?
      else
        return false

  activate: ->
    @container.on 'inview', (event, isInView, visiblePartX, visiblePartY) =>
      if isInView and visiblePartY is ("both" or "bottom")
        @container.off('inview')
        @videoElements.each (index, video) ->
          $(video).on 'ended', (event) ->
            event.currentTarget.controls = true
            $(event.currentTarget).off('ended')
          video.play()

$ ->
  videoTheater = new VideoPolyTheater('.poly-theater')
