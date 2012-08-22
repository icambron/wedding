class Family < ActiveRecord::Base

  has_many :people, dependent: :destroy
  accepts_nested_attributes_for :people, allow_destroy: true, reject_if: ->(p){p[:name].blank?}


end
