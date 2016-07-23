class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :line_1
      t.string  :line_2
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.string  :country
      t.float 	:latitude
      t.float 	:longitude
      t.string	:address_type
			t.references :addressable, polymorphic: true, index: true
      t.timestamps
    end
 
  end
end