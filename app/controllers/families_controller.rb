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
    @family = Family.get(params[:id])
    (4 - @family.people.size).times { @family.people << Person.new}
  end

  def update
    family = Family.get(params[:id])
    family.update(params[:family])
    redirect_to action: :index
  end

  def destroy
    Family.get(params[:id]).destroy
    redirect_to action: :index
  end

end
