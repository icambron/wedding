class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :this_family
  helper_method :current_family
  helper_method :family_signed_in?
  helper_method :admin?

  before_filter do
    @current_family = current_family
    true
  end

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

    @real_family =
      if params[:iam]
        family = Family.authenticate params[:iam], params[:secret]
        session[:family_id] = family.id if family
        session[:acting_family_id] = nil
        family
      elsif session[:family_id]
        Family.find session[:family_id]
      end

    return nil unless @real_family

    @acting_family =
      if params[:become] && @real_family && @real_family.admin
        Family.find params[:become]
      elsif session[:acting_family_id]
        Family.find session[:acting_family_id]
      else
        @real_family
      end

    session[:acting_family_id] = @acting_family.id

    @acting_family

  end

  def family_signed_in?
    current_family.present?
  end

  def admin?
    current_family && current_family.admin
  end
end
