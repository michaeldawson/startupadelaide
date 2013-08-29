class RefactorNodes < ActiveRecord::Migration
  def change

	remove_column :nodes, :what
	remove_column :nodes, :who_for
	remove_column :nodes, :more

	add_column :nodes, :sponsor, :string
	add_column :nodes, :description, :string
	add_column :nodes, :owner, :string
	add_column :nodes, :phone, :string
	add_column :nodes, :champion, :string
	add_column :nodes, :champion_contact, :string
  end
end
