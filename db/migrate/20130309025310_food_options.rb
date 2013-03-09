class FoodOptions < ActiveRecord::Migration
  def up
    add_column :people, :food, :string
  end

  def down
  end
end
