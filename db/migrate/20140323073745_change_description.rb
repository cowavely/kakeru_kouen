class ChangeDescription < ActiveRecord::Migration
  def change
  	change_column :parks, :description, :text
  end
end
