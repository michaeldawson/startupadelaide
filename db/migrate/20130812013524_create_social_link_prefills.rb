class CreateSocialLinkPrefills < ActiveRecord::Migration
  def change
    create_table :social_link_prefills do |t|
      t.string :name

      t.timestamps
    end
  end
end
