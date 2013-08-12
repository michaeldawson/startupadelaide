class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.string :link_url
      t.string :social_key
      t.integer :node_id

      t.timestamps
    end
  end
end
