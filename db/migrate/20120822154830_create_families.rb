class CreateFamilies < ActiveRecord::Migration
  def up
    create_table :families do |t|
      t.string :name
    end
  end

  def down
    drop_table :families
  end
end
