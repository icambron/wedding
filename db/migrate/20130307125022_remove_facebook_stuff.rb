class RemoveFacebookStuff < ActiveRecord::Migration
  def up
    remove_column :people, "fb_token"
    remove_column :people, "fb_token_expires_at"
    remove_column :people, "fb_gender"
    remove_column :people, "fb_email"
  end

  def down
  end
end
