class CreateDwellingCategory < ActiveRecord::Migration
  def change
    create_table :dwelling_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
