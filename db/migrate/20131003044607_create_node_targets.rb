class CreateNodeTargets < ActiveRecord::Migration
  def change
    create_table :nodes_targets, :id => false do |t|
      t.references :node, :target
    end

    add_index :nodes_targets, [:node_id, :target_id],
      unique: true
  end
end
