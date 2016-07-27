class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.references :ref_address_type, index: true, foreign_key: true
    end
  end
end
