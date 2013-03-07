class InfoController < ApplicationController

  def index
    @tab = 'info'
  end

  def contact
    @tab = 'contact'
  end

  def photos
    @tab = 'photos'
  end

end
