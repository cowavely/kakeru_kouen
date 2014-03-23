class AddFlagsToPark < ActiveRecord::Migration
  def change
    add_column :parks, :flags, :integer, default: 0
  end
end
