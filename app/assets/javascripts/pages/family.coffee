$ ->
  $('.delete-person').click ->
    $(this)
      .closest('.person')
      .hide()
      .find(".person-destroyer")
      .val(1)
    false
