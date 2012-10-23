class MakeSomeGuestsUserEditable < ActiveRecord::Migration
  def change
    add_column :people, :user_editable, :boolean, null: false, default: false
  end
end
