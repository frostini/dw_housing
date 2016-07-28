class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :gender_group
      t.timestamps
    end
  end
end
