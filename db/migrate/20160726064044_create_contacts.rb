class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
			t.belongs_to :dwelling, index: true
      t.string :first_name
      t.string :last_name
      t.bigint :phone_number
      t.string :email_address
      t.timestamps
    end
  end
end
