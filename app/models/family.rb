class Family < ActiveRecord::Base
  include BCrypt

  has_many :people
  accepts_nested_attributes_for :people, allow_destroy: true, reject_if: ->(p){p[:name].blank?}
  before_save :encrypt_token

  def self.authenticate(id, token)
    family = Family.find(id)
    if family && family.token == token
      family
    else
      nil
    end
  end

  def encrypt_token
    if !self.token_hashed || @token_raw
      @token_raw ||= SecureRandom.urlsafe_base64
      self.token_hashed = Password.create(@token_raw)
    end
    true
  end

  def token
    @token ||= Password.new(self.token_hashed)
  end

  def reset_token
    @token_raw = SecureRandom.urlsafe_base64
    @token_raw
  end
end
