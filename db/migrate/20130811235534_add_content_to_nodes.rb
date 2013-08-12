class AddContentToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :what, :text
    add_column :nodes, :who_for, :text
    add_column :nodes, :more, :text
  end
end
