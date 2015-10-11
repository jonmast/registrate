checkRegType = ->
  val = $('select#animal_registration_type').val()
  if val == 'Percentage'
    $('.animal_percentage').show().find('input').val('')
  else
    $('.animal_percentage').hide().find('input').val('100')

checkBirthType = ->
  val = $('input#animal_birth_type').val()
  if val == '0'
    $('.animal_embryo_transfer').show()
  else
    $('.animal_embryo_transfer').hide()

$(document).on 'page:change', ->
  $('select#animal_registration_type').on 'change', ->
    checkRegType()
  $('input#animal_birth_type').on 'change', ->
    checkBirthType()
  checkRegType()
  checkBirthType()
