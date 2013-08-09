class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :size
      t.string :cat_class

      t.timestamps
    end
  end
end
