class FamiliesController < ApplicationController
  before_filter :require_admin

  def index
    @families = Family.includes(:people)
  end

  def new
    @family = Family.new
    2.times { @family.people << Person.new }
  end

  def create
    @family = Family.new params[:family]
    @family.save
    redirect_to action: :index
  end

  def edit
    @family = Family.find(params[:id])
    (2 - @family.people.size).times { @family.people.build }
  end

  def update
    family = Family.find(params[:id])
    family.update_attributes(params[:family])
    redirect_to action: :index
  end

  def destroy
    f = Family.find params[:id]
    f.people.each {|p| p.destroy}
    f.destroy
    redirect_to action: :index
  end

  def rehash
    @family = Family.find params[:family_id]
    @token = @family.reset_token
    @family.save
    redirect_to action: :edit
  end

end
