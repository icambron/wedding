class Person

  property :id, Serial
  property :name, String
  property :attending, Boolean
  property :food_choice, String
  property :fb_id, String
  property :email, String

  belongs_to :family
end
