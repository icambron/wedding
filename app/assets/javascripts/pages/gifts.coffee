$ ->
  $("#gift-submit").click (e) ->
    $(@).prop('disabled', true)
    $("#gift-loader").show()
    this.form.submit()
    false
