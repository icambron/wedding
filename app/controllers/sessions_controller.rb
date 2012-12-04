class SessionsController < ApplicationController

  def new
  end

  def log_out
    session[:family_id] = nil
    session[:acting_family_id] = nil
    redirect_to action: :new
  end

end
