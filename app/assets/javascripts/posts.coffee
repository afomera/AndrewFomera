# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Markdown previews to comments
class PostPreview
  constructor: (element) ->
    @element = $(element)
    @commentField = @element.find("[data-behavior~='post-content']")
    @previewArea = @element.find("[data-behavior='post-preview']")
    @setEvents()

  setEvents: ->
    @commentField.on "focusout", @handlePreview
    @commentField.on "change", @handlePreview
    @commentField.on "keyup", @handlePreview

  handlePreview: =>
    html = marked @commentField.val()
    document.getElementById('preview').innerHTML = html;

document.addEventListener 'turbolinks:load', ->
  $.each $("[data-behavior='post-form']"), (i, element)->
    new PostPreview(element)
