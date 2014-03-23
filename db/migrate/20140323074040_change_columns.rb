class ChangeColumns < ActiveRecord::Migration
  def change
  	  change_column :parks, :img_url, :text
  end
end
