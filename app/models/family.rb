class Family < ActiveRecord::Base
  include BCrypt

  has_many :people
  accepts_nested_attributes_for :people, allow_destroy: true, reject_if: ->(p){p[:name].blank?}
  before_save :encrypt_token
  attr_accessor :new_token

  def self.authenticate(id, token)
    family = Family.find(id)
    if family && family.token == token
      family
    else
      nil
    end
  end

  def encrypt_token
    if self.new_token
      token = self.new_token
    else
      unless self.token_hashed
        token = SecureRandom.urlsafe_base64
      end
    end

    if token
      self.token_hashed = Password.create(token)
    end
  end

  def token
    @token ||= Password.new(self.token_hashed)
  end
end
