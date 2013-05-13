class AddGifts < ActiveRecord::Migration
  def up
    create_table :gifts do |t|
      t.integer :family_id, null: false
      t.integer :amount
      t.string :stripe_id
    end
  end

  def down
    drop_table :gifts
  end
end
