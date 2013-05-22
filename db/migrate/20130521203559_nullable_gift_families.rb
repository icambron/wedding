class NullableGiftFamilies < ActiveRecord::Migration
  def up
    drop_table :gifts
  end

  def down
  end
end
