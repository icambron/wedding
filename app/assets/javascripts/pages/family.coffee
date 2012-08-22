$ ->
  $('.delete-person').click ->
    $(this)
      .closest('.person')
      .hide()
      .find("input[name='_delete']")
      .val(1)
    console.log "hi"
    false
