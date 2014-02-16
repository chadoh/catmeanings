# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require jquery.ui.sortable
#= require foundation
#= require turbolinks
#= require_tree .
#
jQuery ->
  $(document).foundation()

$(document).on "click", "[data-behavior='submit-on-click'] input", ->
  $(this).closest('form').submit()

$(document).on "click", "[data-behavior='close-tip-form']", (e) ->
  e.preventDefault()
  $(this).closest(".page").find(".new-tip").show()
  $(this).closest(".tip").remove()

currentSearch = null

searchForPages = ->
  form = $("#search form")
  currentTerm = form.serialize()
  $.ajax
    url: form.attr("action")
    data: currentTerm
    cache: false
    complete: ->
      currentSearch = null
      searchForPagesWithDelay() unless currentTerm == form.serialize()

searchForPagesWithDelay = ->
  unless currentSearch
    currentSearch = setTimeout searchForPages, 200

$(document).on "input", "#search input", ->
  $("#add #page_name").val( $(this).val() )
  searchForPagesWithDelay()

$(document).on "input", "#add #page_name", ->
  $("#search input").val( $(this).val() )
  searchForPagesWithDelay()

window.sortableOptions =
  handle: ".handle-and-icon"
  stop: (event, ui) ->
    tip_id = ui.item.attr('id').split('-')[1]
    new_position = ui.item.index()
    $.ajax
      type: 'PATCH'
      url: "/tips/#{tip_id}"
      dataType: 'json'
      data: { tip: { position_position: new_position } }

$(".tips").sortable(sortableOptions)

$(document).on "keyup", (e) ->
  if $("input:focus").length is 0 and $("textarea:focus").length is 0 and e.keyCode is 191
    $("#search input").focus()

$(document).on "click", "a[href='#settings']", (e) ->
  e.preventDefault()
  $('.settings').slideToggle()
