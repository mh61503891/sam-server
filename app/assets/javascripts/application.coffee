#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require bootstrap-table
#= require bootstrap-table/dist/extensions/mobile/bootstrap-table-mobile
#= require_tree .

@link_to_url_with_name = (value, row) ->
  "<a href=\"#{row.url}\">#{row.name}</a>"

@mail_to = (value, row) ->
  if row.email
    "<a href=\"mailto:#{row.email}\">#{row.email}</a>"
  else
    ""

$ ->
  $('table[data-toggle="table"]').on 'load-success.bs.table', (event, object) ->
    $(".badge.#{object.name}.count").html(object.total)
