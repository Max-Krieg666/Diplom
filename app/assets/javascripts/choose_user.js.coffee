$(document).on 'change', '#user_role', ->
  chosen = $('#user_role').val()
#  group = document.getElementById()
  group = $('#choose-group')
  btn = document.getElementsByClassName('multiselect dropdown-toggle btn btn-default')[1]
  if chosen == '1' || chosen == '2'
    group.attr('disabled', 'disabled')
    group.empty()
    btn.classList.add('disabled')
  else
    group.removeAttr('disabled')
    btn.classList.remove('disabled')
  console.log btn.classList