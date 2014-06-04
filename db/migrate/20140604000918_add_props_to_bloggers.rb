class AddPropsToBloggers < ActiveRecord::Migration
  def change
    add_column :bloggers, :first_name, :string
    add_column :bloggers, :last_name, :string
    add_column :bloggers, :provider, :string
    add_column :bloggers, :uid, :string
    add_column :bloggers, :oauth_token, :string
    add_column :bloggers, :oauth_expires_at, :datetime
  end
end
