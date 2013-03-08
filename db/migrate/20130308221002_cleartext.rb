class Cleartext < ActiveRecord::Migration
  def up
    remove_column :families, :token_hashed
    add_column :families, :token, :string

    Family.all.each do |family|
      family.reset_token
      family.save
    end

  end

  def down
  end
end
