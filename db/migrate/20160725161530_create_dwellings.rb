class CreateDwellings < ActiveRecord::Migration
	def change
		create_table :dwellings do |t|
			t.string :dwelling_name
			t.string :dwelling_description
      t.timestamps
		end
	end
end
