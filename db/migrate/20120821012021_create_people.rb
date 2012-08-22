class CreatePeople < ActiveRecord::Migration
  def up
    create_table :people do |t|
      t.string :name, null: false
      t.boolean :attending, null: false
      t.string :email
      t.string :fb_id
      t.integer :family_id
    end
  end

  def down
    drop_table :people
  end
end
