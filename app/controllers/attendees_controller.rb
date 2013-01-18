class AttendeesController < ApplicationController
  before_filter :require_login

  def index
    @people = Person.where(attending: true).order(:name)
  end

end
