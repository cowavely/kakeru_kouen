class AddImgUrlToPark < ActiveRecord::Migration
  def change
    add_column :parks, :img_url, :string
  end
end
