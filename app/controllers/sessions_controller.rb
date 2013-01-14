class SessionsController < ApplicationController

  def new
    @from = params[:from]
  end

  def create
    facebook_id = request.env['omniauth.auth'].uid
    person = Person.where(fb_uid: facebook_id.to_s).first

    if person
      session[:family_id] = person.family.id
      from = request.env['omniauth.origin'] || '/'
      redirect_to from
    else
      redirect_to action: :unknown_account
    end
  end

  def unknown_account
  end

  def admin_required
  end

  def fail
    @from = request.env['omniauth.origin'] || '/'
    render :new
  end

  def log_out
    session[:family_id] = nil
    session[:acting_family_id] = nil
    redirect_to action: :new
  end

end
