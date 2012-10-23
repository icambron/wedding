class AddRepondedToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :responded, :boolean, null: false, default: false
  end
end
