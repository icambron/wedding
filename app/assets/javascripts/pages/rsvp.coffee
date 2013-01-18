$ ->
  FB.init(appId: fbAppId)

  $(".fb-user-picker").click (e) ->
    $scope = $(@).parents(".person")
    e.stopPropagation()
    e.preventDefault()
    $("#fb-friends").fbFriends
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
