class CreateHouseholdMembers < ActiveRecord::Migration
  def change
    create_table :household_members do |t|
      t.belongs_to :user, index: true
      t.string :first_name
      t.string :last_name
      t.string :relationship
      t.date :dob
      t.string :gender
      t.string :ethnicity
      t.timestamps
    end
  end
end
