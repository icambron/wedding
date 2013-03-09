module FamiliesHelper

  def authenticated_url(family)

    options = {host: ENV["WEDDING_HOST"]}

    "#{root_url(options)}?iam=#{family.id}&secret=#{family.token}"
  end

end
