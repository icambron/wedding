module FamiliesHelper

  def authenticated_url(family)
    "#{root_url}?iam=#{family.id}&secret=#{family.token}"
  end

end
