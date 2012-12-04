task reset_password: :environment do
  family = Family.where(admin: true).first
  token = SecureRandom.urlsafe_base64
  family.new_token = token
  family.save
  puts token
end
