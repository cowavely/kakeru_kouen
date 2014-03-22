class AddBooleansToParks < ActiveRecord::Migration
  def change
  	add_column :parks, :hasToilet, :boolean
  	add_column :parks, :hasWater, :boolean
  	add_column :parks, :hasNature, :boolean
  	add_column :parks, :hasBench, :boolean
  	add_column :parks, :hasParking, :boolean
  	add_column :parks, :hasSports, :boolean
  	add_column :parks, :hasPlayground, :boolean
  end
end
