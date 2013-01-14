class CleanupPeople < ActiveRecord::Migration
  def up
    remove_column :people, :fb_id
    remove_column :people, :fb_nickname
  end

  def down
  end
end
