class GiftsController < ApplicationController

  before_filter ->{ @tab = 'gifts' }

  def index
    first_editable = current_family.present? ? current_family.people.first : nil
    @gift = Gift.new(name: first_editable.nil? ? "" : first_editable.name)
    @date = Date.today
  end

  def create
    @gift = Gift.new(params[:gift])

    @gift.card_year = params[:card_year].to_i
    @gift.card_month = params[:card_month].to_i

    @date = Date.civil @gift.card_year, @gift.card_month

    @gift.submit!

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
