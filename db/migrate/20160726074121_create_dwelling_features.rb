class CreateDwellingFeatures < ActiveRecord::Migration
  def change
    create_table :dwelling_features do |t|
    	t.belongs_to :amenity, index: true
    	t.belongs_to :dwelling, index: true
    	t.boolean :has_amenity?
    end
  end
end
