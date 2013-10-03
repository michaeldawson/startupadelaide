class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :name
      t.string :cat_class

      t.timestamps
    end
  end
end
