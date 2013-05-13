class GiftsController < ApplicationController

  before_filter :require_login
  before_filter ->{ @tab = 'gifts' }

  def index
    first_editable = current_family.people.first
    @gift = Gift.new(family: current_family, name: first_editable.nil? ? "" : first_editable.name)
    @date = Date.today
  end

  def create
    @gift = Gift.new(params[:gift].merge(family: current_family))

    @gift.card_year = params[:card_year].to_i
    @gift.card_month = params[:card_month].to_i

    @date = Date.civil @gift.card_year, @gift.card_month

    @gift.submit_and_save

    if @gift.errors.count == 0
      redirect_to action: :thanks
    else
      render :index
    end
  end

  def thanks
  end

  private

  def numeric?(str)
    Float(str) != nil rescue false
  end

  def round(str)
    Float(str).round()
  end
end
