class Person < ActiveRecord::Base
  belongs_to :family
  before_save :encrypt_token
  attr_accessor :token

  def self.authenticate(id, token)
    person = Person.find(id)
    if person && person.token_hashed == BCrypt::Engine.hash_secret(token, user.token_salt)
      user
    else
      nil
    end
  end

  def self.encrypt_token
    if token.present?
      self.token_salt = BCrypt::Engine.generate_salt
      self.token_hash = BCrypt::Engine.hash_secret(token, password_salt)
    end
  end
end
