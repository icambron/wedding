class AddVisited < ActiveRecord::Migration
  def up
    add_column :families, :visited, :boolean, null: false, default: false
  end

  def down
  end
end
