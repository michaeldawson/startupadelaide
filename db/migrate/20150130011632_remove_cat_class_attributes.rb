class RemoveCatClassAttributes < ActiveRecord::Migration
  def change
    remove_column :categories, :cat_class, :string
    remove_column :targets, :cat_class, :string
  end
end
