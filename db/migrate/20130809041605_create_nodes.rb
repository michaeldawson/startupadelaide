class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :category_id
      t.string :name
      t.string :contact
      t.string :street
      t.string :city

      t.timestamps
    end
  end
end
