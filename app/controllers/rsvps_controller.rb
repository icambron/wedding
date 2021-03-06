class RsvpsController < ApplicationController
  before_filter :require_login

  def show
    if current_family.responded
      render :already_responded
    else
      render :show
    end
  end

  def check
    @edited_family = Family.new(params[:family])
  end

  def confirm
    @edited_family = Family.new(params[:family])

    current_people = Hash[current_family.people.map{|p| [p.id, p]}]

    @edited_family.people.each do |person|
      current_person = current_people[person.temp_id.to_i]

      next unless current_person

      if current_person.user_editable
        current_person.name = person.name
        current_person.fb_uid = person.fb_uid unless person.fb_uid.blank?
        current_person.fb_image = person.fb_image unless person.fb_image.blank?
      end

      current_person.food = person.food
      current_person.attending = person.attending
      current_person.save!
    end

    current_family.responded = true

    current_family.save!

  end
end
