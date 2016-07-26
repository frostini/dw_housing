class CreateDwellingDetails < ActiveRecord::Migration
  def change
    create_table :dwelling_details do |t|
      t.belongs_to :dwelling, index: true
      t.string :key
      t.string :value
    end
  end
end
