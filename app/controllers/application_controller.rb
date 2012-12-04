class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_family
  helper_method :family_signed_in?
  helper_method :admin?

  private

  def require_login
    unless family_signed_in?
      redirect_to controller: :sessions, action: :new
    end
  end

  def require_admin
    unless admin?
      redirect_to controller: :sessions, action: :new
    end
  end

  def current_family
    if session[:family_id]
      @current_family ||= Family.find(session[:family_id])
    elsif params[:iam] && params[:secret]
      @current_family ||= Family.authenticate params[:iam], params[:secret]
      session[:family_id] = @current_family.id if @current_family
    end
    @current_family
  end

  def family_signed_in?
    current_family.present?
  end

  def admin?
    current_family && current_family.admin
  end
end
