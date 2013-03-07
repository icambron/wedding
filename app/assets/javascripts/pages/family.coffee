$ ->
  $picker = null

  $("#fb-friends").fbFriends
    immediate: false,
    initialize: false,
    login: true,
    whenDone: (friends) ->
      friend = friends[0]
      $picker.siblings(".fb-uid").val friend.id
      $picker.siblings(".fb-image").val friend.picture.data.url
      $picker.siblings('img').attr "src", friend.picture.data.url
      $picker.parents(".person").find(".name").val friend.name
    shower: (element) -> element.parents(".modal").modal "show"
    hider: (elements) -> elements.parents(".modal").modal "hide"
    additionalFields: ["username"]
    includeMe: true

  $('.delete-person').click ->
    $(this)
      .closest('.person')
      .hide()
      .find(".person-destroyer")
      .val(1)
    false

  $("#delete-family").click -> confirm "Are you sure?"
  $("#rehash-family").click -> confirm "Are you sure?"

  FB.init(appId: fbAppId)

  $(document).on "click", ".fb-picker", (e) ->
    $picker = $ @
    $("#fb-friends").fbFriends("show")
    e.stopPropagation()
    e.preventDefault()
