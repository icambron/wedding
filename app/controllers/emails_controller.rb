class EmailsController < ApplicationController
  before_filter :require_login

  def index
    @family = current_family
    render params[:template]
  end

end
