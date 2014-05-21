class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :body
      t.references :admin_user, index: true

      t.timestamps
    end
  end
end
