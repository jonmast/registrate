check_select = ->
  val = $('select#animal_registration_type').val()
  if val == 'Percentage'
    $('.animal_percentage').show().find('input').val('')
  else
    $('.animal_percentage').hide().find('input').val('100')

$(document).on 'page:change', ->
  $('select#animal_registration_type').on 'change', ->
    check_select()
  check_select()
