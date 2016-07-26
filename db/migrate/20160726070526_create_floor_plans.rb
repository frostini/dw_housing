class CreateFloorPlans < ActiveRecord::Migration
  def change
    create_table :floor_plans do |t|
      t.belongs_to :dwelling, index: true
      t.float :bedrooms
      t.float :baths
      t.integer :occupant_min
      t.integer :occupant_max
      t.integer :mo_rent_min
      t.integer :mo_rent_max
      t.integer :sq_ft_min
      t.integer :sq_ft_max
      t.timestamps
    end
  end
end
