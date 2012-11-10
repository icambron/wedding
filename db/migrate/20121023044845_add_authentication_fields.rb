class AddAuthenticationFields < ActiveRecord::Migration
  def change
    add_column :families, :admin, :boolean, null: false, default: false
    add_column :family, :token_hashed, :string
    add_column :family, :token_salt, :string

    add_column :people, :fb_nickname, :string
    add_column :people, :fb_uid, :string
    add_column :people, :fb_image, :string
    add_column :people, :fb_token, :string
    add_column :people, :fb_token_expires_at, :integer
    add_column :people, :fb_gender, :string
    add_column :people, :fb_email, :string

  end
end
