window.addFields = (parent, association, content) ->
  newId = new Date().getTime()
  regexp = new RegExp "new_" + association, "g"
  $(parent).append(content.replace regexp, newId)
