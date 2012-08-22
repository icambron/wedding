class FamiliesController < ApplicationController
  #todo - access control

  def index
    @families = Family.all
  end

  def new
    @family = Family.new
    4.times { @family.people << Person.new}
  end

  def create
    @family = Family.new(params[:family])
    @family.save
    redirect_to action: :index
  end

  def edit
    @family = Family.find(params[:id])
    (4 - @family.people.size).times { @family.people.build}
  end

  def update
    family = Family.find(params[:id])
    family.update_attributes(params[:family])
    redirect_to action: :index
  end

  def destroy
    Family.find(params[:id]).destroy
    redirect_to action: :index
  end

end
