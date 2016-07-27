class CreateRefAddressTypes < ActiveRecord::Migration
  def change
    create_table :ref_address_types do |t|
      t.string :address_type_code
      t.string :address_type_description
    end
  end
end
