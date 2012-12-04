class Person < ActiveRecord::Base
  belongs_to :family

  def temp_id
    @temp_id || self.id
  end

  def temp_id=(new_id)
    @temp_id = new_id
  end
end
