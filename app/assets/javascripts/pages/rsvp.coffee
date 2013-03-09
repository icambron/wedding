$ ->
  FB.init(appId: fbAppId)

  $scope = null

  $("#fb-friends-rsvp").fbFriends
    immediate: false,
    initialize: false,
    login: true,
    whenDone: (friends) -> 
      friend = friends[0]
      $scope.find(".fb-image").val friend.picture.data.url
      $scope.find(".fb-uid").val friend.id
      $scope.find('img').attr "src", friend.picture.data.url
      $scope.find(".person-label").val friend.name
    shower: (element) -> element.parents(".modal").modal "show"
    hider: (elements) -> elements.parents(".modal").modal "hide"
    additionalFields: ["username"]
    includeMe: true

  $(".fb-user-picker").click (e) ->
    e.stopPropagation()
    e.preventDefault()
    $scope = $(@).parents(".person")
    console.log "scope", $scope
    $("#fb-friends-rsvp").fbFriends "show"
