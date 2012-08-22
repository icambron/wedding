class InfoController < ApplicationController

  def index
    @tab = 'info'
  end

  def contact
    @tab = 'contact'
  end

  def registry
    @tab = 'registry'
  end

end
