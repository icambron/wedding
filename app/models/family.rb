class Family < ActiveRecord::Base
  include BCrypt

  has_many :people
  has_many :gifts
  accepts_nested_attributes_for :people, allow_destroy: true, reject_if: ->(p){p[:name].blank?}
  before_save :ensure_token

  def self.authenticate(id, token)
    family = Family.find(id)
    if family && family.token == token
      family
    else
      nil
    end
  end

  def reset_token
    self.token = SecureRandom.urlsafe_base64
  end

  def ensure_token
    reset_token unless self.token
  end

end
