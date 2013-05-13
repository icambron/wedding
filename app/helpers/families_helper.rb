module FamiliesHelper

  def authenticated_url(family, path = nil)

    options = {host: ENV["WEDDING_HOST"]}

    full = root_url(options)
    full = URI::join(full, path) if path
    full += "?iam=#{family.id}&secret=#{family.token}"
    full
  end

end
